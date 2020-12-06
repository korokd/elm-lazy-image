module LazyImage exposing (view)

import Html exposing (Attribute, Html, img, node)
import Html.Attributes exposing (alt, attribute, src)


type alias RequiredAttributes =
    { alt_ : String
    , src_ : String
    }


type alias ImgAttributes msg =
    { required : RequiredAttributes
    , other : List (Attribute msg)
    }


type alias Element msg =
    List (Attribute msg) -> List (Html msg) -> Html msg


type alias PlaceholderAttributes msg =
    { element : Element msg
    , attributes : List (Attribute msg)
    , children : List (Html msg)
    }


makePlaceholder : PlaceholderAttributes msg -> Html msg
makePlaceholder { element, attributes, children } =
    let
        attributes_ =
            attributes
                |> (::) (attribute "slot" "placeholder")
    in
    element attributes_ children


view : ImgAttributes msg -> PlaceholderAttributes msg -> Html msg
view { required, other } placeholderAttributes =
    let
        { src_, alt_ } =
            required

        attributes =
            [ src src_
            , alt alt_
            ]
                |> List.append other
    in
    node "lazy-image" (Debug.log "attributes" attributes) [ makePlaceholder placeholderAttributes ]
