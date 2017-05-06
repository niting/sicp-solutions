#lang sicp
(define (C n r )
  (cond ((= r 0) 1)
        ((= n r) 1)
        (else (+ (C (- n 1) r) (C (- n 1) (- r 1))))))

(C 4 2)
(C 0 0)
