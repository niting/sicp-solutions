#lang sicp

(define (make-interval a b) (cons a b))

(define (upper-bound i)
  (cdr i))
(define (lower-bound i)
  (car i))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

; sum = (lower-bound i1 + lower-bound i2, upper-bound i1 + upper-bound i2)
; (width sum) = (+ width i1 width i2)

; Example for multiplication
; (2 3) * (4 5) -> both have widths 0.5
; (8 15) -> width = 3.5
; (4 5) * (6 7) -> both have widths 0.5
; (24 35) -> width = 5.5
; Same widths (w1 and w2 = 1) give different results (3.5 and 5.5)
