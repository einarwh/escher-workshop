module Sample exposing (..)

-- A comment.

-- A function with two parameters.
-- The type signature is optional.
add : Int -> Int -> Int
add a b = a + b

-- Essentially same function.
addagain = \a -> \b -> a + b

-- Partial application
inc = add 1



