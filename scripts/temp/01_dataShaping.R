#----------------------------------------------------------------------------------------
# File: 01_dataShaping.R
# Project:
# Author: Mykel Brinkerhoff
# Date: 2026-02-23 (M)
# Description:
#   - Reorganizes the dataframe selecting the F1:F4, F0, and Energy
#
# Usage:
#   Rscript 02_dataShaping.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

# Preprocessing the data
library(reshape2) # for data manipulation

### Rename seg_End
colnames(zapotec)[colnames(zapotec) == 'seg_End'] <- 'Duration'

### Rearranging values for analysis and comparison
slz <- zapotec %>%
  dplyr::mutate(idnum = dplyr::row_number()) %>%
  dplyr::mutate(
    Phonation = dplyr::recode(Phonation, "laryngealized" = "rearticulated")
  )

#### strF0
slz_strF0 <- slz |>
  dplyr::select(
    Speaker,
    Word,
    Iter,
    Vowel,
    Phonation,
    Tone,
    Duration,
    idnum,
    strF0_means001,
    strF0_means002,
    strF0_means003,
    strF0_means004,
    strF0_means005,
    strF0_means006,
    strF0_means007,
    strF0_means008,
    strF0_means009,
    strF0_means010
  )

slz_strF0_trans <- reshape2::melt(
  slz_strF0,
  id = c(
    "Speaker",
    "Word",
    "Iter",
    "Vowel",
    "Phonation",
    'Tone',
    "Duration",
    "idnum"
  )
)

slz_strF0_trans$measurement.no <- stringr::str_sub(
  slz_strF0_trans$variable,
  -2,
  -1
)
slz_strF0_trans <- slz_strF0_trans |>
  dplyr::rename(F0 = value) |>
  dplyr::select(-variable)

#### sF1
slz_sF1 <- slz |>
  dplyr::select(
    idnum,
    sF1_means001,
    sF1_means002,
    sF1_means003,
    sF1_means004,
    sF1_means005,
    sF1_means006,
    sF1_means007,
    sF1_means008,
    sF1_means009,
    sF1_means010
  )

slz_sF1_trans <- reshape2::melt(slz_sF1, id = c("idnum"))

slz_sF1_trans$measurement.no <- stringr::str_sub(slz_sF1_trans$variable, -2, -1)

slz_sF1_trans <- slz_sF1_trans |>
  dplyr::rename(F1 = value) |>
  dplyr::select(-variable)

#### sF2
slz_sF2 <- slz |>
  select(
    idnum,
    sF2_means001,
    sF2_means002,
    sF2_means003,
    sF2_means004,
    sF2_means005,
    sF2_means006,
    sF2_means007,
    sF2_means008,
    sF2_means009,
    sF2_means010
  )

slz_sF2_trans <- reshape2::melt(slz_sF2, id = c("idnum"))

slz_sF2_trans$measurement.no <- stringr::str_sub(slz_sF2_trans$variable, -2, -1)

slz_sF2_trans <- slz_sF2_trans |>
  dplyr::rename(F2 = value) |>
  dplyr::select(-variable)

#### sF3
slz_sF3 <- slz |>
  select(
    idnum,
    sF3_means001,
    sF3_means002,
    sF3_means003,
    sF3_means004,
    sF3_means005,
    sF3_means006,
    sF3_means007,
    sF3_means008,
    sF3_means009,
    sF3_means010
  )

slz_sF3_trans <- reshape2::melt(slz_sF3, id = c("idnum"))

slz_sF3_trans$measurement.no <- stringr::str_sub(slz_sF3_trans$variable, -2, -1)

slz_sF3_trans <- slz_sF3_trans |>
  dplyr::rename(F3 = value) |>
  dplyr::select(-variable)

#### sF4
slz_sF4 <- slz |>
  select(
    idnum,
    sF4_means001,
    sF4_means002,
    sF4_means003,
    sF4_means004,
    sF4_means005,
    sF4_means006,
    sF4_means007,
    sF4_means008,
    sF4_means009,
    sF4_means010
  )

slz_sF4_trans <- reshape2::melt(slz_sF4, id = c("idnum"))

slz_sF4_trans$measurement.no <- stringr::str_sub(slz_sF4_trans$variable, -2, -1)

slz_sF4_trans <- slz_sF4_trans |>
  dplyr::rename(F4 = value) |>
  dplyr::select(-variable)

#### Energy
slz_energy <- slz |>
  select(
    idnum,
    Energy_means001,
    Energy_means002,
    Energy_means003,
    Energy_means004,
    Energy_means005,
    Energy_means006,
    Energy_means007,
    Energy_means008,
    Energy_means009,
    Energy_means010
  )

slz_energy_trans <- reshape2::melt(slz_energy, id = c("idnum"))

slz_energy_trans$measurement.no <- stringr::str_sub(
  slz_energy_trans$variable,
  -2,
  -1
)

slz_energy_trans <- slz_energy_trans |>
  dplyr::rename(Energy = value) |>
  dplyr::select(-variable)


### merging
slz_trans <- list(
  slz_strF0_trans,
  slz_sF1_trans,
  slz_sF2_trans,
  slz_sF3_trans,
  slz_sF4_trans,
  slz_energy_trans
) |>
  reduce(merge, by = c("idnum", "measurement.no"))

# Saving the file
write.csv(
  slz_trans,
  file = here::here("data", "interim", "formants_slz.csv"),
  row.names = F,
  fileEncoding = "UTF-8"
)
