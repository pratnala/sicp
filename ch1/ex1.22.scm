#lang racket

(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  (display n)
  (start-prime-test n (runtime))
  (newline))

(define (start-prime-test n start-time)
  (when (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x)
  (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes a b n)
  (cond ((= (remainder a 2) 0) (search-for-primes (+ a 1) b n))
        ((= n 0) (display "Done"))
        ((prime? a) (timed-prime-test a) (search-for-primes (+ a 2) b (- n 1)))
        (else (search-for-primes (+ a 2) b n))))
