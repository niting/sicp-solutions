#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-iter value n d k)
    (cond ((= k 0) value)
          (else (cont-frac-iter (/ (n k) (+ value (d k))) n d (- k 1)))))
  (cont-frac-iter 0.0 n d k))

(define (tan-cf x k)
  (define (num i)
    (if (= i 1)
        x
        (* -1.0 x x)))
  (define (den i)
    (- (* 2 i) 1))
  (cont-frac num den k))

(tan-cf 1 1000)
(tan-cf 180 1000)

(#%require (only racket/math pi))
(tan-cf pi 1000000) ; Very small value close to 0.
(tan-cf 56 1000)