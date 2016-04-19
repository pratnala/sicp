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

**Exercise 1.5**

If we use applicative-order evaluation, the interpreter keeps expanding `(p)` indefinitely. In normal-order evaluation, the `if` condition evaluates to `true` and it is returned.

**Exercise 1.6**

Scheme uses applicative-order evaluation. This means that the call to `(sqrt-iter)` keeps getting indefinitely expanded and called, thus going into an infinite loop. Hence, this program will never terminate.

**Exercise 1.7**

The precision takes a big hit when numbers become very small. For example, `(sqrt 0.0001)` gives a result, `0.03230844833048122`, while the expected result is `0.01`. This is a huge difference. Moreover, `(sqrt 10000000000000)` inexplicably goes into an infinite loop (while higher powers don't - which is strange).
