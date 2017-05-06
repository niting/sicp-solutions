#lang sicp
; This prevents the "log" factor in the function from happening as we are essentially
; computing expmod base (/ exp 2) m "twice" which is exactly what we cut down to "once"
; with the originally written expmod. 
