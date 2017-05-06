#lang sicp
; Nothing to run here since this is a proof question.
; Fib(1) = 1 (Base case that comes by computation and holds)
; Assume Fib(n-1) and Fib(n-2) are true.
; Use the fact that phi*phi = phi + 1 and si*si = si + 1 -> This proves Fib(n) = (phi**n - si** n)/sqrt(5)
; Then prove abs(si**n/sqrt(5)) < 1/2 and since Fib(n) is an integer, it must be the closest integer to phi**n/sqrt(5).
; Source : Wikipedia for the last part


