module Main exposing (Msg(..), main, update, view)

import Browser
import Html exposing (..)
import Html.Events exposing (..)
import Svg exposing (..)
import Svg.Attributes exposing (..)


main =
    Browser.sandbox { init = 0, update = update, view = view }


type Msg
    = Increment
    | Decrement


update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1


view model =
    div []
        [ div []
            [ button [ onClick Increment ] [ Html.text "+" ]
            , p [] [ Html.text (String.fromInt model) ]
            , button [ onClick Decrement ] [ Html.text "-" ]
            ]
        , svg
            [ width "100%", height "100vh", viewBox "0 0 120 120" ]
            [ rect [ x "10", y "10", width "10", height (String.fromInt model), rx "0", ry "0" ] []
            , line [ x1 "10", y1 "10", x2 "30", y2 "10", strokeWidth "1", stroke "black" ] []
            ]
        ]
