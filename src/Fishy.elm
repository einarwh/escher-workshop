module Fishy exposing (fishShapes)

import Vector exposing (Vector)
import Shape exposing (Shape, CurveShape)

createVector : Float -> Float -> Vector 
createVector x y = { x = x, y = y }

createCurve : Vector -> Vector -> Vector -> Vector -> CurveShape
createCurve v1 v2 v3 v4 = 
  { point1 = v1
  , point2 = v2
  , point3 = v3
  , point4 = v4 }

hendersonFishCurves : List CurveShape
hendersonFishCurves = [
    createCurve (createVector 0.116 0.702) -- C1
                (createVector 0.260 0.295) --
                (createVector 0.330 0.258) --
                (createVector 0.815 0.078) --  
  , createCurve (createVector 0.564 0.032) -- C2
                (createVector 0.730 0.056) --
                (createVector 0.834 0.042) --
                (createVector 1.000 0.000) --
  , createCurve (createVector 0.250 0.250) -- C3
                (createVector 0.372 0.194) --
                (createVector 0.452 0.132) --
                (createVector 0.564 0.032) --         
  , createCurve (createVector 0.000 0.000) -- C4
                (createVector 0.110 0.110) --
                (createVector 0.175 0.175) --
                (createVector 0.250 0.250) --         
  , createCurve (createVector -0.250 0.250) -- C5
                (createVector -0.150 0.150) --
                (createVector -0.090 0.090) --
                (createVector 0.000 0.000) --           
  , createCurve (createVector -0.250 0.250) -- C6
                (createVector -0.194 0.372) --
                (createVector -0.132 0.452) --
                (createVector -0.032 0.564) --  
  , createCurve (createVector -0.032 0.564) -- C7
                (createVector 0.055 0.355) --
                (createVector 0.080 0.330) --
                (createVector 0.250 0.250) --         
  , createCurve (createVector -0.032 0.564) -- C8
                (createVector -0.056 0.730) --
                (createVector -0.042 0.834) --
                (createVector 0.000 1.000) --
  , createCurve (createVector 0.000 1.000) -- C9
                (createVector 0.104 0.938) --
                (createVector 0.163 0.893) --
                (createVector 0.234 0.798) --
  , createCurve (createVector 0.234 0.798) -- C10
                (createVector 0.368 0.650)
                (createVector 0.232 0.540)
                (createVector 0.377 0.377)    
  , createCurve (createVector 0.377 0.377) -- C11
                (createVector 0.400 0.350)
                (createVector 0.450 0.300)
                (createVector 0.500 0.250)    
  , createCurve (createVector 0.500 0.250) -- C12 
                (createVector 0.589 0.217)
                (createVector 0.660 0.208)
                (createVector 0.766 0.202)    
  , createCurve (createVector 0.766 0.202) -- C13
                (createVector 0.837 0.107) --
                (createVector 0.896 0.062) --
                (createVector 1.000 0.000) --    
  , createCurve (createVector 0.234 0.798) -- C14
                (createVector 0.340 0.792) --
                (createVector 0.411 0.783) --
                (createVector 0.500 0.750) --  
  , createCurve (createVector 0.500 0.750) -- C15 
                (createVector 0.500 0.625) --
                (createVector 0.500 0.575) --
                (createVector 0.500 0.500) -- 
  , createCurve (createVector 0.500 0.500) -- C16 -
                (createVector 0.460 0.460) --
                (createVector 0.410 0.410) --
                (createVector 0.377 0.377) --   
  , createCurve (createVector 0.315 0.710) -- C17 -
                (createVector 0.378 0.732) --
                (createVector 0.426 0.726) --
                (createVector 0.487 0.692) --    
  , createCurve (createVector 0.340 0.605) -- C18 -
                (createVector 0.400 0.642) --
                (createVector 0.435 0.647) --
                (createVector 0.489 0.626) --    
  , createCurve (createVector 0.348 0.502) -- C19 -
                (createVector 0.400 0.564) --
                (createVector 0.422 0.568) --
                (createVector 0.489 0.563) --   
  , createCurve (createVector 0.451 0.418) -- C20 -
                (createVector 0.465 0.400) --
                (createVector 0.480 0.385) --
                (createVector 0.490 0.381) --    
  , createCurve (createVector 0.421 0.388) -- C21 - 
                (createVector 0.440 0.350) --
                (createVector 0.455 0.335) --
                (createVector 0.492 0.325) --    
  , createCurve (createVector -0.170 0.237) -- C22 -
                (createVector -0.125 0.355) --
                (createVector -0.065 0.405) --
                (createVector 0.002 0.436) --   
  , createCurve (createVector -0.121 0.188) -- C23 -
                (createVector -0.060 0.300) --
                (createVector -0.030 0.330) -- 
                (createVector 0.040 0.375) --    
  , createCurve (createVector -0.058 0.125) -- C24 -
                (createVector -0.010 0.240) --
                (createVector 0.030 0.280) --
                (createVector 0.100 0.321) -- 
  , createCurve (createVector -0.022 0.063) -- C25 - 
                (createVector 0.060 0.200) --
                (createVector 0.100 0.240) -- 
                (createVector 0.160 0.282) --    
  , createCurve (createVector 0.053 0.658) -- C26 -
                (createVector 0.075 0.677) --
                (createVector 0.085 0.687) --
                (createVector 0.098 0.700) -- 
  , createCurve (createVector 0.053 0.658) -- C27 
                (createVector 0.042 0.710) --
                (createVector 0.042 0.760) --
                (createVector 0.053 0.819) --   
  , createCurve (createVector 0.053 0.819) -- C28 -
                (createVector 0.085 0.812) --
                (createVector 0.092 0.752) --
                (createVector 0.098 0.700) --   
  , createCurve (createVector 0.130 0.718) -- C29 -
                (createVector 0.150 0.730) --
                (createVector 0.175 0.745) --
                (createVector 0.187 0.752) -- 
  , createCurve (createVector 0.130 0.718) -- C30 -
                (createVector 0.110 0.795) --
                (createVector 0.110 0.810) --
                (createVector 0.112 0.845) -- 
  , createCurve (createVector 0.112 0.845) -- C31 -
                (createVector 0.150 0.805) --
                (createVector 0.172 0.780) -- 
                (createVector 0.187 0.752) ]

fishShapes : List Shape
fishShapes = hendersonFishCurves |> List.map Shape.Curve