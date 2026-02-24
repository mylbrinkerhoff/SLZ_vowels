#----------------------------------------------------------------------------------------
# File: 003_dataCleaning.R
# Project: VowelShift
# Author: Mykel Brinkerhoff
# Date: 2026-01-31 (Sa)
# Description: Takes the loaded dataset from 002_loadDataset.R and
#              splits the data for plotting, normalization, etc.
#
# Usage:
#   Rscript 003_dataCleaning.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

## Switch to Wells lexical sets
b_vowels <- b_vowels |>
  dplyr::mutate(
    vowel = joeyr::switch_transcriptions(
      vowel,
      .from = arpa,
      .to = wells,
      ordered = F
    )
  )

b_vowels |> count(vowel)

my_vowels <- b_vowels |>
  dplyr::filter(stress == 1) |>
  dplyr::select(
    name,
    vowel,
    word,
    dur,
    F1,
    F2,
    F3,
    fol_seg,
    plt_manner,
    plt_place,
    plt_voice
  ) |>
  # dplyr::mutate(
  #   is_outlier = joeyr::find_outliers(F1, F2, keep = 0.95),
  #   .by = vowel
  # ) |>
  # dplyr::filter(!is_outlier, .by = vowel) |>
  dplyr::mutate(vowel = factor(vowel))
head(my_vowels)

diphthongs <- my_vowels |>
  dplyr::filter(vowel %in% c("MOUTH", "PRICE", "CHOICE"))

preliquid <- my_vowels |>
  dplyr::filter(fol_seg %in% c("R", "L"))

prelateral <- my_vowels |>
  dplyr::filter(fol_seg == "L", !vowel %in% c("MOUTH", "PRICE", "CHOICE"))

prerhotic <- my_vowels |>
  dplyr::filter(fol_seg == "R", !vowel %in% c("MOUTH", "PRICE", "CHOICE"))

prenasal <- my_vowels |>
  dplyr::filter(
    fol_seg %in% c("M", "N", "NG"),
    !vowel %in% c("MOUTH", "PRICE", "CHOICE")
  )

cleaned <- my_vowels |>
  dplyr::filter(
    !fol_seg %in% c("R", "L", "M", "N", "NG"),
    !vowel %in% c("MOUTH", "PRICE", "CHOICE")
  )
