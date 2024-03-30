module CssUtils exposing (..)

import Css exposing (LengthOrNumberOrAutoOrNoneOrContent, Style, property)


gap : LengthOrNumberOrAutoOrNoneOrContent compatible -> Style
gap x =
    property "gap" x.value


gap2 : LengthOrNumberOrAutoOrNoneOrContent compatible -> LengthOrNumberOrAutoOrNoneOrContent compatible -> Style
gap2 x y =
    property "gap" (x.value ++ " " ++ y.value)
