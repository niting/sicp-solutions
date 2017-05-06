#lang sicp

(define zero (lambda (f) (lambda (x) x)))


(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f) x))))
; one = (lambda (f) (lambda (x) (f x)))

; (add-1 one)
; (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
; two = (lambda (f) (lambda (x) (f (f x))))

; Of course, this is cheating. Uses the - operator. Plus,
; a and b are assumed integers and are not in lambda
; numerals. 
;(define (+ a b)
;  (define (plus-iter a b f x)
;    (cond ((= b 0) (x))
;          (f (plus-iter a (- b 1) f x))))
;  (lambda (f) (lambda (x) (plus-iter a b f x))))

; a = 1, b = 2
(define a (lambda (f) (lambda (x) (f x))))
(define b (lambda (f) (lambda (x) (f (f x)))))
; (a f)
; (lambda (x) (f x))

; (a f) ((b f) x)
; (lambda (x) (f x)) (f (f x))
; (f (f (f x)))

(define (+ a b)
  (lambda (f)
    (lambda (x)
      (a f) ((b f) x))))

(+ a b)




