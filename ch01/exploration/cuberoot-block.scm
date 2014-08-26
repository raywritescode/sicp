; Ray Santos (raywritescode.com)
; August 25, 2014
;
; Structure and Interpretation of Computer Programs, Second Edition.
;
; Block Structure version of my solution for Exercise 1.8, page 26, available
; on github.com/raywritescode/sicp/ch01/exercises/exercise-1.8.scm
;
; This block structure version of Exercise 1.8's solution nests the individual
; procedures for improve, good-enough?, cube-iter, and cube inside the
; cube-root procedure.
;
; More info about block structures is described on page 30 of SICP book.

(define (cube-root x) 

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

   (define (cube x) (* x x x))

   (cube-iter 1.0 x))

; Test runs

;1 ]=> (cube-root 8)
;Value: 2.000004911675504

;1 ]=> (cube-root 27)
;Value: 3.0000005410641766

;1 ]=> (cube-root 125)
;Value: 5.000000000287929
