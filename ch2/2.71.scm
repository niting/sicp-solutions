#lang sicp

; Sketched it offline for n = 5.
; The most frequent symbol (freq : 2^(n-1)) would always have greater frequency
; than some of all other frequencies, so just 1 bit would be needed.
; For the least frequent symbol (freq : 1), height of huffman tree would be needed.
; Height of huff man tree would be (n-1), so (n-1) bits would be needed. 