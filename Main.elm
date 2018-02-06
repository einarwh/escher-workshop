module Main exposing (..)

import Letter exposing (..)
import Figure exposing (george)
import Fishy exposing (..)
import Fitting exposing (..)
import Picture exposing (..)
import Rendering exposing (..)
import Svg exposing (Svg)

main : Svg msg
main = 
  let 
    box = { a = { x = 0.0, y = 0.0 }
          , b = { x = 200.0, y = 0.0 }
          , c = { x = 0.0, y = 200.0 } }
    f = createPicture fLetter
    h = createPicture hLetter
    e = createPicture eLetter
    n = createPicture nLetter
    d = createPicture dLetter 
    r = createPicture rLetter 
    s = createPicture sLetter 
    o = createPicture oLetter
    nw = h
    nm = e 
    ne = n 
    mw = d 
    mm = e 
    me = r 
    sw = s 
    sm = o
    se = n
    name = nonet nw nm ne mw mm me sw sm se 
    zoom p = nonet nw nm ne mw p me sw sm se 
    fish = createPicture hendersonFishShapes
    g = createPicture george 
  in     
    box |> Picture.flip f |> toSvg (200, 200)
 