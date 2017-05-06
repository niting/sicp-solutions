#lang sicp

(define (square x) (* x x))

; This one is doing a reversal by constructing the list
; from (square (car things)) and answer. The current item
; is appended at the start of the answer. 
(define (square-list1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))

; This should have possibly solved it by our reasoning for the
; previous function. However, this violates the structure of a
; list which should have a recursive structure of the sort
; (element | list). 
(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

(square-list1 (list 1 2 3 4))
(square-list2 (list 1 2 3 4))

