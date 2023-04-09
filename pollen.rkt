#lang racket/base
(require pollen/core pollen/setup pollen/decode pollen/misc/tutorial txexpr)
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
