module Style exposing (..)

type StyleColor = Black | Grey | White 

type alias StrokeStyle = 
  { strokeWidth : Float 
  , strokeColor : StyleColor }

type alias FillStyle = 
  { fillColor : StyleColor }

type alias Style = 
  { stroke : Maybe StrokeStyle 
  , fill : Maybe FillStyle }