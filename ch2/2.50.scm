#lang sicp
(#%require sicp-pict)

(define (flip-horiz)
  (transform-painter (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))
; 180 is nothing but flip-vert. 
(define (flip-270)
  (transform-painter (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))
  
(paint einstein)
(paint ((flip-horiz) einstein))
(paint ((flip-270) einstein))