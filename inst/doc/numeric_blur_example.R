## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(deident)

quantile_cuts <- quantile(ShiftsWorked$`Daily Pay`, c(0.25, 0.5, 0.75))

numeric_blur_pipe <- ShiftsWorked |>
  add_numeric_blur(`Daily Pay`, cuts = quantile_cuts)

apply_deident(ShiftsWorked, numeric_blur_pipe)

