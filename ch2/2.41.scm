#lang sicp
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

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

(define (generate-doubles n)
  (flatmap (lambda (i) (map (lambda (j) (list i j))
                            (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (generate-triples n)
  (flatmap (lambda (i) (flatmap
                        (lambda (j) (map (lambda (k) (list i j k)) (enumerate-interval 1 (- j 1))))
                        (enumerate-interval 1 (- i 1))))
                          (enumerate-interval 1 n)))
  

(define (triple-sum n s)
  (define (is-sum? e)
    (= (accumulate + 0 e) s))
  (filter is-sum? (generate-triples n)))

;(triple-sum 10 11)
(display (generate-doubles 10))
(display "\n")
(display (generate-triples 5))
(display "\n")
(display (triple-sum 5 11))
(display "\n")
(display (triple-sum 7 11))
(display "\n")


