module Views exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Types exposing (..)


view : Model -> Html Msg
view model =
    div [ style [ ( "text-align", "center" ) ] ]
        [ p [] [ textarea [ onInput SetText, autofocus True ] [ text "" ] ]
        , toggles model
        , viewFormatted model
        , button [ onClick CopyToClipboard ] [ text "Copy to clipboard" ]
        ]


toggles : Model -> Html Msg
toggles model =
    let
        txt name enabled =
            if enabled then
                name ++ " ✓"
            else
                name
    in
    p []
        (List.map
            (\formatter ->
                button [ onClick (Toggle formatter.id) ] [ text (txt formatter.name formatter.enabled) ]
            )
            model.formatters
        )


viewFormatted : Model -> Html Msg
viewFormatted model =
    let
        transform formatter string =
            if formatter.enabled then
                formatter.formatFunction string
            else
                string

        formatted =
            List.foldr transform model.input model.formatters

        isWithinCharacterLimit =
            String.length formatted <= 280

        styling =
            if isWithinCharacterLimit then
                style []
            else
                style [ ( "background-color", "red" ) ]
    in
    p [ id "formatted", styling ] [ text formatted ]
