port module Main exposing (..)

import Html
import State exposing (..)
import TwitterFormats
import Types exposing (..)
import Views exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = ( initModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


initModel : Model
initModel =
    { input = "", formatters = TwitterFormats.allFormatters }
