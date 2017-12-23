#lang sicp
(car ''abracadabra)
; (car (quote (quote abracadabra)))
; 'quote signifies that quote (') is a symbol here.
; For example 'a prints 'a which means that a is a symbol here.
; In the same way:
''a
;''a prints (mcons 'quote (mcons 'a '()))
; which is a pair made from the symbol "quote" and "a".
; Thus (car ''a) would be 'quote - quote as a symbol and not as an operator.

