
; CSC233 - 1 credit
; SIT@KMUTT by PM, 4/2022


; Racket is based on Scheme, which is a dialect of LISP
; LISP stands for List Procesing
; LISP was the first functional programming language
; LIST came out around 1960

; use this as starting of comments
; A quick highlights of Racket/Scheme

; Use () to indicate a list
; Here the first element is a function (addition)
; Following elements are parameters
; Use prefix format
(+ 4 9)


; ============= a quick look/summary of main features ===========

9  ; (9) would not work
; if you ' snf follow by () it wil be show ()
; code it's work! -> '(89) -> (89)
; whatever start with ' it will not execute
(+) ; same as (+ 0 0)
(*) ; same as (* 1 1)
(+ 2) ; same as (+ 0 2)
(+ 2 4 5) ; added sequence
(- 1 1 1 1 1)
(and #t #f)
(or #t #f)
; we can define variable name to sign (function)
; (define apple +) -> apple is like plus sign it can do like plus sign as well

3-5i ; complex number
; it will print 3-5i it cannot use j instead of i -> 3-5j -> would not work
(complex? 9) ; true
(= 8 8+0i) ; true
(real-part 3-5i)
(imag-part 3-5i)
(* +i +9i)


(/ 1 3) ; exact number
(/ 1 3.0) ; inexact number
(exact? (/ 1 3)) ; true
(= (/ 1 3) (/ 1.0 3.0)) ; false

#b1011 ; binary
#xAB ; hexadecimal


(define a 3.14) ; define a before using
a
(sqrt a)

(* a (sqrt 9)) ; nested functions

(quotient 13 5) ; predefined function
(remainder 13 5)
(modulo 13 5) ; same as remainder

; define our own function
(define (hello name)
  (string-append "Hi ..." name "!"))

(lambda (x) (+ 1 x))  ; a nmaeless function
((lambda (x) (+ 1 x)) 9)

(define myadd1 (lambda (x) (+ 1 x))) ; give a name to the lambda function
(myadd1 14)

(map myadd1 '(4 8 3)) ; example of higher-order function, map

(apply * '(1 2 3 4 5 6)) ; used for applying to all elements at once



; ============== more details =======================

; Elements in a list can be atom(s) or list(s)
; List can be nested
(abs -6.92)
(* 2 (+ 5 9))
(map - '(4 5))
; map function applies the absolute function to each element
(map abs '(-4 9 -2.5 0))
; apply function applies a given function to the whole list
(apply * '(3 5 10))

; quote will render the follows unevaluated
(quote (a b 5.6))
'(a b 99.2 boy)

; It is a dynamic typing
(define a 49)
a
(define a "hello")

; print out the value using display function
(display a)
; It is case-insensitive
(disPLAY "\n")
(DisplaY a)

; Boolean values
(display "\n")
#t  ; or use #true
#f

; Define a value (similar to assignment statement)
(define ab 4)
(display "\n")
(display ab)
(define B 4.0)
(newline)
(display b)
(display "\n")
(= ab b)
(equal? ab b)

; some arithmetic operations
(+ 4 5)
(+ 4 5 6)
(* 4 5)
(expt 2 8)
(sqrt 49)
(/ 4 5)
(/ 4.0 5)
(quotient 19 5)
(remainder 19 5)

(min 3 9 -5)

; some relational operations
(= 8 9)
(< 8 9)
(<= 23 9)

; some logical operations
(and #t #f)
(or (> 6 9) (< 5 5))
(not #f)

;others
(odd? 7)
(zero? 0)
(negative? -56)

; some control flows
(if #t 'yes 'nope)
(if (= 4 6) (display "It's eual") (display "Not equal"))
(newline)

; multiple conditions
(define (compare x y)
    (COND
         ((> x y) (DISPLAY "x is greater than y"))
         ((< x y) (DISPLAY "y is greater than x"))
         (ELSE (DISPLAY "x and y are equal"))
     )
)
(compare 17 37)
(newline)

; lambda function (or the so-called nameless function)
((lambda (x) (* x x x)) 3)

; how to name a function
(define (cube x) (* x x x))
; how to call the function
(cube 4)


; ============== dealing with lists =================


; car returns the first element
(car '( a b c 55 apple))
; cdr returns the list without the first element
(cdr '( a b c 55 apple))
; cons constructs a new list, but the second paramter must be a list
(cons 'abc '(59 mom -18))
; list creates a list from a given set of elements
(list 'a 'b '919 '(+ 2 4))
; append lists
(append '(a d) '(a b) '(yell) )

; check in a vareity of ways
(list? 'a)
(list? '())
(list? '(hello there))
(null? '())
(null? 'a)
(null? '(d o g))

; eq? is used to check equality of atom, use = for number
(eq? 'a 'b)
(eq? '9 '9)
(= 7 7)

; equal? is used to check equality of a list
(equal? '(a 9 bye) '(a 9 bye))
(equal? '(a 9 bye) '(a 9 buy))


; =============== creating some recursive functions ===================

; do some interesting functions
(define (fun n)
  (/ (- (* 3 n) 5) (+ n 1) )
 )

(fun 5)

; summation of n^2
; here you'll see how a recursion is used in a function call
(define (sumN2 n)
  ( if (= n 0)
     0
     (+ (* n n) (sumN2 (- n 1) ) )
   )
)