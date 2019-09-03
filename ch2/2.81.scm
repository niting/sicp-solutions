#lang sicp

; a)
; Goes into an infinite recursion with the first value being
; coerced into a complex-number and essentially the same function
; being called.
;
; b)
; Works as is with the apply happening in apply-generic as it's
; installed with each package.
;
; c)
; No need of modification as it works correctly as is. 