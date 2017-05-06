#lang sicp
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

; This can start going wrong very soon as the result of exponential modulus grows in size
; and if scheme can't handle the precision anymore.
; Realized my answer is wrong. See : http://community.schemewiki.org/?sicp-ex-1.25. Didn't know
; Scheme could handle arbitrary-precision arithmetic.
; Fast prime test won't stay anymore "fast" with this exponentiation mod.