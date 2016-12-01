module Main exposing (..)

import Html
import Views exposing (..)
import State exposing (..)
import Types exposing (..)


main : Program Never String Msg
main =
    Html.beginnerProgram
        { model = ""
        , view = view
        , update = update
        }
