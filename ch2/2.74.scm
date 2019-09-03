#lang sicp
; a) Division should be the type, with get-record operation.
; b) Division should still be the type, operations would be get-salary,
; get-address etc. The type information should be encoded in employee as well.
; Should be similar to a. 


(define (get-record file employee)
  (get 'get-record ((tag-type file) (tag-type employee)) (contents file) (contents employee)))

; c) 

(define (find-employee-record div-files emp-name)
  (if (empty? div-files)
      (#f)
      (if (get-record (car div-files) emp-name)
          (get-record (car div-files) emp-name)
          (find-employee-record (cdr div-files) emp-name))))

; d)
; Install a package for each new division coming in with Insatiable.
; Hard to check any answers with this kind of an exercise.



      

