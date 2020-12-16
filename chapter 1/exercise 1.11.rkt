;Exercise 1.11: A function f is defined by the rule that
f (n) =
    n if n < 3,
    f (n - 1) + 2f (n - 2) + 3f (n - 3) if n > 3.

;Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.


; SOLUTION

(define (func n)
    (if (< n 3)
        n
        (+ (func (- n 1)) (* 2 (func (- n 2))) (* 3 (func (- n 3))))))


 #|
    ITERATIVE PROCEDURE
    The iterative procedure for the above problem can be gotten with the below idea
    We use three integers a b and c initialized to 2, 1 and 0 respectively (the first 3 values of the function as defined by the function). Then we apply the below tranformation simultaneously

    a <- a + (2 * b) + (3 * c)
    b <- a
    c <- b

    This will give us precisely f(n) - a, f(n-1) - b, f(n - 2), c

|#

(define (func n)
    (define (func-iter a b c count)
        (cond ((< n 3) n)
            ((> count n) a)
            (else (func-iter (+ a (* 2 b) (* 3 c)) a b (+ count 1)))))
    (func-iter 2 1 0 3))