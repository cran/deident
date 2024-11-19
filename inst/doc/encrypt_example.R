## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(deident)

## -----------------------------------------------------------------------------
name_pipe <- starwars |> 
  add_encrypt(name, hash_key = "hash123", seed="seed456")

apply_deident(starwars, name_pipe)

