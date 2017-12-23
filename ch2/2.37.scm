#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (x) (car x)) seqs))
            (accumulate-n op init (map (lambda (x) (cdr x)) seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (mi) (dot-product mi v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (map (lambda (col) (dot-product row col)) cols)) m)))

(define a (list 1 2 3))
(define b (list 3 4 5))
(display (dot-product a b))
(display "\n")

(define m1 (list (list 1 2 3) (list 4 5 6)))
(display (matrix-*-vector m1 a))
(display "\n")
(display (transpose m1))

(display "\n")
(define m2 (list (list 1 1 1) (list 1 1 1) (list 1 1 1)))
(display (matrix-*-matrix m1 m2))

