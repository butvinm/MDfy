module Main exposing (..)

import Browser
import Editor
import Html exposing (a, div, main_, text)
import Html.Attributes exposing (attribute, class)
import Html.Events exposing (onClick)
import Preview



-- MAIN


main =
    Browser.document
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL


type Panel
    = Editor
    | Preview


type alias Model =
    { panel : Panel
    , preview : Preview.Model
    , editor : Editor.Model
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { panel = Editor
      , preview = Preview.init flags
      , editor = Editor.init flags
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = ChangePanel Panel
    | PreviewMsg Preview.Msg
    | EditorMsg Editor.Msg
    | None


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        _ = Debug.log (Debug.toString msg)
    in
    case msg of
        ChangePanel panel ->
            ( { model | panel = panel }, Cmd.none )

        _ ->
            ( model, Cmd.none )


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view { panel, preview, editor } =
    { title = "MDfy"
    , body =
        [ main_ []
            [ div [ attribute "class" "tabs" ]
                [ a
                    [ class (if panel == Editor then "active" else "")
                    , onClick (ChangePanel Editor)
                    ]
                    [ text "Editor" ]
                , a
                    [ class (if panel == Preview then "active" else "")
                    , onClick (ChangePanel Preview)
                    ]
                    [ text "Preview" ]
                ]
            , div []
                [ case panel of
                    Editor ->
                        Html.map EditorMsg (Editor.view editor)

                    Preview ->
                        Html.map PreviewMsg (Preview.view preview)
                ]
            ]
        ]
    }
