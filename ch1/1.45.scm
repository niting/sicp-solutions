#lang sicp
(define (square x) (* x x))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define (even? n)
  (= (remainder n 2) 0))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (cond ((= n 1) f)
        (else (compose f (repeated f (- n 1))))))
(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (cube y) (* y y y))

; Number of repetitions of average damp. 
(define (nthroot x n reps)
  (fixed-point ((repeated average-damp reps) (lambda (y) (/ x (fast-expt y (- n 1)))))
               1.0))
; This version keeps looking precision and eventually converges because of that.
(nthroot 4 4 2) ; 4th root -> 2
(nthroot 4 5 2) ; 5th root -> 2
(nthroot 4 6 2)
(nthroot 4 7 2)
(nthroot 4 12 2)
(nthroot 4 20 2) ; 20th root -> 2
(nthroot 4 30 2) ; 30th root -> 2
(nthroot 9 40 2) ; 40th root -> 2
(nthroot 9 50 2)


