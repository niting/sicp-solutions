#lang sicp
(define (square n) (* n n))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (test-iter a n)
  (cond ((= a n) (display "Done "))
        ((= (expmod a n n) (expmod a 1 n))
         (test-iter (+ 1 a) n))
        (else (display "No "))))
         

(define (test? n)
  (test-iter 1 n))

(test? 561)
(test? 1105)
(test? 1729)
(test? 2465)
(test? 2821)
(test? 6601)
 
(test? 6)
(test? 8)
(test? 11)