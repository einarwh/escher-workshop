module Sheet exposing (..)

-- A comment.

-- A function with two parameters.
-- The type signature is optional.
add : Int -> Int -> Int
add a b = a + b

-- Essentially same function.
-- It's just a name bound to an anonymous function.
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

-- Defining an alias for a tuple type.
-- Pair is the alias, ( Int, Int ) is the tuple type.
type alias Pair = ( Int, Int )

-- Using the tuple type alias in a function signature, 
-- with parameter destructuring.
addtup : Pair -> Int 
addtup (x, y) = x + y

-- Same function without type alias.
addtuple : (Int, Int) -> Int 
addtuple (x, y) = x + y 

-- Defining an alias for a record type.
-- Point is the alias, { x : Int, y : Int } is the record type.
type alias Point = { x : Int, y : Int }

-- Using the record type alias in a function signature.
movepoint : Point -> Point 
movepoint pt = 
  { x = pt.x + 1, y = pt.y + 1 }

-- Same function with let bindings.
movept2 : Point -> Point 
movept2 pt =
  let 
    x = pt.x 
    y = pt.y 
  in 
    { x = x, y = y }

-- Same function with parameter destructuring.
movept3 : Point -> Point 
movept3 { x, y } = 
  { x = x + 1, y = y + 1 }
