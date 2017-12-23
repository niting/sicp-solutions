#lang sicp

(display (list 'a 'b 'c))
; (a b c)

(display "\n")

(display (list (list 'george)))
;((george))

(display "\n")
(display (cdr '((x1 x2) (y1 y2))))
; ((y1 y2))

(display "\n")
(display (cadr '((x1 x2) (y1 y2))))
; (y1 y2)

(display "\n")
(display (pair? (car '(a short list))))
; a -> #f

(display "\n")
(memq 'red '((red shoes) (blue socks)))
;#f
(display "\n")

(display (memq 'red '(red shoes blue socks)))
; (red shoes blue socks)