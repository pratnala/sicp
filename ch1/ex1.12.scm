#lang racket

(define (pascal-triangle row column)
  (cond ((> column row) 0)
        ((< column 0) 0)
        ((= column 1) 1)
        (else (+ (pascal-triangle (- row 1) (- column 1))
                 (pascal-triangle (- row 1) column)))))
