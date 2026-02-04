#------------------------------------------------------------------
# File: 001_startHere.R
# Project:
# Author: Mykel Brinkerhoff
# Date: 2026-01-31 (Sa)
# Description: Loads in the required packages.
#
# Usage:
#   Rscript 001_startHere.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#------------------------------------------------------------------

### install packages if not yet installed
renv::restore()

### loading functions
source(here::here(
    "scripts",
    "functions",
    "overlap.R"
))

# If not already installed
# renv::install(
#     packages = c(
#         "tidyverse",
#         "viridis",
#         "here",
#         "remotes",
#         "tidynorm",
#         "ggokabeito",
#         "adehabitatHR",
#         "sp"
#     )
# )
# remotes::install_github("joeystanley/joeyr") # helper functions from joeystanley
# remotes::install_github("joeystanley/joeysvowels") # vowel datasets

# Helper packages
library(tidyverse) # for data manipulation, graphic, and data wrangling
library(viridis) # for colorblind friendly colors in ggplot
library(here) # for creating pathways relative to the top-level directory
library(remotes) # allows accessing github
library(joeyr)
library(ggokabeito)
library(adehabitatHR)
library(sp)

# Vowel packages
library(joeysvowels)
library(tidynorm) # package for vowel normalization
