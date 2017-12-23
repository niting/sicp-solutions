#lang sicp

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

; Break up the list for the left half by taking the first (n-1)/2 elements.
; Construct left tree out of it.
; Take the next element as the root of the tree.
; The other remaining elements upto n as the right side of the tree.


;     5
;   /   \
;  1     9
;   \   / \ 
;    3  7  11

; T(n) = T(n/2) + T(n/2) + n
; T(n) = 2*T(n/2) + n
; This is about theta(n lg n) by master theorem.

; theta(n lg n) is actually wrong. Time taken by make-tree
; is constant and not n. 