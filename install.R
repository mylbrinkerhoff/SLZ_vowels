#----------------------------------------------------------------------------------------
# File: install.R
# Project: SLZ_Vowels
# Author: Mykel Brinkerhoff
# Date: 2026-02-07 (Sa)
# Description: Installs and loads renv into the Binder
#              environment
#
# Usage:
#   Rscript install.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------
install.packages('renv', repos = c(CRAN = 'https://cloud.r-project.org'))

library(renv)

renv::restore()
