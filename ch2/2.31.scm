#lang sicp
(define (square t) (* t t))

(define (tree-map proc tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (tree-map proc subtree)
             (proc subtree)))
       tree))
(define (square-tree tree) (tree-map square tree))

(display (square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))))