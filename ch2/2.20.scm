#lang sicp

(define (same-parity . y)
  (define (same-parity-list l mod-val)
    (cond ((null? l) nil)
          ((= (remainder (car l) 2) mod-val)
           (cons (car l) (same-parity-list (cdr l) mod-val)))
          (else (same-parity-list (cdr l) mod-val))))
  (same-parity-list y (remainder (car y) 2)))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
(same-parity 2)
