#lang sicp
(define (first-denomination koc)
    (cond ((= koc 1) 1)
        ((= koc 2) 5)
        ((= koc 3) 10)
        ((= koc 4) 25)
        ((= koc 5) 50)))

(define (cc amount koc)
    (cond ((= amount 0) 1)
        ((or (< amount 0) (= koc 0)) 0)
        (else (+ (cc amount (- koc 1))
                  (cc (- amount (first-denomination koc)) koc)))))


(define (count-change amount)
    (cc amount 5))

