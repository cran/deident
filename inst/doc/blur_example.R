## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(deident)
head(ShiftsWorked)

## -----------------------------------------------------------------------------
shift_blur <- c("Day" = "Working", "Night" = "Working")
blur_pipe <- ShiftsWorked |>
  add_blur(Shift, blur=shift_blur)

apply_deident(ShiftsWorked, blur_pipe)

## -----------------------------------------------------------------------------
starwars <- dplyr::starwars
head(starwars)

## -----------------------------------------------------------------------------
table(starwars$species)

## -----------------------------------------------------------------------------
human_blur <- category_blur(
  starwars$species,
  "NotHuman" = "^(?!Human)" # Doesn't start with "Human"
)

## -----------------------------------------------------------------------------
species_pipe <- starwars |>
  add_blur(species, blur=human_blur)
  
new_starwars <- apply_deident(starwars, species_pipe)

table(new_starwars$species)

