module ViewUtils exposing (..)

import Html.Styled exposing (Attribute)
import Html.Styled.Attributes exposing (class)


attrsList : List (List (Attribute msg)) -> List (Attribute msg)
attrsList attrs =
    List.concat attrs


attrIf : Bool -> Attribute msg -> Attribute msg
attrIf condition attribute =
    if condition then
        attribute

    else
        class ""
