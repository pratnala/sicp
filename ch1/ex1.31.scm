#lang racket

; Recursive way
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (inc n)
  (+ n 1))

(define (inc2 n)
  (+ n 2))

(define (identity x) x)

(define (factorial n)
  (product identity 1 inc n))

(define (pi-approx n)
  (define (f n)
    (/ (* n (inc2 n))
       (* (inc n) (inc n))))
  (* 4.0 (product f 2 inc2 n)))

; Iterative way
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial-iter n)
  (product-iter identity 1 inc n))
