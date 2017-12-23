#lang sicp
(#%require (only racket/base error))
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))


(define (addend s) (cadr s))

(define (augend s)
  (if (= (length (cddr s)) 1)
      (caddr s)
      (append (list '+) (cddr s))))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))


(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplicand p)
  (if (= (length (cddr p)) 1)
      (caddr p)
      (append (list '*) (cddr p))))

(define (multiplier p) (cadr p))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        (else
         (error "unknown expression type -- DERIV" exp))))

(display (deriv '(* x y (+ x 3)) 'x))





