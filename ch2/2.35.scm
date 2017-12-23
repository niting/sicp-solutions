#lang sicp
; Ended up using enumerate-tree. Not sure if this was what
; the question authors intended. 
(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t))))

(define x (cons (list 1 2) (list 3 4)))

(count-leaves x)

; This one uses recursion. Although, there is a cleaner recursion
; solution here : http://community.schemewiki.org/?sicp-ex-2.35
(define (count-leaves-alt t)
  (accumulate + 0 (map (lambda (x)
                         (cond ((null? x) 0)
                               ((not (pair? x)) 1)
                               ((not (pair? (car x)))
                                (+ 1 (count-leaves (cdr x)))))) t)))


(count-leaves-alt x)
