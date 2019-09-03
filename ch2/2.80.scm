#lang sicp

; Use equ? from the previous exercise
(define (install-zero-package)
  (put '=zero? '(scheme-number)
       (lambda (x) (= x 0))
  (put '=zero? '(rational)
       (lambda (x) (= (numer x) 0)))
  (put '=zero? '(complex)
       (lambda (x) (and (= (real-part x) 0)
                        (= (imag-part x) 0))))
  )
  (define (=zero? x) (apply-generic '=zero? x))
  done)
