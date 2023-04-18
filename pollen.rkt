#lang racket/base
(require pollen/tag
         pollen/setup
         pollen/decode
         pollen/misc/tutorial
         racket/list
         racket/string
         racket/match
         txexpr)
(provide (all-defined-out))

; Project metadata

(define author "Ondřej Nývlt")
(define theme-color "hsl(5 70% 45%)")

; Pollen setup

(module setup racket/base
  (provide (all-defined-out))
  (define poly-targets '(html context)))

; Transform output

(define (root . elements)
  (case (current-poly-target)
    [(context) (txexpr 'root empty elements)]
    [else
     (define (smart-typography xexpr)
       (smart-quotes
        xexpr
        #:double-open "„" #:double-close "“"
        #:single-open "‚" #:single-close "‘"))
     (txexpr
      'root empty
      (decode-elements
       elements
       #:txexpr-elements-proc decode-paragraphs
       #:string-proc smart-typography))]))

; Emphasis (= usually italics)
(define (em . elements)
  (case (current-poly-target)
    [(context) (context-group "em" elements)]
    [else (txexpr 'em empty elements)]))

; Strong emphasis (= usually bold text)
(define (strong . elements)
  (case (current-poly-target)
    [(context) (context-group "bf" elements)]
    [else (txexpr 'strong empty elements)]))

(define (title . elements)
  (case (current-poly-target)
    [(context) (context-tag "chapter" elements)]
    [else (txexpr 'h1 empty elements)]))

(define (heading . elements)
  (case (current-poly-target)
    [(context) (context-tag "section" elements)]
    [else (txexpr 'h2 empty elements)]))

(define (subheading . elements)
  (case (current-poly-target)
    [(context) (context-tag "subsection" elements)]
    [else (txexpr 'h3 empty elements)]))

(define (numbered-list . elements)
  (case (current-poly-target)
    [(context) (context-environment "itemize" elements #:params "n")]
    [else (txexpr 'ol empty elements)]))

(define (bulleted-list . elements)
  (case (current-poly-target)
    [(context) (context-environment "itemize" elements)]
    [else (txexpr 'ul empty elements)]))

(define (item . elements)
  (case (current-poly-target)
    [(context) (context-tag "item" elements)]
    [else (txexpr 'li empty elements)]))

(define (blockquote . elements)
  (case (current-poly-target)
    [(context) (context-environment "blockquote" elements)]
    [else (txexpr 'blockquote empty elements)]))

(define-tag-function (quick-table attrs elements)
  ; (listof (listof string))
  (define rows-of-text-cells
    (let ([text-rows (filter-not whitespace? elements)])
      (for/list ([text-row (in-list text-rows)])
        (for/list ([text-cell (in-list (string-split text-row "|" #:trim? #f))])
          (string-trim text-cell)))))

  (case (current-poly-target)
    [(context)
     (define context-rows
       (for/list ([row (in-list rows-of-text-cells)])
         (string-join row "\\NC " #:before-first "\\NC " #:after-last " \\AR\n")))

     (define context-table
       (context-environment
        "table" context-rows
        #:params (cadr (assoc 'coldef attrs))))

     context-table]
    [else
     (match-define (list tr-tag td-tag th-tag) (map default-tag-function '(tr td th)))

     (define html-rows
       (match-let ([(cons header-row other-rows) rows-of-text-cells])
         (cons (map th-tag header-row)
               (for/list ([row (in-list other-rows)])
                 (map td-tag row)))))

     (define html-table
       (cons 'table
             (for/list ([html-row (in-list html-rows)])
               (apply tr-tag html-row))))

     html-table]))

; Context helpers

(define (context-group name elements)
  (apply string-append `("{\\" ,name " " ,@elements "}")))

(define (context-tag name elements)
  (apply string-append `("\\" ,name "{" ,@elements "}")))

(define (context-environment name elements #:params (params #f))
  (define params-string (if params (string-append "[" params "]") ""))
  (apply string-append `("\\start" ,name ,params-string "\n" ,@elements "\n\\stop" ,name)))
