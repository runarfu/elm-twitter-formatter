module Views exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import String
import Char
import Types exposing (..)


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Twitter Formatter" ]
        , p [] [ textarea [ onInput SetText ] [ text model ] ]
        , viewFormatted model
        ]


viewFormatted : Model -> Html Msg
viewFormatted model =
    div []
        (List.map (\f -> p [] [ textarea [] [ text (f model) ] ]) functions)


functions : List (String -> String)
functions =
    [ String.reverse
    , String.map Char.toUpper
    , String.words >> List.intersperse "👏" >> String.join " "
    ]
