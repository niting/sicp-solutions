#lang sicp
(#%require sicp-pict)

(define (make-frame1 origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

; Skipping this exercise. Too simplistic and not used after wards.


