#lang sicp
(#%require sicp-pict)


(define s1 (make-segment (make-vect 0 0) (make-vect 1 0)))
(define s2 (make-segment (make-vect 1 0) (make-vect 1 1)))
(define s3 (make-segment (make-vect 1 1) (make-vect 0 1)))
(define s4 (make-segment (make-vect 0 1) (make-vect 1 0)))

(define fr (make-frame (make-vect 0 0) (make-vect 0 0.99) (make-vect 0.99 0)))
; paint function needs to be used for display in Dr. Racket.

((segments->painter (list s1 s2 s3 s4)) fr)

(define (vleft frame)
  (vector-add (frame-origin frame) (frame-edge2 frame)))
(define (vtop frame)
  (vector-add (vleft frame) (frame-edge1 frame)))
(define (frame-painter)
  (lambda (frame)
    (define s1 (make-segment (frame-origin frame) (frame-edge1 frame)))
    (define s2 (make-segment (frame-origin frame) (vleft frame)))
    (define s3 (make-segment (vleft frame) (vtop frame)))
    (define s4 (make-segment (vtop frame) (vector-add (frame-origin frame) (frame-edge1 frame))))
                             
    (segments->painter (list s1 s2 s3 s4))))

(define (diag1 frame)
  (vector-add (frame-edge1 frame) (frame-edge2 frame)))

(define (x-painter)
  (lambda (frame)
    (define s1 (make-segment (frame-origin frame) (diag1 frame)))
    (define s2 (make-segment (vector-add (frame-origin frame) (frame-edge1 frame)) (vector-add (frame-origin frame) (frame-edge2 frame))))
    (segments->painter (list s1 s2))))



(paint ((frame-painter) fr))
(paint ((x-painter) fr))

; Leaving the diamond as that's easy and wave as that will take sometime to figure out.
 


     



