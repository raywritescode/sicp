; Ray Santos (raywritescode.com)
; July 31, 2014
;
; SICP, 2nd Ed.
;
; Exercise 1.1
;
; Below is a sequence of expressions. What is the result
; printed by the interpreter in response to each expression?
;
; Assume that the sequence is to be evaluated in the order
; in which it is presented.

10         
        
;  My answer = 10
;  Scheme = 10

(+ 5 3 4)

;  My answer = 12
;  Scheme = 12

(- 9 1)

;  My answer = 8
;  Scheme = 8

(/ 6 2)

;  My answer = 3
;  Scheme = 3

(+ (* 2 4) (- 4 6))

;  My answer = 6
;  Scheme = 6

(define a 3)

;  My answer = a
;  Scheme = a

(define b (+ a 1))

;  My answer = b
;  Scheme = b

(+ a b (* a b))

;  My answer = 19
;  Scheme = 19

(= a b)

;  My answer = false
;  Scheme = #f

(if (and (> b a) (< b (* a b)))
    b
    a)

;  My answer = 4
;  Scheme = 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))

;  My answer = 16
;  Scheme = 16

(+ 2 (if (> b a) b a))

;  My answer = 6
;  Scheme = 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1)) 

;  My answer = 16
;  Scheme = 16  
