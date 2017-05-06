#lang sicp
(pair? (list 2 3))
(pair? (list 2))
(pair? 2)
(define (deep-reverse l)   
  (cond ((null? l) nil)
        ((pair? (car l))
         (append (deep-reverse (cdr l))
                 (list (deep-reverse (car l)))))
        (else
         (append (deep-reverse (cdr l))
                 (list (car l))))))

(define x (list (list 1 2) (list 3 4)))

x
(deep-reverse x)
(define y (list 1 (list 2 3)  5))
y
(deep-reverse y)

(define z (list 5 6))
z




               
               
         
         