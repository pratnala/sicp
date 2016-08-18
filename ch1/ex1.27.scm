#lang racket

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (square x)
  (* x x))

(define (fermat-test n)
  (fermat-helper (- n 1) n))

(define (fermat-helper a n)
  (cond ((= a 1) #t)
        ((= (expmod a n n) a) (fermat-helper (- a 1) n))
        (else #f)))
