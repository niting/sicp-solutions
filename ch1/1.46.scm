#lang sicp

(define (iterative-improve good-enough? improve)
  (define (iterate guess)
    (if (good-enough? guess (improve guess))
        (improve guess)
        (iterate (improve guess))))
  iterate)

(define tolerance 0.00001)
(define (fixed-point-good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
  ((iterative-improve fixed-point-good-enough? f) first-guess))

(fixed-point cos 1.0)

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))
(define (sqrt x first-guess)
  ((iterative-improve (lambda (guess y) (< (abs (- (square guess) x)) 0.001))
                      (lambda (guess) (average guess (/ x guess)))) first-guess))

(sqrt 4 1.0)

