#lang sicp

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

; Yeah, they will.
; (1 3 5 7 9 11)
; (1 3 5 7 9 11)
; (1 3 5 7 9 11)
; There is an extra append in tree->list-1 that will have an extra O(N) cost at each
; step where N is the total number of nodes.
; tree->list-1 should have a larger order of growth.

; list-1
; T(N) = 2T(N/2) + N
; Master theorem gives theta (n lg n)

; list-2
; T(N) = 2*T(N/2)
; T(N) = 2**(log N) (log to the base 2)
; T(N) = N

