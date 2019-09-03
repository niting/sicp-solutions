#lang sicp

(put 'raise '(scheme-number)
     (lambda (x) (make-rational x 1)))

(put 'raise '(rational)
     (lambda (x) (make-complex-from-real-imag x 0)))

(define (raise x) (apply-generic 'raise x))