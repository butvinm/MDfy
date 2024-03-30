module Config exposing (..)

import Css exposing (column, displayFlex, flexDirection, px)
import CssUtils exposing (gap)
import Html.Styled exposing (Html, a, div, input, text)
import Html.Styled.Attributes exposing (class, css)



-- MODEL


type alias Model =
    {}


init : () -> Model
init _ =
    {}



-- UPDATE


type Msg
    = None



-- VIEW


view : Model -> Html Msg
view _ =
    -- css [ width content]
    div []
        [ div [ class "tabs" ] [ a [] [ text "Config" ] ]
        , div
            [ css
                [ displayFlex
                , flexDirection column
                , gap (px 10)
                ]
            ]
            [ text "Config 0"
            , input [] []
            , text "Config 1"
            , input [] []
            ]
        ]
