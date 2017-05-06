#lang sicp
(define (even? n) (= (remainder n 2) 0))
(define (square x) (* x x))
(define (fast-exp b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-exp b (/ n 2))))
        (else (* b (fast-exp b (- n 1))))))

; Not an optimal version but works. 
(define (cons x y)
  (* (fast-exp 2 x) (fast-exp 3 y)))

(define (car-iter val)
  (cond ((= (remainder val 3) 0) (car-iter (/ val 3)))
        (else val)))
(define (car-value val)
  (cond ((= val 1) 0)
        (else (+ 1 (car-value (/ val 2))))))

(define (cdr-iter val)
  (cond ((= (remainder val 2) 0) (cdr-iter (/ val 2)))
        (else val)))
(define (cdr-value val)
    (cond ((= val 1) 0)
        (else (+ 1 (cdr-value (/ val 3))))))
  

(define (car z)
  (car-value (car-iter z)))
(define (cdr z)
  (cdr-value (cdr-iter z)))

(car (cons 5 6))
(cdr (cons 5 6))
