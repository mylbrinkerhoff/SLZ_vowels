#----------------------------------------------------------------------------------------
# File: 004_outlierRemoval.R
# Project:
# Author: Mykel Brinkerhoff
# Date: 2026-02-01 (Su)
# Description: What does this script do?
#
# Usage:
#   Rscript 004_outlierRemoval.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

# Remove outliers by F0
zapotec_clean <- zapotec_vowels |>
  dplyr::mutate(
    F0z = (F0 - mean(F0, na.rm = T)) / sd(F0, na.rm = T),
    .by = speaker
  ) |>
  dplyr::mutate(
    F0_outlier = dplyr::if_else(abs(F0z) > 3, "outlier", "OK"),
  ) |>
  dplyr::filter(
    F0_outlier == "OK"
  )

# Remove outliers by formants
zapotec_clean <- zapotec_clean |>
  dplyr::mutate(
    is_outlier = joeyr::find_outliers(F1, F2, keep = 0.95),
    .by = c("vowel"),
  ) |>
  dplyr::filter(
    !is_outlier
  )


# Remove outliers by energy
zapotec_clean$energy[zapotec_clean$energy == 0] <- NA

zapotec_energy <- zapotec_clean |>
  dplyr::mutate(
    log_energy = log10(energy)
  ) |>
  dplyr::filter(
    !is.na(log_energy)
  )

zpq <- zapotec_energy
