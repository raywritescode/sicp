; Ray Santos (raywritescode.com)
; September 5, 2014
;
; Structure and Interpretation of Computer Programs, Second Edition.
;
; Exercise 1.3, page 21 (Block structure version using lexical scoping)
;
; Define a procedure that takes three numbers as arguments
; and returns the sum of the squares of the two larger numbers.

; rsantos notes
;
;   Using ONLY the Scheme constructs introduced up through page 26 of the SICP book.
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

; block structured lexical version
(define (sum-squared-two-largest x y z)

   (define (larger first second)
      (cond ((> first second) first)
            ((< first second) second)
            (else first)))

   (define (largest x y z)
      (larger x (larger y z)))

   (define (smaller first second)
      (cond ((> first second) second)
            ((< first second) first)
            (else first)))

   (define (smallest x y z)
      (smaller x (smaller y z)))

   (define (middle x y z)
      (- (+ x y z)
         (+ (largest x y z)
            (smallest x y z))))

   (define (square x)
      (* x x))

   (+ (square (largest x y z))
      (square (middle x y z))))
