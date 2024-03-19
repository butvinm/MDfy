module Main exposing (..)

import Browser
import Debug exposing (toString)
import Dict exposing (Dict)
import Editor
import Html exposing (Html, a, div, main_, text)
import Html.Attributes exposing (attribute, class, style)
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
    { activePanel : Panel
    , preview : Preview.Model
    , editor : Editor.Model
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { activePanel = Editor
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
        _ =
            Debug.log (Debug.toString msg)
    in
    case msg of
        ChangePanel panel ->
            ( { model | activePanel = panel }, Cmd.none )

        _ ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view { activePanel, preview, editor } =
    { title = "MDfy"
    , body =
        [ main_
            [ style "display" "flex"
            , style "flex-direction" "column"
            , style "height" "100vh"
            ]
            [ div [ class "tabs" ]
                [ a
                    (List.concat
                        [ if activePanel == Editor then [ class "active" ] else []
                        , [ onClick (ChangePanel Editor) ]
                        ]
                    )
                    [ text "Editor" ]
                , a
                    (List.concat
                        [ if activePanel == Preview then [ class "active" ] else []
                        , [ onClick (ChangePanel Preview) ]
                        ]
                    )
                    [ text "Preview" ]
                ]
            , div [ style "flex-grow" "1" ]
                [ div
                    (List.concat
                        [ if activePanel /= Editor then [ style "display" "none" ] else [] ]
                    )
                    [ Html.map EditorMsg (Editor.view editor) ]
                , div
                    (List.concat
                        [ if activePanel /= Preview then [ style "display" "none" ] else [] ]
                    )
                    [ Html.map PreviewMsg (Preview.view preview) ]
                ]
            ]
        ]
    }
