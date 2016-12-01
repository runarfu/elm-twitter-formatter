module TwitterFormats exposing (..)

import String
import Char
import Types exposing (..)


allFormatters : List TwitterFormatter
allFormatters =
    List.indexedMap
        (\index ( name, function ) ->
            TwitterFormatter index name False function
        )
        [ ( "BLOKKBOKSTAVER", String.map Char.toUpper )
        , ( "👏 mellom ordene"
          , String.words
                >> List.intersperse "👏"
                >> String.join " "
          )
        , ( "Stor Forbokstav I Alle Ord", uppercaseFirstLetterInEveryWord )
        , ( "M e l l o m r o m", String.toList >> List.intersperse ' ' >> String.fromList )
        ]


uppercaseFirstLetterInEveryWord : String -> String
uppercaseFirstLetterInEveryWord string =
    string
        |> String.split " "
        |> List.map uppercaseFirstLetter
        |> String.join " "


uppercaseFirstLetter : String -> String
uppercaseFirstLetter word =
    case String.toList word of
        first :: rest ->
            (Char.toUpper first)
                :: rest
                |> String.fromList

        _ ->
            word
