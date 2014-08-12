; Ray Santos (raywritescode.com)
; August 11, 2014
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

(define (good-enough? guess x)
   (< (abs (- (cube guess) x)) 0.001)

(define (improve guess x)
   (approximation ))         ; todo

(define (cube-iter guess x)
   (if (good-enough? guess x)
      guess
      (cube-iter (improve guess x)
                 x)))

(define (cube x)
   (cube-iter 1.0 x))
