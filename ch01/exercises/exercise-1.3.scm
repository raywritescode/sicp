; Ray Santos (raywritescode.com)
; August 1, 2014
;
; Structure and Interpretation of Computer Programs, Second Edition.
;
; Exercise 1.3, page 21
;
; Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers.

; rsantos notes
;
;   Here's how I expect the procedure to operate.
;      Entering the command: (three-number-args 5 4 6)
;      Returns: 61
;
;      Entering the command: (three-number-args 3 3 3)
;      Returns: 18
;
;   What I already know how to do
;      square a number: (* a a)
;      sum two numbers; (+ a b)
;                  
;   pseudocode to find the largest of three numbers
;      if first is larger than second, first is larger, otherwise second is larger.
;      if second is larger than third, second is larger, otherwise third is larger. 
;      sum the squares of the two larger numbers.

; version 1
(define (three-number-args1 x y z)
   (+ (cond ((> x y) (* x x))      ;simpler to return the larger number squared 
            ((= x y) (* x x))
            ((< x y) (* y y)))
      (cond ((> y z) (* y y))
            ((= y z) (* y y))
            ((< y z) (* z z)))))


; version 2 
(define (three-number-args2 x y z)
   (+ (cond ((> x y) (* x x))
            (else (* y y)))
      (cond ((> y z) (* y y))
            (else (* z z)))))


; version 3
(define (three-number-args3 x y z)
   (+ (if (> x y) (* x x) (* y y))
      (if (> y z) (* y y) (* z z))))
