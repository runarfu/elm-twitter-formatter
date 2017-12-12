port module State exposing (..)

import Types exposing (..)


port copyToClipboard : String -> Cmd msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetText s ->
            { model | input = s } ! []

        Toggle id ->
            { model | formatters = toggleId model.formatters id } ! []

        CopyToClipboard ->
            ( model, copyToClipboard "" )


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
