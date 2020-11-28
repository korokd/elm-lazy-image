module Main exposing (main)

import Browser
import Html exposing (Html, img, node)
import Html.Attributes exposing (alt, attribute, src)


main =
    node "lazy-image"
        [ src "./high-res.png"
        , alt "Cool Background: Blue Particles on Red"
        ]
        [ img
            [ attribute "slot" "placeholder"
            , src "./low-res.png"
            , alt "Placeholder"
            ]
            []
        ]
