#lang sicp
(define (square n) (* n n))
(define (sum term a next b)
  (define (iter a result)
    (if (> a b) 
        result
        (iter (+ a 1) (+ result (term a)))))
  (iter a 0))

(sum square 0 (lambda x (+ x 1)) 3)
(sum square 5 (lambda x (+ x 1)) 3)
(sum square 0 (lambda x (+ x 1)) 4)


