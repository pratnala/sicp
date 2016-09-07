#lang racket

(define (cont-frac n d k)
  (define (cont-frac-recur i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cont-frac-recur (+ i 1))))))
  (cont-frac-recur 1))

(define denominator (lambda (x) (- (* 2 x) 1)))

(define (square x) (* x x))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1)
                             x
                             (- (square x))))
             denominator
             k))
