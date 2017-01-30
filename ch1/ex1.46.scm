#lang racket

(define (iterative-improve good-enough? next-guess)
  (lambda (guess)
    (if (good-enough? guess)
        guess
        ((iterative-improve good-enough? next-guess)
         (next-guess guess)))))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  ((iterative-improve
    (lambda (y)
      (< (abs (- x (sqr y))) 0.00001))
    (lambda (y)
      (average y (/ x y))))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (x)
      (< (abs (- x (f x))) 0.00001))
    f)
   1.0))
