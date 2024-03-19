module Editor exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (attribute, class, id, style)



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
    div
        [ id "editor"
        , class "language-markdown"
        , attribute "data-gramm" "false"
        , style "height" "100%"
        ]
        [ text """
# mdfy

```elm
mdfy : Markdown -> anything
```

**mdfy** is Markdown converter to various file formats.

Key features:
- Converting customization for each possible Markdown entity
- Local links support (ability to upload necessary files)
- It is written in [Elm](https://elm-lang.org/)

## Demo

You can check [Live Demo](https://mdfy-1-w0253200.deta.app/) for the latest code version.
        """ ]
