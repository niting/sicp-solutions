#lang sicp
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

; O(N) growth. 
(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

; O(N) growth. 
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

(define (intersection-set-list set1 set2)
  (if (or (null? set1) (null? set2))
      '()    
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set-list (cdr set1)
                                            (cdr set2))))
              ((< x1 x2)
               (intersection-set-list (cdr set1) set2))
              ((< x2 x1)
               (intersection-set-list set1 (cdr set2)))))))


; No element-of-set? checks.
(define (adjoin-set x set)
    (if (null? set)
      (list x)    
      (let ((x1 (car set)))
        (cond ((= x1 x) set)
              ((< x1 x)
               (append (list x1) (adjoin-set x (cdr set))))
              ((< x x1)
               (append (list x) set))))))

(define (union-set-list set1 set2)
    (cond ((null? set1) set2)
          ((null? set2) set1)
      (else
       (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (union-set-list (cdr set1) (cdr set2))))
              ((< x1 x2)
               (cons x1 (union-set-list (cdr set1) set2)))
              ((< x2 x1)
               (cons x2 (union-set-list set1 (cdr set2)))))))))

(define (union-set t1 t2)
  (let ((l1 (tree->list-2 t1))
        (l2 (tree->list-2 t2)))
      (let ((ul (union-set-list l1 l2)))
        (list->tree ul))))


(tree->list-2 (list->tree (list 1 2 3 4)))
(tree->list-2 (union-set (list->tree (list 1 2 3)) (list->tree (list 3 4 5))))

; Similarly we can implement intersection-set.
    
    

