module Views exposing (view)

import Html exposing (..)
import Html.Events exposing (..)
import Html.Attributes exposing (..)
import String
import Char
import Types exposing (..)
import TwitterFormats exposing (..)


tweetMaxLength =
    140


view : Model -> Html Msg
view model =
    div [ style [ ( "text-align", "center" ) ] ]
        [ p [] [ textarea [ onInput SetText, autofocus True ] [ text "" ] ]
        , toggles model
        , viewFormatted model
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
        div []
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
    in
        div [] [ text formatted ]
