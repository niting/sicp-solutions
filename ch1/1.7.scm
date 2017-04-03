#lang sicp
(define (sqrt-iter guess-new guess-old x)
  (if (good-enough? guess-new guess-old x)
      guess-new
      (sqrt-iter (improve guess-new x) guess-new
                 x)))

(define (square x) (* x x))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess-new guess-old x)
  (<= (abs (- guess-new guess-old)) (* guess-old 0.00001)))
   

(define (sqrt x)
  (sqrt-iter 0.1 0.001 x))

(sqrt 0.0000000001)
(sqrt 1000000000000000)

; For really small numbers, since there are limited decimal places, this would just exit too early as it wouldn't be able to improve upon the guess anymore
; that is better than good-enough?. Specially anything smaller than 0.001 would probably run into this issue.
; For really large numbers, limited precision would limit the square root that we can compute and would just run into an infinite recursion.
; Apparently, the reasoning for large numbers is wrong : this happens because (improve guess x) would keep on running into the same value that would never be
; good-enough? due to handling of really large numbers with limited precision. 

