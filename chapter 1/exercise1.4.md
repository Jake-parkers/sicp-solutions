Observe that our model of evaluation allows
for combinations whose operators are compound expressions.
Use this observation to describe the behavior of the
following procedure:

`
    (define (a-plus-abs-b a b)
        ((if (> b 0) + -) a b))
`

Answer

The operator in this case is `(if (> b 0) + -)`

Hence the procedure first checks if `b` is positive, if it is, it adds a and b `(+ a b)` otherwise, it evaluates to `(- a b)`. Hence the procedure computes `(a + |b|)`