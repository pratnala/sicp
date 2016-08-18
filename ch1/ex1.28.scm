#lang racket

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (if (non-trivial-root? (expmod base (/ exp 2) m) m)
                         0
                         (remainder (square (expmod base (/ exp 2) m)) m)))
        (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (square x)
  (* x x))

(define (non-trivial-root? a n)
  (cond ((= a 1) #f)
        ((= a (- n 1)) #f)
        ((= (remainder (* a a) n) 1) #t)
        (else #f)))

(define (miller-rabin n)
  (miller-rabin-helper (- n 1) n))

(define (miller-rabin-helper a n)
  (cond ((= a 1) #t)
        ((= (expmod a (- n 1) n) 1) (miller-rabin-helper (- a 1) n))
        (else #f)))