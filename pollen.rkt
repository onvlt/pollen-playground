#lang racket/base
(require pollen/setup pollen/decode pollen/misc/tutorial txexpr)
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
    [else (txexpr 'root empty (decode-elements elements
      #:txexpr-elements-proc decode-paragraphs
      #:string-proc (compose1 smart-quotes smart-dashes)))]))

(define (em . elements)
  (case (current-poly-target)
    [(context) (context-group "em" elements)]
    [else (txexpr 'em empty elements)]))

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

; Context helpers
(define (context-group name elements)
  (apply string-append `("{\\" ,name " " ,@elements "}")))

(define (context-tag name elements)
  (apply string-append `("\\" ,name "{" ,@elements "}")))

(define (context-environment name elements #:params (params #f))
  (define params-string (if params (string-append "[" params "]") ""))
  (apply string-append `("\\start" ,name ,params-string "\n" ,@elements "\n\\stop" ,name)))
