#lang sicp
; a <- bq + qa + ap
; b <- bp + aq
; Second time : 
; a <- (bp+qa)q + q(bq +  qa + ap) + (bq + qa+ ap)p
; a <- bpq + q2a + q2b + q2a + apq + bpq + pqa + ap2
; a <- 2bpq + 2q2a + bq2 + 2apq + ap2
;
; b <- (bp + aq)p + (bq + qa + ap)q
; b <- bp2 + apq + bq2 + q2a + apq
; b <- b(p2 + q2) + a(2pq + q2)
;
; a <- b (2pq + q2) + (2pq + q2)a + a(p2 + q2)

; p' = p2 + q2
; q' = 2pq + q2
;

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))      ; compute p'
                   (+ (* 2 p q) (* q q))      ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

