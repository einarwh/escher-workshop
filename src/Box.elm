module Box exposing (..)

import Vector exposing (..)

type alias Box = 
  { a : Vector
  , b : Vector
  , c : Vector }

-- Exercise 1 

turnBox : Box -> Box 
turnBox { a, b, c } = 
  { a = add a b 
  , b = c 
  , c = neg b }

flipBox : Box -> Box 
flipBox { a, b, c } = 
  { a = add a b
  , b = neg b
  , c = c }
