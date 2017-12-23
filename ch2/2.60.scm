#lang sicp
(#%require (only racket/base error))
; Same efficiency
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

; This one is O(1) as O(X) in size of the set. 
(define (adjoin-set x set)
      (cons x set))

; This is an O(X) operation. Is a recursive procedure as well. 
(define (remove-element x set)
  (cond ((null? set)
         (error "Element not found"))
        ((equal? x (car set)) (cdr set))
        (else (adjoin-set (car set) (remove-element x (cdr set))))))

; Involves an extra linear operation for removal of element for each
; intersecting element. 
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) (remove-element (car set1) set2))))
        (else (intersection-set (cdr set1) set2))))

; Involves one less linear operation. 
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (union-set (cdr set1) (adjoin-set (car set1) set2)))))

(intersection-set (list 2 2 3 4) (list 4 5 2))
(intersection-set (list 2 2 4 5) (list 2 2 3 4))
(union-set (list 2 2 3) (list 4 4 3))

