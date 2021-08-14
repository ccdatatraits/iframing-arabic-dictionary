module Main exposing (main)

import Browser
import Html exposing (Html, button, div, iframe, input, text)
import Html.Attributes as Attributes
import Html.Events exposing (onClick, onInput)



---- MODEL ----


type alias Model =
    { input : String
    , query : String
    }


initValues =
    { main = "fEl" }


init : ( Model, Cmd Msg )
init =
    ( { input = initValues.main
      , query = initValues.main
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = ChangeInput String
    | Submit


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeInput text ->
            ( { model | input = text }, Cmd.none )

        Submit ->
            ( { model | query = model.input }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ input [ Attributes.value model.input, onInput ChangeInput ] []
        , button [ onClick Submit ] [ text "SUBMIT" ]
        , iframe [ Attributes.src ("http://ejtaal.net/aa#q=" ++ model.query), Attributes.id "custom-iframe" ] []
        ]



---- PROGRAM ----


main : Program () Model Msg
main =
    Browser.element
        { view = view
        , init = \_ -> init
        , update = update
        , subscriptions = always Sub.none
        }
