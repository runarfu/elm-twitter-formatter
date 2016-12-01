module State exposing (..)

import Types exposing (..)


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetText s ->
            { model | input = s }

        Toggle id ->
            { model | formatters = toggleId model.formatters id }


toggleId : List TwitterFormatter -> Int -> List TwitterFormatter
toggleId formatters id =
    List.map
        (\formatter ->
            if formatter.id == id then
                { formatter | enabled = not formatter.enabled }
            else
                formatter
        )
        formatters
