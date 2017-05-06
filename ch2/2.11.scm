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

; Case 1: [2 3] [4 5]
; Case 2: [2 3] [-5 -4]
; Case 3: [2 3] [-5 4]
; Case 4: [-2 -3] [4 5]
; Case 5: [-2 -3] [-5 -4]
; Case 6 : [-2 -3] [-4 5]
; Case 7 : [-2 3] [4 5]
; Case 8 : [-2 3] [-5 -4]
; Case 9: [-2 3] [-5 2]
; Doesn't feel like worth testing this. It's a much more complicated way of writing the
; same thing.
(define (mul-interval-ben x y)
  (let ((s1 (>= (lower-bound x) 0))
        (s2 (>= (lower-bound y) 0))
        (s3 (>= (upper-bound x) 0))
        (s4 (>= (upper-bound y) 0))
        (p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (cond ((and s1 s2)
           (make-interval p1 p4))
          ((and s1 (not s4))
           (make-interval p3 p2))
          ((and s1 (not s2) s4)
           (make-interval p3 p4))
          ((and (not s3) s2)
           (make-interval p4 p1))
          ((and (not s3) (not s4))
           (make-interval p2 p3))
          ((and (not s3) (not s2) s4)
           (make-interval p4 p1))
          ((and (not s1) s3 s2)
           (make-interval p2 p4))
          ((and (not s1) s3 (not s4))
           (make-interval p3 p1))
          ((and (not s1) s3 (not s2) s4)
           (make-interval (min p2 p3) (max p1 p4))))))

(mul-interval-ben (make-interval 2 3) (make-interval 4 5))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))
        

