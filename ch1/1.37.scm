#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-iter value n d k)
    (cond ((= k 0) value)
          (else (cont-frac-iter (/ (n k) (+ value (d k))) n d (- k 1)))))
  (cont-frac-iter 0.0 n d k))


(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11) ; 11 steps are enough to get accuracy to 4 decimal places

(define (cont-frac-recurse n d k)
  (define (cont-frac-recurse-func ctr)
    (if (> ctr k)
        0
        (/ (n ctr) (+ (d ctr) (cont-frac-recurse-func (+ ctr 1))))))
  (cont-frac-recurse-func 1))

(cont-frac-recurse (lambda (i) 1.0)
                   (lambda (i) 1.0)
                   11)




