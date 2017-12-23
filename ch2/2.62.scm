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
               (append (list x1) (adjoin-set x (cdr set))))
              ((< x x1)
               (append (list x) set))))))

(define (union-set set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
      (else
       (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (union-set (cdr set1) (cdr set2))))
              ((< x1 x2)
               (cons x1 (union-set (cdr set1) set2)))
              ((< x2 x1)
               (cons x2 (union-set set1 (cdr set2)))))))))

(union-set (list 1 4 7) (list 2 8 15))
(union-set (list 1 4 7) (list 2 6 7))