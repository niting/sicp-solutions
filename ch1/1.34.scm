#lang sicp
(define (square n) (* n n))
(define (f g)
  (g 2))

(f f)
; Not a procedure error perhaps? 
