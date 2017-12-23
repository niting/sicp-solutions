#lang sicp
(#%require sicp-pict)

; And we are back in the game. Thanks Dr. Racket!

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(paint (up-split einstein 10))
