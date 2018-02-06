module Box exposing (..)

import Vector exposing (..)

type alias Box = 
  { a : Vector
  , b : Vector
  , c : Vector }

turnBox : Box -> Box
turnBox box = box 

flipBox : Box -> Box 
flipBox box = box 

tossBox : Box -> Box 
tossBox box = box

moveVertically : Float -> Box -> Box 
moveVertically f box = box 
  
moveHorizontally : Float -> Box -> Box 
moveHorizontally f box = box 

scaleVertically : Float -> Box -> Box 
scaleVertically f box = box 

scaleHorizontally : Float -> Box -> Box 
scaleHorizontally f box = box 

splitVertically : Float -> Box -> (Box, Box)
splitVertically f box = 
  (box, box)

splitHorizontally : Float -> Box -> (Box, Box)
splitHorizontally f box = 
  (box, box)
  