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
    fish = createPicture fishShapes
    f = createPicture fLetter
    g = createPicture george     
  in     
    box |> f
        |> toSvg (200, 200)
 