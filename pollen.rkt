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
    [(context) (apply string-append `("{\\em " ,@elements "}"))]
    [else (txexpr 'em empty elements)]))

(define (strong . elements)
  (case (current-poly-target)
    [(context) (apply string-append `("{\\bf " ,@elements "}"))]
    [else (txexpr 'strong empty elements)]))

(define (title . elements)
  (case (current-poly-target)
    [(context) (apply string-append `("\\chapter{" ,@elements "}"))]
    [else (txexpr 'h1 empty elements)]))

(define (heading . elements)
  (case (current-poly-target)
    [(context) (apply string-append `("\\section{" ,@elements "}"))]
    [else (txexpr 'h2 empty elements)]))

(define (subheading . elements)
  (case (current-poly-target)
    [(context) (apply string-append `("\\subsection{" ,@elements "}"))]
    [else (txexpr 'h3 empty elements)]))

(define (numbered-list . elements)
  (case (current-poly-target)
    [(context) (apply string-append `("\\startitemize[n]\n" ,@elements "\n\\stopitemize"))]
    [else (txexpr 'ol empty elements)]))

(define (bulleted-list . elements)
  (case (current-poly-target)
    [(context) (apply string-append `("\\startitemize\n" ,@elements "\n\\stopitemize"))]
    [else (txexpr 'ul empty elements)]))

(define (item . elements)
  (case (current-poly-target)
    [(context) (apply string-append `("\\item{" ,@elements "}"))]
    [else (txexpr 'li empty elements)]))

(define (blockquote . elements)
  (case (current-poly-target)
    [(context) (apply string-append `("\\startblockquote\n" ,@elements "\n\\stopblockquote"))]
    [else (txexpr 'blockquote empty elements)]))
