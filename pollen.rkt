#lang racket
(require pollen/decode pollen/misc/tutorial txexpr)
(provide (all-defined-out))

; Project metadata
(define author "Ondřej Nývlt")
(define theme-color "hsl(5 70% 45%)")

; Transform output
(define (root . elements)
  (txexpr 'root empty (decode-elements elements
    #:txexpr-elements-proc decode-paragraphs
    #:string-proc (compose1 smart-quotes smart-dashes))))
