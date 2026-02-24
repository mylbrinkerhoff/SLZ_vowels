#----------------------------------------------------------------
# File: 003_dataMunging.R
# Project:
# Author: Mykel Brinkerhoff
# Date: 2026-02-01 (Su)
# Description:
#   - Filter for modal vowels only
#   - Takes the vowel dataset and renames "laryngealized"
#     phonation as "rearticulated"
#   - Selects only the needed columns from the VoiceSauce output
#   - Renames the selected columns to make analysis and plotting
#     easier
#   - factorizes categorical columns
#
# Usage:
#   Rscript 003_dataMunging.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------

###
zapotec_vowels <- zapotec |>
  dplyr::filter(Phonation == "modal") |> # Filter on modal
  dplyr::mutate(
    # take the middle portion of the vowel for the measures
    F0 = (strF0_means004 + strF0_means005 + strF0_means006 + strF0_means007) /
      4,
    F1 = (sF1_means004 + sF1_means005 + sF1_means006 + sF1_means007) / 4,
    F2 = (sF2_means004 + sF2_means005 + sF2_means006 + sF2_means007) / 4,
    F3 = (sF3_means004 + sF3_means005 + sF3_means006 + sF3_means007) / 4,
    F4 = (sF4_means004 + sF4_means005 + sF4_means006 + sF4_means007) / 4,
    Energy = (Energy_means004 +
      Energy_means005 +
      Energy_means006 +
      Energy_means007) /
      4
  ) |>
  dplyr::select(
    # Select only the following columns
    Speaker,
    Vowel,
    Phonation,
    Tone,
    F0,
    F1,
    F2,
    F3,
    F4,
    Energy
  ) |>
  dplyr::rename(
    # rename the columns
    speaker = Speaker,
    vowel = Vowel,
    phonation = Phonation,
    tone = Tone
  ) |>
  dplyr::mutate(
    # make sure these are factors
    speaker = factor(speaker),
    vowel = factor(vowel),
    phonation = factor(phonation),
    tone = factor(tone)
  )
