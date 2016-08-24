#lang racket

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (filter a)
                    (term a)
                    null-value)
                (filtered-accumulate filter combiner null-value term (next a) next b))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square x)
  (* x x))

(define (inc n)
  (+ n 1))

(define (divides? a b)
  (= (remainder b a) 0))

(define (sum-prime-squares a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (relatively-prime? n)
  (lambda (i) (= (gcd i n) 1)))

(define (identity x) x)

(define (prod-relatively-prime n)
  (filtered-accumulate (relatively-prime? n) * 1 identity 1 inc n))
