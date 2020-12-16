Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

`
    (define (new-if predicate then-clause else-clause)
        (cond (predicate then-clause)
            (else else-clause)))

`

Eva demonstrates the program for Alyssa:
` (new-if (= 2 3) 0 5)
5

(new-if (= 1 1) 0 5)
0
`

Delighted, Alyssa uses new-if to rewrite the square-root program:
`
    (define (sqrt-iter guess x)
        (new-if (good-enough? guess x)
            guess
            (sqrt-iter (improve guess x) x)))

`

## What happens when Alyssa attempts to use this to compute square roots? Explain.


The REPL enters an infinite loop. This happens because since new-if is a function it is evaluated using Applicative Order execution. While trying to execute

    (new-if(good_enough guess, x), guess, (sqrt_iter(improveguess, x), x));
it attempts to evaluate (sqrt_iter(improve guess, x), x) to get a value before executing the function with the resulting value (as the argument). But because sqrt_iter is a function that calls itself repeatedly (recursion), in the process of trying to evaluate (sqrt_iter(improve guess, x), x) the REPL gets stuck in an infinte loop.