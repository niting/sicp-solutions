#lang sicp
(define (square a) (* a a))
(define (square-greatest? a b c)
  (cond ((and (<= a b) (<= a c)) (+ (square b) (square c)))
        ((and (<= b a) (<= b c)) (+ (square a) (square c)))
        (else (+ (square a) (square b)))))

(square-greatest? 4 3 5)
(square-greatest? 1 2 3)
(square-greatest? 3 2 1)
(square-greatest? 1 1 2)
       
