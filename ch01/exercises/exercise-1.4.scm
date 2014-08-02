; Ray Santos (raywritescode.com)
; August 1, 2014
;
; Structure and Interpretation of Computer Programs, Second Edition.
;
; Exercise 1.4
;
; Observe that our model of evaluation allows for combinations whose
; operators are compound expressions. Use this observation to describe
; the behavior of the following procedure:

(define (a-plus-abs-b a b)
   ((if (> b 0) + -) a b))

; rsantos - The procedure checks if the value of b is greater than 0.
;   If greater, then the value of b is added to the value of a.
;   Otherwise, the value of b is subtracted from the value of a.
;
; Manual step-through of code on paper.
;   Test 1
;   - assign 4 to a and 6 to b
;   - value of b is greater than 0
;   - add 6 to 4 to give 10
;
;   Test 2
;   - assign 4 to a and -6 to b
;   - value of b is less than 0
;   - subtract -6 from 4 to give 10  
;
; Using MIT Scheme.
;   Test 1
;      1 ]=> (a-plus-abs-b 4 6)
;      Value: 10
;
;   Test 2
;      1 ]=> (a-plus-abs-b 4 -6)
;      Value: 10
