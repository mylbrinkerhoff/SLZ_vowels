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

### restore R session and packages to versions found in the renv.lock file
renv::restore()

### Load helper packages
library(dplyr) # for data manipulation, graphic, and data wrangling
library(readr) # loading in data
library(stringr) # look for stuff in strings
library(ggplot2) # for plotting
library(here) # for creating pathways relative to the top-level directory
# library(remotes) # allows accessing github
library(joeyr) # needed for the find_outliers function
library(ggokabeito) # colorblind friendly color based on Okabe-Ito scheme
library(adehabitatHR) # needed for Bhattacharyya's Affinity calculation
library(sp) # needed for Bhattacharyya's Affinity calculation

### Load vowel specific packages
library(tidynorm) # package for vowel normalization

### loading functions found in the /scripts/functions/ folder
source(here::here(
    "scripts",
    "functions",
    "overlap.R"
))
