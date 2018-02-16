module Sheet exposing (..)

-- A comment.

-- A function with two parameters.
-- The type signature is optional.
add : Int -> Int -> Int
add a b = a + b

-- Essentially same function.
addagain : Int -> Int -> Int
addagain = \a -> \b -> a + b

-- Partial application.
inc : Int -> Int
inc = add 1

-- Another function.
double : Int -> Int
double x = x + x

-- Function composition.
-- Given an integer (say 5), double it (10), and then increment that (11)
fn1 : Int -> Int
fn1 = double >> inc

-- Given an integer (5 again), increment (6), and then double that (12).
fn2 : Int -> Int 
fn2 = inc >> double

-- Increment whatever integer three times.
incthrice : Int -> Int
incthrice = inc >> inc >> inc 

-- Pipe forward.
incthriceagain : Int -> Int 
incthriceagain n = n |> inc |> inc |> inc

-- Combine lists.
join : List a -> List a -> List a
join xs ys = xs ++ ys

-- Combine many lists starring recursion and destructuring.
joinall : List (List a) -> List a
joinall xss = 
  case xss of 
   [] -> []
   xs :: tail -> xs ++ joinall tail
 