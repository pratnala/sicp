#lang racket

(define (cont-frac n d k)
  (define (cont-frac-recur i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cont-frac-recur (+ i 1))))))
  (cont-frac-recur 1))

(define denominator (lambda (x)
                      (if (= 0 (remainder (+ x 1) 3))
                          (- x (quotient x 3))
                          1)))

(define (euler-constant k)
  (cont-frac (lambda (x) 1.0)
             denominator
             k))
