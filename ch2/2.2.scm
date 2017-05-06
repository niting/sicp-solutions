#lang sicp

(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment s)
  (make-point
   (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2.0)
   (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2.0)))

(print-point (midpoint-segment (make-segment (make-point 2 3) (make-point 5 6))))
