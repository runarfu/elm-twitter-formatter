module Main exposing (..)

import Html
import Types exposing (..)
import Views exposing (..)
import State exposing (..)
import TwitterFormats


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }


initModel : Model
initModel =
    { input = "", formatters = TwitterFormats.allFormatters }
