module Figure exposing (..)

import Shape exposing (..)

george : List Shape
george = 
  let 
    pts1 = 
      [ { x = 0.00, y = 0.55 } 
      , { x = 0.15, y = 0.45 }
      , { x = 0.30, y = 0.55 }
      , { x = 0.40, y = 0.50 }
      , { x = 0.20, y = 0.00 } ]
    pts2 = 
      [ { x = 0.00, y = 0.80 }
      , { x = 0.15, y = 0.60 }
      , { x = 0.30, y = 0.65 }
      , { x = 0.40, y = 0.65 }
      , { x = 0.35, y = 0.80 }
      , { x = 0.40, y = 1.00 } ]
    pts3 = 
      [ { x = 0.60, y = 1.00 }
      , { x = 0.65, y = 0.80 }
      , { x = 0.60, y = 0.65 }
      , { x = 0.80, y = 0.65 }
      , { x = 1.00, y = 0.45 } ]
    pts4 = 
      [ { x = 1.00, y = 0.20 }
      , { x = 0.60, y = 0.50 }
      , { x = 0.80, y = 0.00 } ]
    pts5 = 
      [ { x = 0.40, y = 0.00 }
      , { x = 0.50, y = 0.30 }
      , { x = 0.60, y = 0.00 } ]
  in 
  [ Polyline { pts = pts1 }
  , Polyline { pts = pts2 }
  , Polyline { pts = pts3 }
  , Polyline { pts = pts4 }
  , Polyline { pts = pts5 } ]
