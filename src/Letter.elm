module Letter exposing (..)

import Shape exposing (..)

fShape : Shape
fShape = 
  let 
    pts = 
      [ { x = 0.30, y = 0.20 } 
      , { x = 0.40, y = 0.20 }
      , { x = 0.40, y = 0.45 }
      , { x = 0.60, y = 0.45 }
      , { x = 0.60, y = 0.55 }
      , { x = 0.40, y = 0.55 }
      , { x = 0.40, y = 0.70 }
      , { x = 0.70, y = 0.70 }
      , { x = 0.70, y = 0.80 }
      , { x = 0.30, y = 0.80 } ] 
  in 
    Polygon { points = pts }

fLetter : List Shape
fLetter = [ fShape ]

hShape : Shape
hShape = 
  let 
    pt01 =  { x = 0.30, y = 0.20 } 
    pt02 =  { x = 0.40, y = 0.20 } 
    pt03 =  { x = 0.40, y = 0.45 } 
    pt04 =  { x = 0.60, y = 0.45 } 
    pt05 =  { x = 0.60, y = 0.20 } 
    pt06 =  { x = 0.70, y = 0.20 } 
    pt07 =  { x = 0.70, y = 0.80 } 
    pt08 =  { x = 0.60, y = 0.80 } 
    pt09 =  { x = 0.60, y = 0.55 } 
    pt10 =  { x = 0.40, y = 0.55 } 
    pt11 =  { x = 0.40, y = 0.80 } 
    pt12 =  { x = 0.30, y = 0.80 } 
    pts = [ pt01, pt02, pt03, pt04, pt05, pt06, pt07, pt08, pt09, pt10, pt11, pt12 ]
  in 
    Polygon { points = pts }

hLetter : List Shape
hLetter = [ hShape ]

eShape : Shape
eShape = 
  let 
    pt01 =  { x = 0.30, y = 0.20 } 
    pt02 =  { x = 0.70, y = 0.20 } 
    pt03 =  { x = 0.70, y = 0.30 } 
    pt04 =  { x = 0.40, y = 0.30 } 
    pt05 =  { x = 0.40, y = 0.45 } 
    pt06 =  { x = 0.60, y = 0.45 } 
    pt07 =  { x = 0.60, y = 0.55 } 
    pt08 =  { x = 0.40, y = 0.55 } 
    pt09 =  { x = 0.40, y = 0.70 } 
    pt10 =  { x = 0.70, y = 0.70 } 
    pt11 =  { x = 0.70, y = 0.80 } 
    pt12 =  { x = 0.30, y = 0.80 } 
    pts = [ pt01, pt02, pt03, pt04, pt05, pt06, pt07, pt08, pt09, pt10, pt11, pt12 ]
  in 
    Polygon { points = pts }

eLetter : List Shape
eLetter = [ eShape ]

nShape : Shape 
nShape = 
  let 
    pt01 =  { x = 0.30, y = 0.20 } 
    pt02 =  { x = 0.40, y = 0.20 } 
    pt03 =  { x = 0.40, y = 0.60 } 
    pt04 =  { x = 0.60, y = 0.20 } 
    pt05 =  { x = 0.70, y = 0.20 } 
    pt06 =  { x = 0.70, y = 0.80 } 
    pt07 =  { x = 0.60, y = 0.80 } 
    pt08 =  { x = 0.60, y = 0.40 } 
    pt09 =  { x = 0.40, y = 0.80 } 
    pt10 =  { x = 0.30, y = 0.80 } 
    pts = [ pt01, pt02, pt03, pt04, pt05, pt06, pt07, pt08, pt09, pt10 ]
  in
    Polygon { points = pts }

nLetter : List Shape
nLetter = [ nShape ]

dShape1 : Shape
dShape1 = 
  let 
    pt01 =  { x = 0.30, y = 0.20 } 
    pt02 =  { x = 0.55, y = 0.20 } 
    pt03 =  { x = 0.70, y = 0.35 } 
    pt04 =  { x = 0.70, y = 0.65 } 
    pt05 =  { x = 0.55, y = 0.80 } 
    pt06 =  { x = 0.30, y = 0.80 } 
    pts = [ pt01, pt02, pt03, pt04, pt05, pt06 ]
  in
    Polygon { points = pts }

dShape2 : Shape 
dShape2 = 
  let 
    pt01 =  { x = 0.40, y = 0.30 } 
    pt02 =  { x = 0.52, y = 0.30 } 
    pt03 =  { x = 0.60, y = 0.38 } 
    pt04 =  { x = 0.60, y = 0.62 } 
    pt05 =  { x = 0.52, y = 0.70 } 
    pt06 =  { x = 0.40, y = 0.70 } 
    pts = [ pt01, pt02, pt03, pt04, pt05, pt06 ]
  in
    Polygon { points = pts }

dLetter : List Shape 
dLetter = [ dShape1, dShape2 ]

rShape1 : Shape 
rShape1 = 
  let 
    pt01 =  { x = 0.30, y = 0.20 } 
    pt02 =  { x = 0.40, y = 0.20 } 
    pt03 =  { x = 0.40, y = 0.45 } 
    pt03a = { x = 0.45, y = 0.45 } 
    pt04 =  { x = 0.60, y = 0.20 } 
    pt05 =  { x = 0.70, y = 0.20 } 
    pt06 =  { x = 0.55, y = 0.45 } 
    pt07 =  { x = 0.70, y = 0.45 } 
    pt08 =  { x = 0.70, y = 0.80 } 
    pt09 =  { x = 0.30, y = 0.80 } 
    pts = [ pt01, pt02, pt03, pt03a, pt04, pt05, pt06, pt07, pt08, pt09 ]
  in
    Polygon { points = pts }

rShape2 : Shape 
rShape2 = 
  let 
    pt05 =  { x = 0.40, y = 0.55 } 
    pt06 =  { x = 0.60, y = 0.55 } 
    pt07 =  { x = 0.60, y = 0.70 } 
    pt08 =  { x = 0.40, y = 0.70 } 
    pts = [ pt05, pt06, pt07, pt08 ]
  in
    Polygon { points = pts }

rLetter : List Shape 
rLetter = [ rShape1, rShape2 ]

sShape : Shape 
sShape = 
  let 
    pt01 =  { x = 0.30, y = 0.20 } 
    pt02 =  { x = 0.70, y = 0.20 } 
    pt03 =  { x = 0.70, y = 0.55 } 
    pt04 =  { x = 0.40, y = 0.55 } 
    pt05 =  { x = 0.40, y = 0.70 } 
    pt06 =  { x = 0.70, y = 0.70 } 
    pt07 =  { x = 0.70, y = 0.80 } 
    pt08 =  { x = 0.30, y = 0.80 } 
    pt09 =  { x = 0.30, y = 0.45 } 
    pt10 =  { x = 0.60, y = 0.45 } 
    pt11 =  { x = 0.60, y = 0.30 } 
    pt12 =  { x = 0.30, y = 0.30 } 
    pts = [ pt01, pt02, pt03, pt04, pt05, pt06, pt07, pt08, pt09, pt10, pt11, pt12 ]
  in
    Polygon { points = pts }

sLetter : List Shape 
sLetter = [ sShape ]

oShape1 : Shape 
oShape1 = 
  let 
    pt01 =  { x = 0.30, y = 0.20 } 
    pt02 =  { x = 0.70, y = 0.20 } 
    pt03 =  { x = 0.70, y = 0.80 } 
    pt04 =  { x = 0.30, y = 0.80 } 
    pts = [ pt01, pt02, pt03, pt04 ]
  in
    Polygon { points = pts }

oShape2 : Shape 
oShape2 = 
  let 
    pt05 =  { x = 0.40, y = 0.30 } 
    pt06 =  { x = 0.60, y = 0.30 } 
    pt07 =  { x = 0.60, y = 0.70 } 
    pt08 =  { x = 0.40, y = 0.70 } 
    pts = [ pt05, pt06, pt07, pt08 ]
  in
    Polygon { points = pts }

oLetter : List Shape
oLetter = [ oShape1, oShape2 ]

