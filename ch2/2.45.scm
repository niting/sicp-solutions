#lang sicp
(#%require sicp-pict)

; And we are back in the game. Thanks Dr. Racket!

; transformation t1 and t2
(define (split t1 t2)
  (define (split-helper painter n)
    (if (= n 0)
             painter
             (let ((smaller (right-split painter (- n 1))))
               (t1 painter (t2 smaller smaller)))))
  split-helper)
  
(define right-split (split beside below))
(define up-split (split below beside))

(paint (up-split einstein 10))
(paint (right-split einstein 10))