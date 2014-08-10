; Ray Santos (raywritescode.com)
; August 9, 2014
;
; Structure and Interpretation of Computer Programs, Second Edition.
;
; Exercise 1.7 (first part)
;
; The good-enough? test used in computing square roots will not be very
; effective for finding the square roots of very small numbers. Also, in 
; real computers, arithmetic operations are almost always performed with
; limited precision. This makes our test inadequate for very large numbers.
; Explain these statements, with examples showing how the test fails for
; small and large numbers.

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
   (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; Very small numbers. If the value being squared is equal to or smaller
; than the predetermined tolerance level of 0.001 in the good-enough?
; procedure, the calculated squared value of 0.001 is wrong.
; For example:
(sqrt 0.001)
; returns Value: .04124542607499115
; compared to the value .0316227766 when manually squaring the value
; of 0.001 using a calculator. 

; Very large numbers. If the value being squared is greater than
; 999,999,999,999,999 the Scheme interpreter will appear unresponsive.
; For example:
(sqrt 1000000000000000)
; unresponsive. Have to press ctrl-g (^G) to quit execution.
;  Quit!
; However, the value 999,999,999,999,999 is processed.
(sqrt 999999999999999)
;Value: 31622776.601683777
