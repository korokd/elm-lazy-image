module Main exposing (main)

import Browser
import Html exposing (img)
import Html.Attributes exposing (alt, src)
import LazyImage


main =
    LazyImage.view
        { required = { src_ = "./high-res.png", alt_ = "Cool Background: Blue Particles on Red" }
        , other = []
        }
        { element = img
        , attributes = [ src "./low-res.png", alt "Cool Background: Blue Particles on Red (Low Res)" ]
        , children = []
        }
