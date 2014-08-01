; Ray Santos (raywritescode.com)
; July 31, 2014
;
; SICP, 2nd Ed.
;
; Exercise 1.2
;
; Translate the following expression into prefix form
;
; 5 + 4 + (2 - (3 - (6 + 4 / 5)))
; ------------------------------
;      3(6 - 2)(2 - 7)


; rsantos answer calculated manually = -74/300 or -0.246666667

; rsantos prefix form solution

(/ (+ 5 4 
        (- 2 
           (- 3 
              (+ 6 
                 (/ 4 5)))))
   (* 3 
      (- 6 2) 
      (- 2 7)))

; Scheme answer = -37/150      which is -0.246666667
