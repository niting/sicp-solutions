#lang sicp


(define (encode-symbol sym tree)
  (cond ((leaf? tree) nil)
        ((element-of-set? sym (symbols (left-branch tree)))
         (cons '0 (encode-symbol sym (left-branch tree))))
        ((element-of-set? sym (symbols (right-branch tree)))
         (cons '1 (encode-symbol sym (right-branch tree))))
        (else (error "Symbol not found" sym))))

; General case
; I think depends on how well balanced the tree is and that
; should be affected by relative frequencies.
; Is the symbol list halved, 1/3rd or just decreased by 1 at each search for each symbol.

; Special case
; Most frequent : O(1)
; Least frequent : (n-1) + (n-2) + (n-3) + (n-4) + ... 1 = O(n^2)


