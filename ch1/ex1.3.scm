#lang racket

(define (square x)
  (* x x))

(define (max a b)
  (if (> a b)
      a
      b))

(define (two-largest-squares-sum a b c)
  (+ (square (max (max a b) (max b c)))
     (square (cond ((= a (max (max a b) (max b c))) (max b c))
                   ((= b (max (max a b) (max b c))) (max a c))
                   ((= c (max (max a b) (max b c))) (max a b))))))