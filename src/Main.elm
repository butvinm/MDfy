module Main exposing (..)

import Browser
import Config
import Css exposing (column, display, displayFlex, flexDirection, flexGrow, height, none, num, vh)
import Editor
import Html.Styled exposing (Html, a, div, main_, map, text, toUnstyled)
import Html.Styled.Attributes exposing (class, css)
import Html.Styled.Events exposing (onClick)
import Preview



-- MAIN


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view = (view >> toUnstyled >> List.singleton) >> Browser.Document "mdfy"
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
    , config : Config.Model
    }


init : () -> ( Model, Cmd Msg )
init flags =
    ( { activePanel = Editor
      , preview = Preview.init flags
      , editor = Editor.init flags
      , config = Config.init flags
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = ChangePanel Panel
    | PreviewMsg Preview.Msg
    | EditorMsg Editor.Msg
    | ConfigMsg Config.Msg
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
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html Msg
view { activePanel, preview, editor, config } =
    main_ [ css [ displayFlex ] ]
        [ div
            [ css
                [ displayFlex
                , flexDirection column
                , height (vh 100)
                , flexGrow (num 1)
                ]
            ]
            [ div [ class "tabs" ]
                [ a
                    (List.concat
                        [ if activePanel == Editor then
                            [ class "active" ]

                          else
                            []
                        , [ onClick (ChangePanel Editor) ]
                        ]
                    )
                    [ text "Editor" ]
                , a
                    (List.concat
                        [ if activePanel == Preview then
                            [ class "active" ]

                          else
                            []
                        , [ onClick (ChangePanel Preview) ]
                        ]
                    )
                    [ text "Preview" ]
                ]
            , div [ css [ flexGrow (num 1) ] ]
                [ div
                    (List.concat
                        [ if activePanel /= Editor then
                            [ css [ display none ] ]

                          else
                            []
                        ]
                    )
                    [ map EditorMsg (Editor.view editor) ]
                , div
                    (List.concat
                        [ if activePanel /= Preview then
                            [ css [ display none ] ]

                          else
                            []
                        ]
                    )
                    [ map PreviewMsg (Preview.view preview) ]
                ]
            ]
        , map ConfigMsg (Config.view config)
        ]
