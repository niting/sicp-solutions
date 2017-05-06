#lang sicp

(define (make-rat n d)
  (cond ((> (* n d) 0) (cons n d))
        (else (cons (* -1 (abs n)) (abs d)))))

(make-rat 2 3)
(make-rat -2 3)
(make-rat 3 -2)
(make-rat -4 -5)

