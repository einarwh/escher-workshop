module Main exposing (main)

import Letter exposing (..)
import Box exposing (..)
import Figure exposing (george)
import Fishy exposing (fishShapes)
import Fitting exposing (createPicture)
import Picture exposing (..)
import Rendering exposing (toSvg, toSvgWithBoxes)
import Svg exposing (Svg)
import Html exposing (..)
import Html.Attributes exposing (..)

placeInsideDiv : Svg msg -> Html msg 
placeInsideDiv svg = 
  div [ style [ ("padding", "50px") ] ] [ svg ]

main : Html msg
main = 
  let 
    box = { a = { x = 75.0, y = 75.0 }
          , b = { x = 150.0, y = 0.0 }
          , c = { x = 0.0, y = 150.0 } }
    -- box = { a = { x = 75.0, y = 75.0 }
    --       , b = { x = 200.0, y = 20.0 }
    --       , c = { x = 20.0, y = 100.0 } }
    -- box = { a = { x = 75.0, y = 50.0 }
    --       , b = { x = 210.0, y = 20.0 }
    --       , c = { x = -30.0, y = 70.0 } }
    -- box = { a = { x = 80.0, y = 40.0 }
    --       , b = { x = 80.0, y = 10.0 }
    --       , c = { x = 30.0, y = 200.0 } }
    h = createPicture hLetter 
    e = createPicture eLetter 
    n = createPicture nLetter 
    d = createPicture dLetter 
    r = createPicture rLetter 
    s = createPicture sLetter 
    o = createPicture oLetter 

    fpicture = createPicture fLetter 
    gpicture = createPicture george
    (b1, b2) = splitVertically 0.5 box
    fish = createPicture fishShapes
  in     
    box |> o
        |> toSvgWithBoxes (300, 300) [ ]
        |> placeInsideDiv
 