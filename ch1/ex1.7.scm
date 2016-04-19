#lang racket

(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (new-sqrt-iter newguess oldguess x)
  (if (new-good-enough? newguess oldguess x)
      newguess
      (new-sqrt-iter (improve newguess x)
                 newguess
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-good-enough? newguess oldguess x)
  (<= (/ (abs (- newguess oldguess)) oldguess) 0.001))

(define (sqrt x)
  (new-sqrt-iter 1.0 2.0 x))
