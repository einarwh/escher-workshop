module Box exposing (..)

import Vector exposing (..)

type alias Box = 
  { a : Vector
  , b : Vector
  , c : Vector }

-- Exercise 1 

turnBox : Box -> Box 
turnBox { a, b, c } = 
  { a = a 
  , b = b 
  , c = c }
