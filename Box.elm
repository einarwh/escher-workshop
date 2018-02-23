module Box exposing (..)

import Vector exposing (..)

type alias Box = 
  { a : Vector
  , b : Vector
  , c : Vector }

-- (a’, b’, c’) = (a + b, c, -b)
turnBox : Box -> Box
turnBox { a, b, c } = 
  { a = add a b
  , b = c
  , c = neg b }

-- (a’, b’, c’) = (a + b, -b, c)
flipBox : Box -> Box 
flipBox { a, b, c } = 
  { a = add a b
  , b = neg b
  , c = c }

-- (a’, b’, c’) = (a + (b + c) / 2, (b + c) / 2, (c − b) / 2)
tossBox : Box -> Box
tossBox { a, b, c } = 
  { a = add a (scale 0.5 (add b c))
  , b = scale 0.5 (add b c)
  , c = scale 0.5 (sub c b) }
  