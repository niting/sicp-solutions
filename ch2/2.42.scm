#lang sicp


(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

; Check if there is already a queen on row number 'row'. 
(define (check-row row pos_list)
  (cond ((null? pos_list) #t)
        (else (and (not (= (car (car pos_list)) row))
                   (check-row row (cdr pos_list))))))
; Check a diagonal of a position against the rest of positions. 
(define (check-diag pos rest_positions)
  (define (check-diag-pos row col pos)
    (not (= (abs (- row (get-row pos)))
            (abs (- col (get-col pos))))))
  (cond ((null? rest_positions) #t)
        (else (and (check-diag-pos (get-row pos) (get-col pos) (car rest_positions))
                   (check-diag pos (cdr rest_positions))))))
; Gets the row from a position. 
(define (get-row pos)
  (car pos))
(define (get-col pos)
  (car (cdr pos)))

; All pairs are (row, col)
(define (adjoin-position nr col queens)
  (append (list (list nr col)) queens))
(define empty-board nil)
(define (safe? col pos_list)
  (cond ((null? pos_list) #t)
        ((null? (cdr pos_list)) #t)
        (else
         (and (check-row (get-row (car pos_list)) (cdr pos_list))
              (check-diag (car pos_list) (cdr pos_list))))))


(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(display (queens 4))
(display "\n")
(display (queens 8))

