#lang sicp
(define (product term next a b)
  (if (> a b)
      1
      (* (term a) (product term next (next a) b))))

(define (factorial n)
  (if (= n 0)
      1
      (product (lambda (a) a) (lambda (next) (+ next 1)) 1 n)))

(factorial 3)
(factorial 4)

(define (pi-term idx)
  (cond
    ((= (remainder idx 2) 0) (/ (+ idx 2.0) (+ idx 3.0)))
    (else (/ (+ idx 3.0) (+ idx 2.0)))))
(define (pi iter)      
  (* 4 (product pi-term (lambda (next) (+ next 1)) 0 iter)))

(pi 100000)

(define (pi-iter product curr iter)
  (if (= curr iter)
      product
      (pi-iter (* product (pi-term curr)) (+ 1 curr) iter)))

(* 4 (pi-iter 1 0 100000))
      

  
        





