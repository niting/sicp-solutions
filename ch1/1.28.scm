#lang sicp
(#%require (only racket/base random))
; Aah. We meet again Miller-Rabin!
(define (check-root? root m)
  (cond ((or (= root 1) (= root (- m 1)))
         (remainder (square root) m))
        ((= (remainder (square root) m) 1) 0)
        (else (remainder (square root) m))))
        
(define (square n) (* n n))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (check-root? (expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (check-val? val)
    (and (not (= val 0)) (= val 1)))
  (define (try-it a)
    (check-val? (expmod a (- n 1) n)))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 2 100)
(fast-prime? 7 100)
(fast-prime? 22 100)
(fast-prime? 15 100)
(fast-prime? 37 100)
(fast-prime? 39 100)
(fast-prime? 561 100)
(fast-prime? 1105 100)
(fast-prime? 1729 100)
(fast-prime? 2465 100)
(fast-prime? 2821 100)
(fast-prime? 6601 100)




