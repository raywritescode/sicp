; Ray Santos (raywritescode.com)
; August 6, 2014
;
; Structure and Interpretation of Computer Programs, Second Edition.
;
; Exercise 1.6, page 25
;
; Alyssa P. Hacker doesn't see why if needs to be provided as a special form.
; "Why can't I just define it as an ordinary procedure in terms of cond?" 
; she asks. Alyssa's friend Eva Lu Ator claims this can indeed be done, and 
; she defines a new version of if:

(define (new-if predicate then-clause else-clause)
   (cond (predicate then-clause)
         (else else-clause)))

; Eva demonstrates the program for Alyssa:
;
;    (new-if (= 2 3) 0 5)
;    5
;
;    (new-if (= 1 1) 0 5)
;    0
;
; Delighted, Alyssa uses new-if to rewrite the square-root program:

(define (sqrt-iter guess x)
   (new-if (good-enough? guess x)
           guess
           (sqrt-iter (improve guess x)
                      x)))

; What happens when Alyssa attempts to use this to compute square roots?
; Explain.

; rsantos answer and explanation.
;
; Alyssa's new-if procedure will go into an infinite recursive loop when
; the (sqrt-iter (improve guess x) x) procedure is evaluated.
;
; The Scheme interpreter does its evaluations using applicative order. This
; means that the operators and operands are evaluated first and then the
; resulting procedure is applied to the procedure's arguments.
;
; In Alyssa's new-if procedure, an infinite recursive loop occurs because the
; sqrt-iter procedure is evaluated, which evaluates its recursed sqrt-iter
; procedure, which evaluates its recursed sqrt-iter, and so on. 
; 
; The top-level sqrt-iter procedure in Alyssa's new-if procedure has no way
; to expand to its primitive reductions.
;
; The new-if's recursion problem didn't happen during Eva's two demonstration 
; runs because the evaluated arguments were at their primitive reductions.
;
; The infinite recursive loop problem doesn't occur with if expressions
; because the consequent and alternative expressions behave as single 
; expressions. The (sqrt-iter (improve guess x) x) alternative expression
; is evaluated only one time and not multiple times recursively as is
; done for conditional expressions.
;
; From the footnote on page 19, section 1.1.6 of SICP
;
;   "A minor difference between if and cond is that the <e> part of each cond
;    clause may be a sequence of expressions. If the corresponding <p> is found
;    to be true, the expresions <e> are evaluated in sequence and the value of
;    the final expression in the sequence is returned as the value of the cond.
;    In an if expression, however, the <consequent> and <alternative> must be
;    single expressions." 
