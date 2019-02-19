module Rendering exposing (toSvg)

import Vector exposing (Vector)
import Shape exposing (..)
import Style exposing (..)
import Picture exposing (..)
import Mirror exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)

f2s : Float -> String 
f2s = String.fromFloat 

i2s : Int -> String 
i2s = String.fromInt

getStrokeWidthFromStyle : Maybe StrokeStyle -> Float
getStrokeWidthFromStyle style = 
  case style of 
    Just { strokeWidth } -> sqrt strokeWidth
    Nothing -> 2.0

toPolygonElement : Style -> List Vector -> Svg msg
toPolygonElement style pts = 
  let 
    s = 
      let 
        str {x, y} = (f2s x) ++ "," ++ (f2s y)
      in
        pts |> List.map str |> String.join " "
    sw = getStrokeWidthFromStyle style.stroke  
  in
    Svg.polygon 
      [ stroke "Black"
      , strokeWidth <| f2s sw
      , fill "None"
      , points s ] []

toPolylineElement : Style -> List Vector -> Svg msg
toPolylineElement style pts = 
  let 
    s = 
      let 
        str {x, y} = (f2s x) ++ "," ++ (f2s y)
      in
        pts |> List.map str |> String.join " "
    sw = getStrokeWidthFromStyle style.stroke  
  in
    Svg.polyline 
      [ stroke "Black"
      , strokeWidth <| f2s sw
      , fill "None"
      , points s ] []

toCurveElement : Style -> Vector -> Vector -> Vector -> Vector -> Svg msg
toCurveElement style pt1 pt2 pt3 pt4 = 
  let 
    toStr {x, y} = (f2s x) ++ " " ++ (f2s y)
    pt1s = toStr pt1
    pt2s = toStr pt2 
    pt3s = toStr pt3 
    pt4s = toStr pt4 
    dval = "M" ++ pt1s ++ " C " ++ pt2s ++ ", " ++ pt3s ++ ", " ++ pt4s
    sw = getStrokeWidthFromStyle style.stroke  
  in 
    Svg.path 
      [ stroke "Black"
      , strokeWidth <| f2s sw
      , fill "None"
      , d dval ] []

toSvgElement : Style -> Shape -> Svg msg
toSvgElement style shape = 
  case shape of  
    Polygon { points } -> toPolygonElement style points    
    Polyline { pts } -> toPolylineElement style pts
    Curve { point1, point2, point3, point4 } ->
      toCurveElement style point1 point2 point3 point4 
    x -> text "nothing"

toSvg : (Int, Int) -> Rendering -> Svg msg 
toSvg bounds rendering = 
  let
    (w, h) = bounds
    viewBoxValue = ["0", "0", i2s w, i2s h] |> String.join " "
    mirror = mirrorVector <| toFloat h
    toElement (shape, style) = toSvgElement style (mirrorShape mirror shape)
  in
    svg
      [ version "1.1", x "0", y "0", width (i2s w), height (i2s h) ]
      (rendering |> List.map toElement)
