#----------------------------------------------------------------------------------------
# File: 003_dataMunging.R
# Project:
# Author: Mykel Brinkerhoff
# Date: 2026-02-01 (Su)
# Description: What does this script do?
#
# Usage:
#   Rscript 003_dataMunging.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

#
zapotec_vowels <- zapotec |>
  dplyr::mutate(
    idnum = dplyr::row_number(),
    Phonation = dplyr::recode(Phonation, "laryngealized" = "rearticulated")
  ) |>
  dplyr::select(
    Speaker,
    Vowel,
    Phonation,
    Tone,
    seg_End,
    strF0_mean,
    sF1_mean,
    sF2_mean,
    sF3_mean,
    sF4_mean,
    Energy_mean
  ) |>
  dplyr::rename(
    speaker = Speaker,
    vowel = Vowel,
    phonation = Phonation,
    tone = Tone,
    duration = seg_End,
    F0 = strF0_mean,
    F1 = sF1_mean,
    F2 = sF2_mean,
    F3 = sF3_mean,
    F4 = sF4_mean,
    energy = Energy_mean
  ) |>
  dplyr::mutate(
    speaker = factor(speaker),
    vowel = factor(vowel),
    phonation = factor(phonation),
    tone = factor(tone)
  )
