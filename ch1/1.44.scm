#lang sicp
(define (average x y z)
  (/ (+ x y z) 3))
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (cond ((= n 1) f)
        (else (compose f (repeated f (- n 1))))))

(define (square x) (* x x))

((repeated square 2) 5)

(define dx 0.001)
(define (smooth f)
  (lambda (x) (average (f x) (f (- x dx)) (f (+ x dx)))))
(define (nfoldsmoothing f)
  ((repeated smooth 1000) f))

((nfoldsmoothing square) 200)

  
