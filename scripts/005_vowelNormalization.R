#-----------------------------------------------------------
# File: 005_vowelNormalization.R
# Project:
# Author: Mykel Brinkerhoff
# Date: 2026-02-01 (Su)
# Description:
#   - Normalize the vowels by speaker using Nearey, ∆F, and Bark
#   - Calculates the centroid of each vowel based on HZ, Nearey,
#     ∆F, and Bark
#
# Usage:
#   Rscript 005_vowelNormalization.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#-----------------------------------------------------------

### Vowel normalizations
zpq_norm <- zpq |>
  tidynorm::norm_nearey(
    F1:F4,
    .by = c("gender", "speaker")
  ) |>
  tidynorm::norm_deltaF(
    F1:F4,
    .by = c("gender", "speaker")
  ) |>
  tidynorm::norm_barkz(
    F1:F4,
    .by = c("gender", "speaker")
  )

### Locating the centroids of each vowel in raw Hz, and each
### normalization
zpq_means <- zpq_norm |>
  dplyr::summarise(
    F1 = mean(F1),
    F2 = mean(F2),
    F1_lm = mean(F1_lm),
    F2_lm = mean(F2_lm),
    F1_bz = mean(F1_bz),
    F2_bz = mean(F2_bz),
    F1_df = mean(F1_df),
    F2_df = mean(F2_df),
    .by = c("gender", "vowel")
  )
