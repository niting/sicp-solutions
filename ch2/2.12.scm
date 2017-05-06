#lang sicp
(#%require (only racket/base error))

(define (make-interval a b)
  (cons a b))
(define (upper-bound i)
  (cdr i))
(define (lower-bound i)
  (car i))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (contains-zero i)
  (<= (* (upper-bound i) (lower-bound i)) 0))
(contains-zero (make-interval -3 -4))
(contains-zero (make-interval -3 1))
(contains-zero (make-interval 3 4))
(contains-zero (make-interval 0 2))

(define (div-interval x y)
  (cond ((contains-zero y) (error "Divisor interval contains 0"))
        (else (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))))
(div-interval (make-interval 2 3) (make-interval 4 5))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent center percentage)
  (let ((width (* center (/ percentage 100))))
    (make-center-width center width)))

(define (percent i)
  (* 100 (/ (width i) (center i))))