#lang sicp

;  A
; /  \
; B  C
; B and C can both be coerced to A and then an operation performed
; if B and C are "derived" from A.

; Very rough sketch of what could happen.

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (let (type1 (car type-tags))
            (apply-generic op (apply-coercion (cdr args)) type1))))))

; apply-coercion coerces all elements in the list to type1 passed in. 
                