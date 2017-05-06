#lang sicp
; First one 
(define (+ a b)
  (if (= a 0)
      b
      (inc (+ (dec a) b))))

(+ 2 3)
; This would work somewhat like this
(+ 2 3)
(inc (+ 1 3))
(inc (inc (+ 0 3)))
(inc (inc (3)))
(inc 4)
5

; Definitely recurisve

; The second one is clearly iterative.

(define (+ a b)
  (if (= a 0)
      b
      (+ (dec a) (inc b))))

