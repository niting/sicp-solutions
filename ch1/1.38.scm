#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-iter value n d k)
    (cond ((= k 0) value)
          (else (cont-frac-iter (/ (n k) (+ value (d k))) n d (- k 1)))))
  (cont-frac-iter 0.0 n d k))

; I know I could make the expressions a little cleaner but I am lazy. 
(+
 (cont-frac (lambda (i) 1.0)
           (lambda (i)
             (cond ((= i 1) 1)
                   ((= i 2) 2)
                   ((= (remainder (- i 2) 3) 0) (* 2 (+ (/ (- i 2) 3) 1)))
                   (else 1)))
           11) ; 11 steps are enough to get accuracy to 4 decimal places
 2)







