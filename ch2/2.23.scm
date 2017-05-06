#lang sicp
; Messed up the brackets here. The execution statements are not to be bracketed as
; a whole.
; For example,
; (cond ((P1)
;        (E1)
;        (E2))
; P1 is predicate, E1 and E2 are statements to be executed.
; Note that we don't need E1 and E2 to be in a surrounding
; bracket. 

(define (for-each proc l)
  (cond ((not (null? l))
         (proc (car l))
         (for-each proc (cdr l)))))
         
(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))