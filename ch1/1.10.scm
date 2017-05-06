#lang sicp

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))
; 
;(A 1 10)
;(A 0 (A 1 9))
;(A 0 (A 0 (A 1 8)))
;(A 0 (A 0 (A 0 (A 1 7)))
;(A 0 (A 0 (A 0 .... (A 1 1)))
; 2**10 = 1024
(A 1 10)

;(A 2 4)
;(A 1 (A 2 3))
;(A 1 (A 1 (A 2 2))
;(A 1 (A 1 (A 1 (A 2 1)))
;(A 1 (A 1 (A 1 (2))))
;(A 1 (A 1 (A 0 (A 1 1)))
;(A 1 (A 1 (A 0 2)))
;(A 1 (A 1 4))
;(A 1 (A 0 (A 1 3)))
;(A 1 (A 0 (A 0 (A 1 2)))
;(A 1 (A 0 (A 0 (A 1 2)))
; and so on ...
(A 2 4)

(A 3 3)

; 2 *n 
(define (f n) (A 0 n))
(f 13)

; 2 ** n
(define (g n) (A 1 n))
(g 5)

; (A 2 n)
; (A 1 (A 2 (n-1)))
; (A 1 (A 1 (A 2 n-2)))
; (A 1 (A 1 ... 2))
; 2 ** h(n-1)
; (h 0) = 1 
(define (h n) (A 2 n))
(h 1)
(h 2)
(h 3)
(h 4)

; 5 * (n * n) 
(define (k n) (* 5 n n))



