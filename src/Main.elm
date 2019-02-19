module Main exposing (main)

import Letter exposing (..)
import Figure exposing (george)
import Fishy exposing (fishShapes)
import Fitting exposing (createPicture)
import Picture exposing (..)
import Rendering exposing (toSvg)
import Svg exposing (Svg)

main : Svg msg
main = 
  let 
    box = { a = { x = 75.0, y = 75.0 }
          , b = { x = 250.0, y = 0.0 }
          , c = { x = 0.0, y = 250.0 } }
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
    zoom p = nonet nw nm ne mw p me sw sm se 
  in     
    box |> (nonet nw nm ne mw mm me sw sm se |> zoom |> zoom)
        |> toSvg (400, 400)
 