module Views exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import String
import Char
import Types exposing (..)


tweetMaxLength =
    140


view : Model -> Html Msg
view model =
    div [ style [ ( "text-align", "center" ) ] ]
        [ h1 [] [ text "Twitter Formatter" ]
        , p [] [ textarea [ onInput SetText ] [ text model ] ]
        , viewFormatted model
        ]


viewFormatted : Model -> Html Msg
viewFormatted model =
    div []
        (List.map (\f -> p [] [ addColorToLongStrings (f model) ]) functions)


functions : List (String -> String)
functions =
    [ String.reverse
    , String.map Char.toUpper
    , String.words >> List.intersperse "👏" >> String.join " "
    , capitalizeFirstLetterInWords
    ]


capitalizeFirstLetterInWords : String -> String
capitalizeFirstLetterInWords =
    String.words
        >> List.map
            (\w ->
                case String.uncons w of
                    Just ( c, s ) ->
                        String.cons (Char.toUpper c) s

                    Nothing ->
                        w
            )
        >> String.join " "


addColorToLongStrings : String -> Html Msg
addColorToLongStrings s =
    if String.length s > tweetMaxLength then
        let
            okPart =
                String.dropRight tweetMaxLength s

            notOkPart =
                String.dropLeft tweetMaxLength s
        in
            p []
                [ text okPart
                , span [ style [ ( "background-color", "red" ) ] ] [ text notOkPart ]
                ]
    else
        p [] [ text s ]
