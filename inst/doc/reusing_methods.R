## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(deident)

psu <- Pseudonymizer$new()

name_pipe <- starwars |>
  deident(psu, name)

apply_deident(starwars, name_pipe)

## -----------------------------------------------------------------------------
combined.frm <- data.frame(
  ID = c(head(starwars$name, 5), head(ShiftsWorked$Employee, 5))
)

reused_pipe <- combined.frm |>
  deident(psu, ID)

apply_deident(combined.frm, reused_pipe)


