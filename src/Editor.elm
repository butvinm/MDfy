module Editor exposing (..)

import Html exposing (Html, textarea)



-- MODEL


type alias Model =
    {}


init : () -> Model
init flags =
    {}



-- UPDATE


type Msg
    = None
    | TextChanged



-- VIEW


view : Model -> Html Msg
view model =
    textarea [] []
