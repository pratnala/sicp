#lang racket

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (fast-* a b)
  (cond ((= b 0) 0)
        ((= (remainder b 2) 0) (fast-* (double a) (halve b)))
        (else (+ a (fast-* a (- b 1))))))