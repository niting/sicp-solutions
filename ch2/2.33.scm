#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y)
                (if (null? x)
                    y
                    (cons (p x) y)))
              nil sequence))

(map (lambda (x) (* x x)) (list 1 2 3 4))



(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append (list 1 2 3) (list 4 5 6))
(append nil (list 1 2 3))
(append (list 1 2 3) nil)

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
(length (list 2 3 4))