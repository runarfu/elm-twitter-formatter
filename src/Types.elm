module Types exposing (..)


type alias Model =
    { input : String
    , formatters : List TwitterFormatter
    }


type alias TwitterFormatter =
    { id : Int
    , name : String
    , enabled : Bool
    , formatFunction : String -> String
    }


type Msg
    = SetText String
    | Toggle Int
    | CopyToClipboard
