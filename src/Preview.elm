module Preview exposing (..)

import Html exposing (Html, button, div, h1, main_, text)
import Html.Events exposing (onClick)



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
    text "Preview"
