#lang sicp


(define (double n) (+ n n ))
(define (half n) (/ n 2))
(define (even? b)
  (= (remainder b 2) 0))
(define (* a b)
  (cond ((= b 0) 0)
  ((even? b) (double (* a (half b))))
  (else (+ a (double (* a (half (- b 1))))))))
   

(* 5 3)



