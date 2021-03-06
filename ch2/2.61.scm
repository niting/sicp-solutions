#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()    
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((< x2 x1)
               (intersection-set set1 (cdr set2)))))))
; No element-of-set? checks.
(define (adjoin-set x set)
    (if (null? set)
      (list x)    
      (let ((x1 (car set)))
        (cond ((= x1 x) set)
              ((< x1 x)
               (cons x1 (adjoin-set x (cdr set))))
              ((< x x1)
               (cons x set))))))

(adjoin-set 2 (list 3 4))
(adjoin-set 3 (list 1 2))
(adjoin-set 2 (list 1 3))
  