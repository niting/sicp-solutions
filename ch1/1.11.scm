#lang sicp

(define (f-rec n)
  (cond ((< n 3) n)
        (else (+ (f-rec (- n 1)) (* 2 (f-rec (- n 2))) (* 3 (f-rec (- n 3)))))))
(f-rec 15)
(f-rec 29)

(define (f-iter n)
  (cond ((< n 3) n)
        (else (f-comp (- n 3) 2 1 0))))

(define (sum-terms? val1 val2 val3)
  (+ val1 (* 2 val2) (* 3 val3)))
(define (f-comp ctr val1 val2 val3)
  (cond ((= ctr 0) (sum-terms? val1 val2 val3))
        (else (f-comp (- ctr 1) (sum-terms? val1 val2 val3) val1 val2))))

(f-iter 15)
(f-iter 29)