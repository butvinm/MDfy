module Preview exposing (..)

import Html.Styled exposing (Html, fromUnstyled, text)
import Markdown.Parser
import Markdown.Renderer



-- MODEL


type alias Model =
    { input : String }


init : String -> Model
init input =
    { input = input }



-- UPDATE


type Msg
    = None



-- VIEW


markdownView : String -> Result String (List (Html Msg))
markdownView markdown =
    Result.map (List.map fromUnstyled)
        (markdown
            |> Markdown.Parser.parse
            |> Result.mapError (\error -> error |> List.map Markdown.Parser.deadEndToString |> String.join "\n")
            |> Result.andThen (Markdown.Renderer.render Markdown.Renderer.defaultHtmlRenderer)
        )


view : Model -> Html Msg
view { input } =
    case markdownView input of
        _ ->
            text "Hello"
