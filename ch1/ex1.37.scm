#lang racket

(define (cont-frac n d k)
  (define (cont-frac-recur i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (cont-frac-recur (+ i 1))))))
  (cont-frac-recur 1))

(define (cont-frac-iter n d k)
  (define (iter-helper n1 d1 j)
    (if (= j 1)
        (/ n1 d1)
        (iter-helper (n (- j 1))
                     (+ (d (- j 1)) (/ n1 d1))
                     (- j 1))))
  (iter-helper (n k) (d k) k))
