#lang sicp
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
; Normal order should not require the value of p until later.
;(if (= 0 0) 0 (p)) -> 0

; Applicative order should ideally give an infinite recursion error on operand evaluation because p is defined in its own terms. 
