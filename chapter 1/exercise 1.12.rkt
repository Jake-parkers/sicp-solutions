#|
    The following pattern of numbers is called Pascal’s triangle.
                1
               1 1
              1 2 1
             1 3 3 1
            1 4 6 4 1
               . . .
    The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.
#|

#|
    Solution

Thinking in terms of rows and columns, the solution to this problem is based on the below idea:

If we denote row as r and column as c, we can simplify the problem by saying: COMPUTE THE VALUE OF THE VALUE OF THE Cᵗʰ COLUMN OF THE Rᵗʰ row.

    value of the cᵗʰ column = value at (r - 1)ᵗʰ(c)ᵗʰ + (r - 1)ᵗʰ(c - 1)ᵗʰ (i.e each number inside the triangle is the sum of the two numbers above it e.g 3 = 2 + 1)

The below observations will act as the base cases:

1. Notice that the value at the 0ᵗʰ column and the rᵗʰ column will always be 1
2. Notice that the value at row 1 column 0 will always be 1
3. Notice that no values exist (or rather we can say the value is 0) for the 0ᵗʰ row and columns > 0

Hence the recurrence relation below:

P(row, col): 1 if col = 0
             0 if row = 0
             1 if col = 0, row = 1
             p(row - 1, c) + p(row - 1, col - 1) otherwise
#|

#lang sicp
(define (pascal row col)
    (cond ((= col 0) 1)
          ((= row 0) 0)
          ((and (= col 1) (= row 1)) 1)
          (else (+ (pascal (- row 1) col) (pascal (- row 1) (- col 1))))))

(pascal 3 2)