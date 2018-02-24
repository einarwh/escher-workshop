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

-- Entirely optional bonus exercise:
times : Int -> (a -> a) -> (a -> a)
times n fn = 
  if n == 0 then identity 
  else fn >> (times (n - 1) fn)

turns : Int -> (Picture -> Picture)
turns n = times n turn 

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

row : List Picture -> Picture 
row ps = 
  case ps of 
    [] -> blank
    [p] -> p 
    p::rest -> besideRatio 1 (List.length rest) p (row rest)

column : List Picture -> Picture 
column ps = 
  case ps of 
    [] -> blank
    [p] -> p 
    p::rest -> aboveRatio 1 (List.length rest) p (column rest)

nonet : Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture -> Picture 
nonet nw nm ne mw mm me sw sm se = 
  [[nw,nm,ne], [mw,mm,me], [sw,sm,se]]
  |> List.map row
  |> column

-- Exercise 8

over : Picture -> Picture -> Picture 
over p1 p2 = 
  \box -> p1 box ++ p2 box

overall : List Picture -> Picture 
overall ps = 
  \box -> List.concatMap (\p -> p box) ps

-- Exercise 9

ttile : Picture -> Picture
ttile fish = 
  let 
    fishN = fish |> toss |> flip
    fishE = fishN |> turn |> turn |> turn 
  in 
    overall [fish, fishN, fishE]

-- Exercise 10

utile : Picture -> Picture 
utile fish = 
  let 
    fishN = fish |> toss |> flip
    fishW = turn fishN
    fishS = turn fishW
    fishE = turn fishS
  in 
    overall [fishN, fishW, fishS, fishE]

-- Exercise 11

side : Int -> Picture -> Picture 
side n fish = 
  let 
    s = if n == 1 then blank else side (n - 1) fish 
    t = ttile fish 
  in 
    quartet s s (turn t) t  

-- Exercise 12

corner : Int -> Picture -> Picture 
corner n fish = 
  let 
    (c, s) = 
      if n == 1 then (blank, blank)
      else (corner (n - 1) fish, side (n - 1) fish)
  in 
    quartet c s (turn s) (utile fish)

-- Exercise 13

squareLimit : Int -> Picture -> Picture
squareLimit n fish = 
  let 
    c = corner n fish 
    s = side n fish 
    nw = c 
    nm = s 
    ne = c |> turn |> turn |> turn
    mw = s |> turn
    mm = utile fish 
    me = s |> turn |> turn |> turn
    sw = c |> turn
    sm = s |> turn |> turn
    se = c |> turn |> turn
  in
    nonet nw nm ne mw mm me sw sm se    
