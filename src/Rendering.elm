module Rendering exposing (toSvg, toSvgWithBoxes)

import Vector exposing (..)
import Shape exposing (..)
import Style exposing (..)
import Box exposing (..)
import Picture exposing (..)
import Mirror exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Html.Attributes

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

toBoxPolylineElement : List Vector -> Svg msg
toBoxPolylineElement pts = 
  let 
    s = 
      let 
        str {x, y} = (f2s x) ++ "," ++ (f2s y)
      in
        pts |> List.map str |> String.join " "
    sw = 1
  in
    Svg.polyline 
      [ stroke "Grey"
      , strokeWidth <| f2s sw
      , strokeDasharray "2,2"
      , fill "None"
      , points s ] []

toBoxLine : (Vector -> Vector) -> Vector -> Vector -> (String, String) -> Svg msg
toBoxLine m v1 v2 (name, color) = 
  let 
    w1 = m v1 
    w2 = m (add v1 v2) 
  in
    Svg.line 
      [ x1 <| f2s w1.x
      , y1 <| f2s w1.y 
      , x2 <| f2s w2.x
      , y2 <| f2s w2.y
      , stroke color
      , strokeWidth "1.5"
      , markerEnd <| "url(#" ++ name ++ ")" ] []

acolor : String 
acolor = "#88499c"

bcolor : String 
bcolor = "#2381bf"

ccolor : String 
ccolor = "#27b15b"

axiscolor : String 
axiscolor = "black"

toBoxArrows : (Vector -> Vector) -> Box -> List (Svg msg)
toBoxArrows m { a, b, c } =
  [ toBoxLine m { x = 0, y = 0 } a ("a-arrow", acolor)
  , toBoxLine m a b ("b-arrow", bcolor)
  , toBoxLine m a c ("c-arrow", ccolor) ]

toBoxShape : (Vector -> Vector) -> Box -> List Vector
toBoxShape m { a, b, c } = 
  let
    b2 = add a b
    c2 = add a c 
    d = add a (add b c)
    pts = [m a, m b2, m d, m c2, m a]
  in
    pts

toBoxArrowLines : (Vector -> Vector) -> Box -> List Vector
toBoxArrowLines m { a, b, c } = 
  let
    b2 = add a b
    c2 = add a c 
    d = add a (add b c)
    pts = [m a, m b2, m d, m c2, m a]
  in
    pts

createAxisList : Int -> Int -> List Int 
createAxisList interval n = 
  if n < 1 then []
  else 
    let next = n - interval
    in 
      n :: createAxisList interval next

createXAxisElement : Int -> Int -> Svg msg
createXAxisElement y x = 
  Svg.line 
    [ x1 <| i2s x
    , y1 <| i2s (y + 3)
    , x2 <| i2s x
    , y2 <| i2s (y - 3)
    , stroke "black"
    , strokeWidth "1.0" ] []

createXAxis : Int -> Int -> List (Svg msg) 
createXAxis xmax ypos = 
  let 
    axisList = createAxisList 40 xmax
  in 
    axisList |> List.map (\x -> xmax - x) |> List.map (createXAxisElement ypos) |> List.drop 1

createYAxisElement : Int -> Int -> Svg msg
createYAxisElement x y = 
  Svg.line 
    [ x1 <| i2s (x - 3)
    , y1 <| i2s y
    , x2 <| i2s (x + 3)
    , y2 <| i2s y
    , stroke "black"
    , strokeWidth "1.0" ] []

createYAxis : Int -> Int -> List (Svg msg) 
createYAxis xpos ymax = 
  let 
    axisList = createAxisList 40 ymax
  in 
    axisList |> List.map (createYAxisElement xpos) |> List.drop 1

createMarker : (String, String) -> Svg msg
createMarker (markerId, color) = 
  Svg.marker 
    [ id markerId
    , markerWidth "10"
    , markerHeight "10"
    , refX "9"
    , refY "3"
    , orient "auto"
    , markerUnits "strokeWidth" ] 
    [ Svg.path 
      [ d "M0,0 L0,6 L9,3 z"
      , fill color ] [] ]

createAxes : Int -> Int -> List (Svg msg)
createAxes w h = 
  let 
    xx = i2s 0
    yy = i2s h
    axisColor = "black"
    xAxis =     
      Svg.line 
        [ x1 <| i2s 0
        , y1 yy
        , x2 <| i2s w
        , y2 yy
        , stroke axisColor
        , strokeWidth "1.0"
        , markerEnd <| "url(#axis-arrow)" ] []
    yAxis =  
      Svg.line 
        [ x1 xx
        , y1 <| i2s w
        , x2 xx
        , y2 <| i2s 0
        , stroke axisColor
        , strokeWidth "1.0"
        , markerEnd <| "url(#axis-arrow)" ] []
  in 
    [ xAxis, yAxis ] ++ createXAxis w h ++ createYAxis 0 h

toSvgWithBoxes : (Int, Int) -> List Box -> Rendering -> Svg msg 
toSvgWithBoxes bounds boxes rendering = 
  let
    (w, h) = bounds
    -- viewBoxValue = ["-2", "-2", i2s w, i2s h] |> String.join " "
    mirror = mirrorVector <| toFloat h
    boxShapes = boxes |> List.map (toBoxShape mirror) |> List.map toBoxPolylineElement
    boxArrows = boxes |> List.concatMap (toBoxArrows mirror)
    toElement (shape, style) = toSvgElement style (mirrorShape mirror shape)
    things = rendering |> List.map toElement
    axes = createAxes w h
    vectorMarkers =
      [ ("a-arrow", acolor)
      , ("b-arrow", bcolor)
      , ("c-arrow", ccolor)
      , ("axis-arrow", axiscolor) ]
    axisMarker = ("axis-arrow", axiscolor)
    markers = vectorMarkers ++ [ axisMarker ]
    defs = markers |> List.map createMarker |> Svg.defs []
    svgElements = 
      case boxes of 
      [] -> things
      _ -> ([defs] ++ things ++ boxShapes ++ boxArrows ++ axes)
    xStr = "-3"
    yStr = "0"
    widthStr = i2s (w + 3)
    heightStr = i2s (h + 3)
    viewBoxStr = [ xStr, yStr, widthStr, heightStr ] |> String.join " "
  in
    -- version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
    svg
      [ version "1.1"
      , Html.Attributes.attribute "xmlns" "http://www.w3.org/2000/svg"
      , viewBox viewBoxStr
      , x (xStr ++ "px")
      , y (yStr ++ "px")
      , width widthStr
      , height heightStr 
      , Svg.Attributes.style "background-color:white" ]
      svgElements

toSvg : (Int, Int) -> Rendering -> Svg msg 
toSvg bounds rendering = 
  toSvgWithBoxes bounds [] rendering 
