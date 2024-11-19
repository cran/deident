## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(deident)
set.seed(101)

perturb_pipe <- ShiftsWorked |>
  add_perturb(`Daily Pay`)

apply_deident(ShiftsWorked, perturb_pipe)

## -----------------------------------------------------------------------------
perturb_pipe_white_noise <- ShiftsWorked |>
  add_perturb(`Daily Pay`, noise = white_noise(sd=0.3))

apply_deident(ShiftsWorked, perturb_pipe_white_noise)

## -----------------------------------------------------------------------------
perturb_pipe_heavy_adaptive_noise <- ShiftsWorked |>
  add_perturb(`Daily Pay`, noise = adaptive_noise(sd.ratio=0.4))

apply_deident(ShiftsWorked, perturb_pipe_heavy_adaptive_noise)

