#lang sicp
(define (square x) (* x x))
(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))
(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment s)
  (make-point
   (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2.0)
   (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2.0)))

(print-point (midpoint-segment (make-segment (make-point 2 3) (make-point 5 6))))

(define (length s)
  (sqrt (+ (square (- (x-point start-segment s) (x-point end-segment s)))
           (square (- (y-point start-segment s) (y-point end-segment s))))))

; s1 and s2 are top and left segments of the rectangle
(define (make-rect s1 s2)
  (cons s1 s2))
(define (top-rect r)
  (car r))
(define (left-rect r)
  (cdr r))

(define (peri-rect r)
  (* 2 (+ (length (top-rect r)) (length (left-rect r)))))
(define (area-rect r)
  (* (length (top-rect r)) (length (left-rect r))))

; An alternate design would be to take 4 points of the rectangle in clockwise order
; starting from the top left point. We can then define top-rect and left-rect
; for such an implementation unaffecting peri-rect and area-rect. 



