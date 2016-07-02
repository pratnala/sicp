#lang racket

(define (iterative-fast-expt b n)
  (iterative-fast-expt-iter b n 1))

(define (iterative-fast-expt-iter b counter product)
  (cond ((= counter 0) product)
        ((= (remainder counter 2) 0)
         (iterative-fast-expt-iter (* b b) (/ counter 2) product))
        ((= (remainder counter 2) 1)
         (iterative-fast-expt-iter b (- counter 1) (* b product)))))
      
