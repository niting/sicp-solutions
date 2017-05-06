#lang sicp
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(gcd 206 40)
(gcd 40 (remainder 206 40))
; if evaluates remainder
(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; if evaluates remainder
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
; if evaluates remainder(s)
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
; if evaluates remainders in b
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
; 2

; Number of remainder operations in normal order : 1 + 2 + 4 + 7 + 4 = 18

; Applicative :
(gcd 206 40)
(gcd 40 (remainder 206 40)) ; -> 1
(gcd 40 6)
(gcd 6 (remainder 40 6)) ; -> 1
(gcd 6 4)
(gcd 4 (remainder 6 4)) ; -> 1
(gcd 4 2)
(gcd 2 (remainder 4 2)) ; -> 1
(gcd 2 0)
; In total -> 4 in applicative
