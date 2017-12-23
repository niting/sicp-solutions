#lang sicp
(define (square t) (* t t))
(define (square-tree t)
  (cond
    ((null? t) nil)
    ((not (pair? t)) (square t))
    (else (cons (square-tree (car t))
              (square-tree (cdr t))))))

(display (square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))))

(define (square-tree-map t)
  (map (lambda (tree)
         (if (pair? tree)
             (square-tree-map tree)
             (square tree)))
       t))
(display "\n")
(display (square-tree-map
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))))