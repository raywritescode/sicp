; Ray Santos (raywritescode.com)
; August 2, 2014
;
; Structure and Interpretation of Computer Programs, Second Edition.
;
; Exercise 1.5
;
; Ben Bitdiddle has invented a test to determine whether the interpreter he is
; faced with is using applicative-order evaluation or normal-order evaluation.
; He defines the following two procedures:
;
    (define (p) (p))

    (define (test x y)
       (if (= x 0)
          0
          y))
;
; Then he evaluates the expression
; 
    (test 0 (p))
;
; What behavior will Ben observe with an interpreter that uses applicative-
; order evaluation? What behavior will he observe with an interpreter that
; uses normal evaluation? Explain your answer. (Assume that the evaluation
; rule for the special form if is the same whether the interpreter is using
; normal or applicative order: The predicate expression is evaluated first,
; and the result determines whether to evaluate the consequent or the
; alternative expression.)

; rsantos
; Behavior with an applicative-order evaluation interpreter.      
; The applicative-order evaluation interpreter will do the following steps:
;    1. assign 0 to x
;    2. assign procedure (p) to y and immediately attempts to evaluate (p). 
;    3. stop at step 2 because y's (p) can't be acted upon.
; To Ben, it will look like the (test x y) execution does nothing. The
; Scheme prompt probably won't be displayed.
;
; Behavior with a normal evaluation interpreter.
; The normal evaluation interpreter will do the following steps: 
;   1. On execution of (test 0 (p)) the interpreter will assign to x
;      the value of 0 and procedure (p) to y.
;   2. The interpreter will then substitute 0 for the x in the if.
;   3. The if will then be evaluated, which evaluates to true because 0 = 0.
;   4. The value of 0 is returned.
;   5. Because the if was exited as true, the alternative path of y is
;      not executed, which prevents y's (p) from being acted upon and causing
;      the behavior described in step 3 of the applicative-order scenario.
; To Ben, the (test 0 (p)) execution returns value 0. 
