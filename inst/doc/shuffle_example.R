## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(deident)

## -----------------------------------------------------------------------------
head(starwars)

## -----------------------------------------------------------------------------
starwars |> 
  dplyr::filter(species == "Mon Calamari")

## -----------------------------------------------------------------------------
starwars |> 
  dplyr::filter(species == "Human", 
                homeworld == "Coruscant",
                hair_color == "blond"
                )

## -----------------------------------------------------------------------------
set.seed(101)

shuffle_pipe <- starwars |> 
  add_shuffle(species, homeworld, hair_color)

new_starwars <- apply_deident(starwars, shuffle_pipe)

head(new_starwars)

## -----------------------------------------------------------------------------
new_starwars |> 
  dplyr::filter(species == "Human", 
                homeworld == "Coruscant"
                )

## -----------------------------------------------------------------------------
grouped_shuffle_pipe <- starwars |> 
  add_group(gender) |> 
  add_shuffle(species, homeworld, hair_color) |>
  add_ungroup()

apply_deident(starwars, grouped_shuffle_pipe)

