module State exposing (..)

import Types exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetText s ->
            s
