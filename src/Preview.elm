module Preview exposing (..)

import Html.Styled exposing (Html, text)



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
    text "Preview"
