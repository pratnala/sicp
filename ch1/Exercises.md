Exercises
---------

**Exercise 1.1**

`10 -> 10`

`(+ 5 3 4) -> 12`

`(- 9 1) -> 8`

`(/ 6 2) -> 3`

`(+ (* 2 4) (- 4 6)) -> 6`

`(define a 3) -> a defined as 3`

`(define b (+ a 1)) -> b defined as (+ a 1) = 4`

`(+ a b (* a b)) -> 19`

`(= a b) -> #f`

`(if (and (> b a) (< b (* a b))) b a) -> 4`

`(cond ((= a 4) 6) ((= b 4) (+ 6 7 a)) (else 25)) -> 16`

`(+ 2 (if (> b a) b a)) -> 6`

`(* (cond ((> a b) a) ((< a b) b) (else -1)) (+ a 1)) -> 16`

**Exercise 1.2**

`(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))`

**Exercise 1.3**

See `ex1.3.scm`.

**Exercise 1.4**

If `b > 0`, we calculate `a + b`. Otherwise, we calculate `a - b`. Since `abs b = -b`, this works out fine.
