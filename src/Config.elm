module Config exposing (..)

import Html exposing (Html, button, div, h1, main_, text, a)
import Html.Events exposing (onClick)
import Html.Attributes exposing (style)
import Html.Attributes exposing (class)
import Html exposing (input)



-- MODEL


type alias Model =
    {}


init : () -> Model
init flags =
    {}



-- UPDATE


type Msg
    = None



-- VIEW


view : Model -> Html Msg
view model =
    div [style "width" "content"]
        [ div [class "tabs"] [a [] [ text "Config"]]
        , div
            [ style "display" "flex"
            , style "flex-direction" "column"
            , style "gap" "10px"
            ]
            [ text "Config 0", input [] []
            , text "Config 1", input [] []
            ]
        ]
