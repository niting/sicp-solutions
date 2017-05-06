#lang sicp
; This one is a really interesting exercise.

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum a b)
  (accumulate (lambda (a b) (+ a b)) 0 (lambda (a) a) a (lambda (a) (+ a 1)) b))

(sum 1 4)

(define (product a b)
   (accumulate (lambda (a b) (* a b)) 1 (lambda (a) a) a (lambda (a) (+ a 1)) b))
(product 2 5)

(define (accumulate-iter combiner null-value term a next b)
  (define (accumulate-steps value combiner null-value term a next b)
    (if (> a b)
        value
        (accumulate-steps (combiner value (term a)) combiner null-value term (next a) next b)))
  (accumulate-steps null-value combiner null-value term a next b))

(define (product-iter a b)
   (accumulate-iter (lambda (a b) (* a b)) 1 (lambda (a) a) a (lambda (a) (+ a 1)) b))

(product-iter 1 5)
  
      
