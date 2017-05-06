#lang sicp

; a = 1, b = b, n = n, 
; a = b, b = b, n = n - 1
; a = b**2, b = b, n = n - 2
; a = b**4, b = b, n = n - 4
; a = b**8, b = b, n = n - 8
; Took me sometime to figure it out. Lesson learnt : write things down on a piece of paper. 

(define (fast-expt b n)
  (define (fast-expt-iter b n a)
    (cond ((= n 0) a)
          ((even? n) (fast-expt-iter (* b b) (/ n 2) a))
          (else (fast-expt-iter b (- n 1) (* b a)))))
  (fast-expt-iter b n 1))
         

(define (even? n)
  (= (remainder n 2) 0))

(fast-expt 2 10)
(fast-expt 3 3)
