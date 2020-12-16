Ben Bitdiddle has invented a test to determine
whether the interpreter he is faced with is using applicativeorder
evaluation or normal-order evaluation. He defines the
following two procedures:

`
(define (p) (p))
(define (test x y)
    (if (= x 0) 0 y))

`
Then he evaluates the expression

`(test 0 (p))`


What behavior will Ben observe with an interpreter that
uses applicative-order evaluation? What behavior will he
observe with an interpreter that uses normal-order evaluation?
Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter
is using normal or applicative order: The predicate
expression is evaluated first, and the result determines
whether to evaluate the consequent or the alternative expression.)


Answer
### Applicative Order
`
(test 0 (p))
(test 0 (p))
(test 0 (p))
(test 0 (p))
(test 0 (p))
.
.
.
`

With the applicative-order evaluation, The arguments to test will be evaulated first before being used by the function expression. Hence p() will evaluated which will lead to the function p being called endlessly until the call stack size is exceeded.

### Normal Order
`
(test 0 (p))

(if (= x 0) 
    0 
    (p)
)

0
`

With the normal-order evaluation, the arguments passed will first be substituted with the params until the expression contains only primitive values (0 === 0 ? p()) in which case, the answer will be 0 because p() will never need to be evaluated