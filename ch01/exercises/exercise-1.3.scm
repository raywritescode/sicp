; Ray Santos (raywritescode.com)
; September 4, 2014
;
; Structure and Interpretation of Computer Programs, Second Edition.
;
; Exercise 1.3, page 21
;
; Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers.

; rsantos notes
;
;   [This updated version fixes the problem identified by khirbat in a github 
;   comment on commit 6a4d114]
;
;   Using ONLY the Scheme constructs introduced up through page 21 of the SICP book.
;
;   Here's how I expect the procedure to operate.
;      Entering the command: (sum-squared-two-largest 5 4 6)
;      Returns: 61
;
;      Entering the command: (sum-squared-two-largest 4 6 5)
;      Returns: 61
;
;      Entering the command: (sum-squared-two-largest 6 5 4)
;      Returns: 61
;
;      Entering the command: (sum-squared-two-largest 3 3 3)
;      Returns: 18
;
;   pseudocode to find the sum of the squares of the largest two of three numbers.
;      get the largest number
;      get the smallest number
;      get the second largest number
;         sum the three numbers
;         sum the largest and smallest numbers
;         subtract the second sum from the first sum
;      sum the squared largest and second largest numbers
;      
; version 4

; get the largest number

(define (larger first second)
   (cond ((> first second) first)
         ((< first second) second)
         (else first)))

(define (largest x y z)
   (larger x (larger y z)))

; get the smallest number

(define (smaller first second)
   (cond ((> first second) second)
         ((< first second) first)
         (else first)))

(define (smallest x y z)
   (smaller x (smaller y z)))

; get the second largest number

(define (middle x y z)
   (- (+ x y z)
      (+ (largest x y z)
         (smallest x y z))))

; sum the squared largest and squared second largest numbers

(define (square x)
   (* x x))

(define (sum-squared-two-largest x y z)
   (+ (square (largest x y z))
      (square (middle x y z))))


; Test runs
;    1 ]=> (sum-squared-two-largest 5 4 6)
;    Value: 61
;
;    1 ]=> (sum-squared-two-largest 4 6 5)
;    Value: 61
;
;    1 ]=> (sum-squared-two-largest 6 5 4)
;    Value: 61
;
;    1 ]=> (sum-squared-two-largest 3 3 3)
;    Value: 18
