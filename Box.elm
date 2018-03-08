module Box exposing (..)

import Vector exposing (..)

type alias Box = 
  { a : Vector
  , b : Vector
  , c : Vector }

turnBox : Box -> Box 
turnBox { a, b, c } = 
  { a = add a b
  , b = c
  , c = neg b }
