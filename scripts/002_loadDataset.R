#----------------------------------------------------------------
# File: 002_loadDataset.R
# Project:
# Author: Mykel Brinkerhoff
# Date: 2026-01-31 (Sa)
# Description: Loads in the vowel dataset for Santaigo Laxopa 
# Zapotec
#
# Usage:
#   Rscript 002_loadDataset.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------

# ### Load in dataset for Brinkerhoff_vowels.csv
# b_vowels <- readr::read_csv(here::here("data", "Brinkerhoff_vowels.csv"))

### Load dataset for zapotec vowels.
zapotec <- readr::read_csv(here::here(
  "data",
  "raw",
  "Voice_Master_Split.csv"
))
