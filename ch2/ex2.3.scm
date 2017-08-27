#lang racket

(define (square x)
  (* x x))

(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (length-segment segment)
  (let ((x1 (x-point (start-segment segment)))
        (x2 (x-point (end-segment segment)))
        (y1 (y-point (start-segment segment)))
        (y2 (y-point (end-segment segment))))
    (sqrt (+ (square (- x2 x1))
             (square (- y2 y1))))))

(define (make-rect-points p1 p2)
  (cons (make-point (min (x-point p1) (x-point p2))
                    (min (y-point p1) (y-point p2)))))

(define (rect-top-points rect)
  (make-segment (make-point (x-point (car rect))
                            (y-point (cdr rect)))
                (cdr rect)))

(define (rect-left-points rect)
  (make-segment (car rect)
                (make-point (x-point (car rect))
                            (y-point (cdr rect)))))

(define (area-points rect)
  (* (length-segment (rect-top-points rect))
     (length-segment (rect-left-points rect))))

(define (perimeter-points rect)
  (* 2 (+ (length-segment (rect-top-points rect))
          (length-segment (rect-left-points rect)))))

(define (make-rect-boundaries left top right bottom)
  (cons (make-segment (make-point left bottom)
                      (make-point left top))
        (make-segment (make-point left top)
                      (make-point right top))))

(define (rect-top-boundaries rect)
  (cdr rect))

(define (rect-left-boundaries rect)
  (car rect))

(define (area-boundaries rect)
  (* (length-segment (rect-top-points rect))
     (length-segment (rect-left-points rect))))

(define (perimeter-boundaries rect)
  (* 2 (+ (length-segment (rect-top-points rect))
          (length-segment (rect-left-points rect)))))
