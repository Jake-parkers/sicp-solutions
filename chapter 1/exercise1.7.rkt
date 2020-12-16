#lang sicp
(define (sqrt x)
  (sqrt-iter 1.0 x 0))

(define (average x y)
  (/ (+ x y) 2))


(define (improve guess x)
  (average (/ x guess) guess))



(define (good-enough? guess old-guess)
  (< (abs (-  old-guess guess)) 0.00000000000000000000000000000000000000000000001))


(define (sqrt-iter guess x old-guess)
  (if (good-enough? guess old-guess)
      guess
      (sqrt-iter (improve guess x) x guess)))


(define (square x)
  (* x x))