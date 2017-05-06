#lang sicp
(define (square n) (* n n))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (cond ((= n 1) #f)
        (else (= n (smallest-divisor n)))))

(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (prime-sum a b)
  (filtered-accumulate (lambda (a b) (+ a b)) 0 (lambda (a) a) a (lambda (a) (+ a 1)) b prime?))

(prime-sum 1 10)
; 2 + 3 + 5 + 7


(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(define (relative-product n)
  (define (is-relative? a)
    (= 1 (gcd a n)))
  (let ((a 1)
        (b (- n 1)))
  (filtered-accumulate (lambda (a b) (* a b)) 1 (lambda (a) a) a (lambda (a) (+ a 1)) b is-relative?)))

; 1, 3, 7, 9
(relative-product 10)

