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
    p = createPicture george
    nw = p
    ne = p |> Picture.flip |> turn |> turn
    sw = p |> turn |> turn
    se = p |> Picture.flip 
    pattern p = quartet p blank blank p 
    qq p = quartet p p p p 
  in     
    box |> (quartet nw ne sw se |> pattern |> qq)
        |> toSvg (400, 400)
 