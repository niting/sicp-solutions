#lang sicp
(#%require (only racket/base error))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))



(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make-leaf-set (cdr pairs))))))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (encode-symbol sym tree)
  (cond ((leaf? tree) nil)
        ((element-of-set? sym (symbols (left-branch tree)))
         (cons '0 (encode-symbol sym (left-branch tree))))
        ((element-of-set? sym (symbols (right-branch tree)))
         (cons '1 (encode-symbol sym (right-branch tree))))
        (else (error "Symbol not found" sym))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))



; Actual exercise begins here.

(define (adjoin-node x set)
    (if (null? set)
      (list x)    
      (let ((w1 (weight (car set)))
             (w (weight x))
             (x1 (car set)))  
        (cond ((< w1 w)
               (cons x1 (adjoin-node x (cdr set))))
              (else (cons x set))))))

(define (successive-merge node-set)
  (cond ((= (length node-set) 1) (car node-set))
        (else
         (let ((new-node (make-code-tree (car node-set) (cadr node-set)))
               (rest-nodes (cddr node-set)))
           (successive-merge (adjoin-node new-node rest-nodes))))))
        

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))


(make-leaf-set '((A 2) (B 1)))

(display (generate-huffman-tree '((A 1) (B 2) (C 1) (D 5))))


