#lang sicp
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m)
  (car m))
(define (right-branch m)
  (car (cdr m)))
(define (branch-length b)
  (car b))
(define (branch-structure b)
  (car (cdr b)))


(define (is-number? structure)
  (not (pair? structure)))
(define (total-branch-weight b)
  (cond ((is-number? (branch-structure b))
         (branch-structure b))
        (else (total-weight (branch-structure b)))))
         
(define (total-weight m)
  (+ (total-branch-weight (left-branch m))
     (total-branch-weight (right-branch m))))

(define a (make-mobile (make-branch 2 3) (make-branch 5 6)))
(define b (make-mobile (make-branch 6 3) (make-branch 9 2)))
(total-weight a)

(define (torque b)
  (* (total-branch-weight b) (branch-length b)))

(define (is-balanced? m)
  (and
   (= (torque (left-branch m)) (torque (right-branch m)))
   (if (is-number? (branch-structure (left-branch m)))
       #t
       (is-balanced? (branch-structure (left-branch m))))
   (if (is-number? (branch-structure (right-branch m)))
       #t
       (is-balanced? (branch-structure (right-branch m))))))

(is-balanced? a)
(is-balanced? b)

; Part (d)
; Looks like most of the accessors would just change. Everything else would remain
; the same.








