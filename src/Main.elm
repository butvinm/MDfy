module Main exposing (..)

import Browser
import Html exposing (button, div, h1, main_, text)
import Html.Events exposing (onClick)



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
    { panel : Panel }


init : () -> ( Model, Cmd Msg )
init flags =
    ( Model Editor, Cmd.none )



-- UPDATE


type Msg
    = ChangePanel Panel
    | None


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
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
view { panel } =
    { title = "MDfy"
    , body =
        [ main_ []
            [ div []
                [ button [ onClick (ChangePanel Editor) ] [ text "Editor" ]
                , button [ onClick (ChangePanel Preview) ] [ text "Preview" ]
                ]
            , div []
                [ case panel of
                    Editor ->
                        h1 [] [ text "Editor" ]

                    Preview ->
                        h1 [] [ text "Preview" ]
                ]
            ]
        ]
    }
