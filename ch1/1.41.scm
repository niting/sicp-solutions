#lang sicp
; f procedure taking one argument 
(define (double f)
  (lambda (x) (f (f x))))

(((double (double double)) inc) 5)
