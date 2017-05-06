#lang sicp
(define (square n) (* n n))
(define (prime? n)
  (= n (smallest-divisor n)))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (next n)
  (cond ((= n 2) 3)
        (else (+ n 1))))

(next 2)
(next 5)

(timed-prime-test 1000000000063) ; 113896 - time with next
(timed-prime-test 6700417) ; 82094 - time with +1
; Comparison is probably slower than incrementing, squaring and dividing - at least on this computer. 

