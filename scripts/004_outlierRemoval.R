#----------------------------------------------------------------------------------------
# File: 004_outlierRemoval.R
# Project: VowelShift
# Author: Mykel Brinkerhoff
# Date: 2026-02-01 (Su)
# Description:
#   - Checks if z-scored f0 is greater than 3 st. dev. from mean
#     and removes them if so. This is required by central limit
#     theory which states that most data lies within 3sd of mean.
#   - determines which rows are considered outliers based on the
#     Mahalanobis distance of the vowel based on F1 and F2.
#     Keeps only 95% of the vowels (See Ahn 2025 for a
#     discussion about outliers) based on this Mahalanobis
#     distance.
#   - converts Energy values of 0 to NA and then takes the log10
#     transformation to remove the right tail and to see if
#     distribution is normally distributed.
#   - removes all energy values that are NA
#
# Usage:
#   Rscript 004_outlierRemoval.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

### Remove outliers by F0 keep 99.93% of the tokens
zapotec_clean <- zapotec_vowels |>
  dplyr::mutate(
    F0z = (F0 - mean(F0, na.rm = T)) / sd(F0, na.rm = T),
    .by = c("speaker", "tone")
  ) |>
  dplyr::mutate(
    F0_outlier = dplyr::if_else(abs(F0z) > 3, "outlier", "OK"),
  ) |>
  dplyr::filter(
    F0_outlier == "OK"
  )

# Remove outliers by formants keep 95% based on mahalanobis distance
zapotec_clean <- zapotec_clean |>
  dplyr::mutate(
    is_outlier = joeyr::find_outliers(F1, F2, keep = 0.95),
    .by = c("speaker"),
  ) |>
  dplyr::filter(
    !is_outlier
  )


# Remove outliers by energy
zapotec_clean$Energy[zapotec_clean$Energy == 0] <- NA

zapotec_energy <- zapotec_clean |>
  dplyr::mutate(
    log_energy = log10(Energy)
  ) |>
  dplyr::filter(
    !is.na(log_energy)
  )

zpq <- zapotec_energy
