module Editor exposing (..)

import Css exposing (block, display, height, pct)
import Html.Styled exposing (Html, node, text)
import Html.Styled.Attributes exposing (attribute, class, css, id)



-- MODEL


type alias Model =
    { content : String }


init : String -> Model
init content =
    { content = content }



-- UPDATE


type Msg
    = None
    | TextChanged



-- VIEW


view : Model -> Html Msg
view { content } =
    node "mdfy-editor"
        [ id "editor"
        , class "language-markdown"
        , attribute "data-gramm" "false"
        , css [ display block, height (pct 100) ]
        ]
        [ text content ]
