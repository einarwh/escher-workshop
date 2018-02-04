module Box exposing (..)

import Vector exposing (..)

type alias Box = 
  { a : Vector
  , b : Vector
  , c : Vector }

turnBox : Box -> Box
turnBox { a, b, c } = 
  { a, b, c }

flipBox : Box -> Box 
flipBox { a, b, c } = 
  { a, b, c }

tossBox : Box -> Box 
tossBox { a, b, c } = 
  { a, b, c }

moveVertically : Float -> Box -> Box 
moveVertically f { a, b, c } = 
  { a, b, c }
  
moveHorizontally : Float -> Box -> Box 
moveHorizontally f { a, b, c } = 
  { a, b, c }

scaleVertically : Float -> Box -> Box 
scaleVertically f { a, b, c } = 
  { a, b, c }

scaleHorizontally : Float -> Box -> Box 
scaleHorizontally f { a, b, c } = 
  { a, b, c }

splitVertically : Float -> Box -> (Box, Box)
splitVertically f box = 
  (box, box)

splitHorizontally : Float -> Box -> (Box, Box)
splitHorizontally f box = 
  (box, box)
  