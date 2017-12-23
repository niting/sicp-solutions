#lang sicp

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

; Lookup key k in set s. We are assuming the record itself is the key
; : modification to that assumption is easy. 
(define (lookup k s)
  (cond ((null? s) false)
        ((= k (entry s)) (car s))
        ((> k (entry s)) (lookup k (right-branch s)))
        (else (lookup k (left-branch s)))))

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
(lookup 2 (make-tree 2 (list->tree (list 1)) (list->tree (list 3))))
(lookup 4 (make-tree 2 (list->tree (list 1)) (list->tree (list 3))))