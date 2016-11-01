module Main exposing (..)

import Html.App as App
import Views exposing (..)
import State exposing (..)
import Types exposing (..)


main : Program Never
main =
    App.beginnerProgram
        { model = ""
        , view = view
        , update = update
        }
