#lang racket

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (fast-* a b)
  (fast-*-iter a b 0))

(define (fast-*-iter a b c)
  (cond ((= b 0) c)
        ((= (remainder b 2) 0) (fast-*-iter (double a) (halve b) c))
        (else (fast-*-iter a (- b 1) (+ a c)))))