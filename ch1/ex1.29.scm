#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define (next-term x)
    (+ x (/ (- b a) n)))
  (define (next-term-even x)
    (+ x (* 2 (/ (- b a) n))))
  (define (summation f a b op)
    (sum f a op b))
  (* (/ (/ (- b a) n) 3.0)
     (+ a
        b
        (* 2.0 (summation f (next-term a) (- b (/ (- b a) n)) next-term))
        (* 2.0 (summation f (next-term a) (- b (/ (- b a) n)) next-term-even)))))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))
