; Ray Santos (raywritescode.com)
; August 12, 2014
;
; Structure and Interpretation of Computer Programs, Second Edition.
;
; Exercise 1.8
; page 26
;
; Newton's method for cube roots is based on the fact that if y is an
; approximation to the cube root of x, then a better approximation is 
; given by the value
;    
;    x/y^2 + 2y
;    ----------
;         3
;
; Use this formula to implement a cube-root procedure analogous to the
; square-root procedure. (In section 1.3.4 we will see how to implement
; Newton's method in general as an abstraction of these square-root and
; cube-root procedures.)

(define (cube x)
   (* x x x))

(define (improve guess x)
   (/ (+ (/ x (square guess))
         (* 2 guess))
      3))

(define (good-enough? guess x)
   (< (abs (- (cube guess) x)) 0.001))

(define (cube-iter guess x)
   (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x)
                 x)))

(define (cubert x)
   (cube-iter 1.0 x))

; Test runs

;1 ]=> (cubert 8)
;Value: 2.000004911675504

;1 ]=> (cubert 27)
;Value: 3.0000005410641766

;1 ]=> (cubert 125)
;Value: 5.000000000287929
