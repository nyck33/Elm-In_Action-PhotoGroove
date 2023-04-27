module PhotoGroove exposing (main)

import Html exposing (div, h1, img, text)
import Html.Attributes exposing (..)

urlPrefix = "http://elm-in-action.com/"

--view func takes current model (app state) as argument, then returns html 
view model = 
    div [ class "content"]
        [h1 [] [ text "Photo Groove"]
        , div [id "thumbnails"] 
            (List.map 
                (\photo -> viewThumbnail model.selectedUrl photo) model.photos
            )
        , img
            [ class "large"
            , src (urlPrefix ++ "large/" ++ model.selectedUrl)] 
            []
        ]

viewThumbnail selectedUrl thumb =
    if selectedUrl == thumb.url then
        img
            [ src (urlPrefix ++ thumb.url)
            , classList [("selected", selectedUrl == thumb.url)]
            ]
            []
    else
        img
            [ src (urlPrefix ++ thumb.url)]
            []



        
initialModel = 
    { photos = 
        [ { url = "1.jpeg"}
        , { url = "2.jpeg"}
        , { url = "3.jpeg"}
        ]
    , selectedUrl = "1.jpeg"
    }

main = 
    view initialModel