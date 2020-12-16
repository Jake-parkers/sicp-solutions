The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers.

## Example - Small Numbers

`
(sqrt 0.0001)

gives 0.03230844833048122 meanwhile the correct answer is 0.01
`
In this case, based on the good-enough? function, we have said that the precision we want is 0.001, hence any number smaller than 0.001 would not have an accurate answer for the sqrt function.

## Example - Large Numbers

`
(sqrt 10000000000000000000000000000000)

hangs the event loop
`

The event loop hangs for large numbers because as numbers get larger, the difference between numbers of the magintude of the example above is more than 0.001 and so the good-enough? function will never return true at any point. Hence making the sqrt funtion run infintely.


## Alternative strategy
An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

`
(define (good-enough? guess old-guess)
  (< (abs (-  old-guess guess)) 0.000000000000000001))
`
