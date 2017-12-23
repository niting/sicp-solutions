#lang sicp

(define (equal? a b)
  (cond ((and (pair? a) (pair? b))
         (and (equal? (car a) (car b))
              (equal? (cdr a) (cdr b))))
        (else (eq? a b))))


(equal? '(this is a list) '(this is a list))
(equal? '(this is a list) '(this (is a) list))