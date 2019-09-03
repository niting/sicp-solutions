#lang sicp

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (if (number? datum)
          datum
          (error "Bad tagged datum -- TYPE-TAG" datum))))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (if (number? datum)
          datum
          (error "Bad tagged datum -- TYPE-TAG" datum))))

(define (attach-tag type-tag contents)
  (if (= type-tag 'scheme-number)
      contents
      (cons type-tag contents)))