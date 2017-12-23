#lang sicp
; a) Division should be the type, with get-record operation.
; b) Division should still be the type, operations would be get-salary,
; get-address etc.
; c)

(define (install-package)
  (define (get-record-1 file)
    )
  (define (get-record-2 file)
    )
  (define (get-salary-1 emp-record)
    )
  (define (get-salary-2 emp-record)
    )
  (put 'get-record 'div1 get-record-1)
  (put 'get-record 'div2 get-record-2)
  
  (put 'get-salary 'div1 get-salary-1)
  (put 'get-salary 'div2 get-salary-2)
  'done)



(define (find-employee-record div-files emp-name)
  )

