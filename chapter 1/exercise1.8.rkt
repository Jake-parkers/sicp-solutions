#lang sicp
(define (cube-rt x)
  (cube-iter 1.0 x 0))


(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))



(define (good-enough? guess old-guess)
  (< (abs (-  old-guess guess)) 0.00000000000000000000000000000000000000000000001))


(define (cube-iter guess x old-guess)
  (if (good-enough? guess old-guess)
      guess
      (cube-iter (improve guess x) x guess)))


(define (square x)
  (* x x))