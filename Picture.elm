module Picture exposing (..)

import Box exposing (..)
import Shape exposing (..)
import Style exposing (..)

type alias Rendering = List (Shape, Style)

type alias Picture = Box -> Rendering  

blank : Picture 
blank _ = []

-- Exercise 1

turn : Picture -> Picture
turn p = turnBox >> p 

-- Exercise 2

flip : Picture -> Picture 
flip p = flipBox >> p 

-- Exercise 3

toss : Picture -> Picture 
toss p = tossBox >> p 

-- Exercise 4

aboveRatio : Int -> Int -> Picture -> Picture -> Picture 
aboveRatio m n p1 p2 = 
  \box -> 
    let 
      f = toFloat m / toFloat (m + n)
      (b1, b2) = splitVertically f box
    in 
      (p1 b1) ++ (p2 b2) 

above : Picture -> Picture -> Picture 
above = aboveRatio 1 1 

-- Exercise 5

besideRatio : Int -> Int -> Picture -> Picture -> Picture 
besideRatio m n p1 p2 = 
  \box -> 
    let 
      f = toFloat m / toFloat (m + n)
      (b1, b2) = splitHorizontally f box
    in 
      (p1 b1) ++ (p2 b2) 

beside : Picture -> Picture -> Picture 
beside = besideRatio 1 1 

-- Exercise 6

quartet : Picture -> Picture -> Picture -> Picture -> Picture
quartet nw ne sw se = 
  above (beside nw ne)
        (beside sw se)

-- Exercise 7

nonet : Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture 
nonet nw nm ne mw mm me sw sm se = blank

-- Exercise 8

over : Picture -> Picture -> Picture 
over p1 p2 = blank

-- Exercise 9

ttile : Picture -> Picture
ttile fish = blank

-- Exercise 10

utile : Picture -> Picture 
utile fish = blank

-- Exercise 11

side : Int -> Picture -> Picture 
side n fish = blank

-- Exercise 12

corner : Int -> Picture -> Picture 
corner n fish = blank

-- Exercise 13

squareLimit : Int -> Picture -> Picture
squareLimit n fish = blank
