#lang sicp

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (element) (cons (car s) element)) rest)))))

(display (subsets (list 1 2 3)))