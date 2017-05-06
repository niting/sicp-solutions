#lang sicp

; From 1.16
(define (fast-expt b n)
  (define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (* b b) (/ n 2) a))
          (else (fast-expt-iter b (- n 1) (* b a)))))
  (fast-expt-iter b n 1))

; From 1.17

(define (double n) (+ n n ))
(define (half n) (/ n 2))
(define (even? b)
  (= (remainder b 2) 0))
(define (* a b)
  (cond ((= b 0) 0)
  ((even? b) (double (* a (half b))))
  (else (+ a (double (* a (half (- b 1))))))))
(define (multi-iter a b c)
  (cond
    ((= b 0) c)
    ((even? b) (multi-iter (double a) (half b) c))
   (else (multi-iter a (- b 1) (+ c a)))))


(define (multi a b)
  (multi-iter a b 0))

(multi 6 3)
(multi 4 4)
(multi 9 9) 

