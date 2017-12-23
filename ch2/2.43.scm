#lang sicp
; First solution :
; Maps T(k-1)  by appending a new row based position to each solution.
; Accumulates these positions.

; second solution
; maps {1...board_size} by appending T(k-1) to each.
; Accumulates these positions. 

; It seems like queen-cols (- k 1) is computed a lot more times
; than it is in the first solution.
; Called once for each element in board-size

; So if first one computes T(k-1) once
; second one computes T(k-1) about board_size times for each k.
; This factor board_size is multiplied at each stage when k goes
; from 1 to board_size.
; Thus, this must take T* (board_size^board_size).


; However, I think the correct answer is :
; http://www.billthelizard.com/2011/06/sicp-242-243-n-queens-problem.html
; and not the one I have written.
