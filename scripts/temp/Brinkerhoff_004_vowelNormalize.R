#----------------------------------------------------------------------------------------
# File: 004_vowelNormalize.R
# Project: VowelShift
# Author: Mykel Brinkerhoff
# Date: 2026-01-31 (Sa)
# Description: calculate different normalizations
#
# Usage:
#   Rscript 004_vowelNormalize.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

vwls_norm <- cleaned |>
  tidynorm::norm_nearey(
    F1:F3,
    .by = name
  ) |>
  tidynorm::norm_deltaF(
    F1:F3,
    .by = name
  ) |>
  tidynorm::norm_barkz(
    F1:F3,
    .by = name
  )

lateral_norm <- prelateral |>
  tidynorm::norm_nearey(
    F1:F3,
    .by = name
  ) |>
  tidynorm::norm_deltaF(
    F1:F3,
    .by = name
  ) |>
  tidynorm::norm_barkz(
    F1:F3,
    .by = name
  )

nasal_norm <- prenasal |>
  tidynorm::norm_nearey(
    F1:F3,
    .by = name
  ) |>
  tidynorm::norm_deltaF(
    F1:F3,
    .by = name
  ) |>
  tidynorm::norm_barkz(
    F1:F3,
    .by = name
  )
