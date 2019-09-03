#lang sicp

; Performs no coercion, each of the put statements
; go into their respective packages.
(put 'equ '(scheme-number scheme-number)
     (lambda (x y) (equal? x y)))
(put 'equ '(complex complex)
     (lambda (x y)
       (and (equal? (real-part x) (real-part y))
            (equal? (imag-part x) (imag-part y)))))
(put 'equ '(rational rational)
     (lambda (x y)
       (and (equal? (numer x) (numer y))
            (equal? (denom x) (denom y)))))

; In the generic package, the following goes
(define (equ x y) (apply-generic 'equ x y))