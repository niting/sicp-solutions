#lang sicp

(define (square x)
  (* x x))
(define (cube x)
  (* x x x))
(define (crt x)
  (crt-iter 1.0 x))
(define (crt-iter guess x)
  (if (good-enough? guess x)
      guess
      (crt-iter (improve guess x) x)))
(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))
(define (improve y x)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

(crt 27)
(crt 125)
(crt 0)
