#----------------------------------------------------------------------------------------
# File: 007_vowelOverlap.R
# Project:
# Author: Mykel Brinkerhoff
# Date: 2026-02-01 (Su)
# Description: What does this script do?
#
# Usage:
#   Rscript 007_vowelOverlap.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

# Splitting the dataframe into male and female
df_f <- zpq_norm |>
  dplyr::filter(stringr::str_detect(speaker, 'f'))

df_m <- zpq_norm |>
  dplyr::filter(stringr::str_detect(speaker, 'm'))

# All speakers
u_o <- zpq_norm |>
  dplyr::filter(vowel %in% c("u", "o"))

# male speakers
male_u_o <- df_m |>
  dplyr::filter(vowel %in% c("u", "o"))

# female speakers
female_u_o <- df_f |>
  dplyr::filter(vowel %in% c("u", "o"))

# Overlap based on Hz
u_overlap <- u_o |>
  dplyr::summarise(
    pillai = overlap(F1, F2, vowel = vowel, method = "pillai"),
    bhatt = overlap(F1, F2, vowel = vowel, method = "BA")
  )
u_overlap

male_overlap <- male_u_o |>
  dplyr::summarise(
    pillai = overlap(F1, F2, vowel = vowel, method = "pillai"),
    bhatt = overlap(F1, F2, vowel = vowel, method = "BA")
  )
male_overlap

female_overlap <- female_u_o |>
  dplyr::summarise(
    pillai = overlap(F1, F2, vowel = vowel, method = "pillai"),
    bhatt = overlap(F1, F2, vowel = vowel, method = "BA")
  )
female_overlap

# overlap based on ∆F
delta_overlap <- u_o |>
  dplyr::summarise(
    pillai = overlap(F1_df, F2_df, vowel = vowel, method = "pillai"),
    bhatt = overlap(F1_df, F2_df, vowel = vowel, method = "BA")
  )
delta_overlap

male_delta <- male_u_o |>
  dplyr::summarise(
    pillai = overlap(F1_df, F2_df, vowel = vowel, method = "pillai"),
    bhatt = overlap(F1_df, F2_df, vowel = vowel, method = "BA")
  )
male_delta

female_delta <- female_u_o |>
  dplyr::summarise(
    pillai = overlap(F1_df, F2_df, vowel = vowel, method = "pillai"),
    bhatt = overlap(F1_df, F2_df, vowel = vowel, method = "BA")
  )
female_delta
