#lang sicp

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson f a b n)
  (define (simpson-val? f a b k n h)
    (cond ((= k 0) (f a))
          ((even? k) (* 2 (f (+ a (* k h)))))
          (else (* 4 (f (+ a (* k h)))))))
  
  (define (simpson-sum? f a b k n h)
    (cond ((< k 0) 0)
          (else (+ (simpson-val? f a b k n h) (simpson-sum? f a b (- k 1) n h)))))
  
  (let ((h (/ (- b a) n)))
  (* (/ h 3.0) (simpson-sum? f a b n n h))))

(simpson cube 0 1 100)
(simpson cube 0 1 1000) 
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
  
  
  
      
