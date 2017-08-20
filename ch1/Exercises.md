## Exercises

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

**Exercise 1.8**

See `ex1.8.scm`.

**Exercise 1.9**

Using the procedure:

```
(define (+ a b)
    (if (= a 0)
        b
        (inc (+ (dec a) b))))
```

```
(+ 4 5)
(inc (+ (dec 4) 5))
(inc (+ 3 5))
(inc (inc (+ (dec 3) 5)))
(inc (inc (+ 2 5)))
(inc (inc (inc (+ (dec 2) 5))))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ (dec 1) 5)))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9
```

Using the procedure:

```
(define (+ a b)
    (if (= a 0)
        b
        (+ (dec a) (inc b))))
```

```
(+ 4 5)
(+ (dec 4) (inc 5))
(+ 3 6)
(+ (dec 3) (inc 6))
(+ 2 7)
(+ (dec 2) (inc 7))
(+ 1 8)
(+ (dec 1) (inc 8))
(+ 0 9)
9
```

The first procedure is recursive in nature, while the second one is iterative.

**Exercise 1.10**

Values of:

- `(A 1 10)` : 1024
- `(A 2 4)` : 65536
- `(A 3 3)` : 65536

Concise mathematical definitions for:

- `(f n)` : `2 * n`
- `(g n)` : `2 ^ n`
- `(h n)` : `2 ^ 2 ^ ... n times`

**Exercise 1.11**

See `ex1.11.scm`.

**Exercise 1.12**

See `ex1.12.scm`. Rows and columns are 1-indexed from the left in the typical Pascal's triangle.

**Exercise 1.13**

See `ex1.13.pdf` for the proof. Corresponding TeX file also included.

**Exercise 1.14**

See `ex1.14.png` for the tree. Order of growth in number of steps is `O(2^n)` (at most 2 calls at each step for at least a decrement by 1) and space is `O(n)`.

**Exercise 1.15**

```
(sine 12.15)
(p (sine 4.05))
(p (p (sine 1.35)))
(p (p (p (sine 0.45))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine 0.05))))))
```

**a.** Procedure is applied 5 times.
**b.** Space and number of steps is <code>O(log<sub>3</sub> n)</code>.

**Exercise 1.16**

See `ex1.16.scm`.

**Exercise 1.17**

See `ex1.17.scm`.

**Exercise 1.18**

See `ex1.18.scm`.

**Exercise 1.19**

See `ex1.19.pdf` for the derivation and `ex1.19.scm` for the completed program. Corresponding TeX file also included.

**Exercise 1.20**

Definition of `gcd`:

```
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))
```

*Normal-order evaluation*

```
(gcd 206 40)

(if (= 40 0)
	206
	(gcd 40 (remainder 206 40)))

(if (= (remainder 206 40) 0)     ; evaluated: count += 1
	40
	(gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= (remainder 40 (remainder 206 40)) 0)     ; evaluated: count += 2
	(remainder 206 40)
	(gcd (remainder 40 (remainder 206 40))
		 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)     ; evaluated: count += 4
	(remainder 40 (remainder 206 40))
	(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
		 (remainder (remainder 40 (remainder 206 40))
					(remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)     ; evaluated: count += 7
	(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))     ; evaluated: count += 4
	(gcd (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
		 (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
					(remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))

2
```

Total evaluations: 18

*Applicative-order evaluation*

```
(gcd 206 40)

(if (= 40 0)
	206
	(gcd (40 (remainder 206 40)))     ; evaluated: count += 1

(if (= 6 0)
	40
	(gcd 6 (remainder 40 6)))     ; evaluated: count += 1

(if (= 4 0)
	6
	(gcd 4 (remainder 6 4)))     ; evaluated: count += 1

(if (= 2 0)
	4
	(gcd 2 (remainder 4 2)))     ; evaluated: count += 1

(if (= 0 0)
	2

2
```

Total evaluations: 4

**Exercise 1.21**

199: 199
1999: 1999
19999: 7

**Exercise 1.22**

Code is written in `ex1.22.scm`. The computer is too fast for the given ranges. But a factor of 3.15 to 3.2 is observed in higher ranges which is roughly the square root of 10.

**Exercise 1.23**

Code is written in `ex1.23.scm`. Yes, halving the number of steps leads to a roughly 2x increase in speed.

**Exercise 1.24**

There are greater gains in performance for primes near 1,000,000 than primes near 1,000. This is because the squaring which occurs is more efficient with larger exponents.

**Exercise 1.25**

Technically, Alyssa's procedure is correct. However, it would slow down the process as one must first calculate the potentially large base<sup>exp</sup> number before taking the remainder. This would significantly slow down the fast prime tester. The original `expmod` function calculates the remainder after each exponentiation, thus keeping the numbers manageably small.

**Exercise 1.26**

In Louis's code, `expmod` is being calculated twice because of the `(* (expmod ...) (expmod ...))` pattern. When using the `(square x)` pattern, one calculates `x` first and then multiplies it with itself. Since it is being calculated twice, the running time becomes `2^x`. In this case, `x` is `log n`. Thus, the running time simplifies to `n`.

**Exercise 1.27**

Code is written in `ex1.27.scm`. Yes, the given Carmichael numbers fool the Fermat test.

**Exercise 1.28**

Code is written in `ex1.28.scm`. Carmichael numbers cannot fool the Miller-Rabin test.

**Exercise 1.29**

Code is written in `ex1.29.scm`. Results:

```
> (integral cube 0 1 0.01)
0.24998750000000042
> (integral cube 0 1 0.001)
0.249999875000001
> (simpson cube 0 1 100)
0.25
> (simpson cube 0 1 1000)
0.25
```

Simpson's rule performs better.

**Exercise 1.30**

Code is written in `ex1.30.scm`.

**Exercise 1.31**

Code is written in `ex1.31.scm`.

**Exercise 1.32**

Code is written in `ex1.32.scm`.

**Exercise 1.33**

Code is written in `ex1.33.scm`.

**Exercise 1.34**

`(f f)` evaluates to `(f 2)` which then evaluates to `(2 2)`. This is not a valid Scheme expression and hence, throws up an error.

**Exercise 1.35**

We are given `x = 1 + 1/x`. Multiplying by `x` on both sides and simplifying, we get `x^2-x-1=0` whose root is the golden ratio. Code is written in `ex1.35.scm`.

**Exercise 1.36**

Code is written in `ex1.36.scm`. Average damping takes fewer steps to converge. Initial guess of `2.0` has been used.

**Exercise 1.37**

`k = 11` gives an approximation that is accurate to 4 decimal places. Code is written in `ex1.37.scm`.

**Exercise 1.38**

Code is written in `ex1.38.scm`. To calculate the denominator for a particular `i`, the following procedure is used:

<pre>
if i = 2 mod 3
return i - quotient(i / 3)
else
return 1
</pre>

**Exercise 1.39**

Code is written in `ex1.39.scm`.

**Exercise 1.40**

Code is written in `ex1.40.scm`.

**Exercise 1.41**

Code is written in `ex1.41.scm`. In general, we can simplify `((double (double double)) proc)` as follows:

<pre>
(double double) = (lambda (x) (double (double x)))
(double (double double)) = (lambda (x) ((double double) ((double double) x))) = (lambda (x) (double (double (double (double x)))))
</pre>

In the case of `inc`, this simplifies to adding `16` to `x`. So, we get the answer of `(((double (double double)) inc) 5)` as `21`.

**Exercise 1.42**

Code is written in `ex1.42.scm`.

**Exercise 1.43**

Code is written in `ex1.43.scm`.

**Exercise 1.44**

Code is written in `ex1.44.scm`.

**Exercise 1.45**

Code is written in `ex1.45.scm`. It can be observed that on average, `(log (n + 1) / log 2) - 1` average dampings need to be done to extract the `n`-th root.

**Exercise 1.46**

Code is written in `ex1.46.scm`.
