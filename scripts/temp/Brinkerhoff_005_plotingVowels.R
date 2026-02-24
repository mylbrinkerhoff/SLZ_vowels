#----------------------------------------------------------------------------------------
# File: 005_plotingVowels.R
# Project: VowelShift
# Author: Mykel Brinkerhoff
# Date: 2026-01-31 (Sa)
# Description: Plots the vowel inventories
#
# Usage:
#   Rscript 005_plotingVowels.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

# All vowels
# Plotting my vowels by Hz
vwls_norm |>
  ggplot2::ggplot(aes(
    x = F2,
    y = F1,
    color = vowel,
    label = vowel
  )) +
  ggplot2::geom_point() +
  ggplot2::stat_ellipse(
    level = 0.67,
    geom = "polygon",
    alpha = 0.1,
    aes(fill = vowel)
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  # viridis::scale_colour_viridis() +
  # viridis::scale_fill_viridis() +
  ggplot2::labs(title = "My Vowels in Hz") +
  ggplot2::theme_bw()

# My vowels by ∆F
vwls_norm |>
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = vowel,
    label = vowel
  )) +
  ggplot2::geom_point() +
  ggplot2::stat_ellipse(
    level = 0.67,
    geom = "polygon",
    alpha = 0.1,
    aes(fill = vowel)
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +

  ggplot2::labs(title = "My ∆F normalized Vowels for Fall 2025") +
  ggplot2::theme_bw()

# My vowels in Nearey
vwls_norm |>
  ggplot2::ggplot(aes(
    x = F2_lm,
    y = F1_lm,
    color = vowel,
    label = vowel,
  )) +
  ggplot2::geom_point() +
  ggplot2::stat_ellipse(
    level = 0.67,
    geom = "polygon",
    alpha = 0.1,
    aes(fill = vowel)
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(title = "My Nearey normalized Vowels") +
  ggplot2::theme_bw()

# My vowels in Bark Difference normalization
vwls_norm |>
  ggplot2::ggplot(aes(
    x = F2_bz,
    y = F1_bz,
    color = vowel,
    label = vowel,
  )) +
  ggplot2::geom_point() +
  ggplot2::stat_ellipse(
    level = 0.67,
    geom = "polygon",
    alpha = 0.1,
    aes(fill = vowel)
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(title = "My Bark Difference normalized Vowels") +
  ggplot2::theme_bw()

# Prelateral vowels
# Plotting my vowels by Hz
lateral_norm |>
  ggplot2::ggplot(aes(
    x = F2,
    y = F1,
    color = vowel,
    label = vowel
  )) +
  ggplot2::geom_point() +
  # ggplot2::stat_ellipse(
  #   level = 0.67,
  #   geom = "polygon",
  #   alpha = 0.1,
  #   aes(fill = vowel)
  # ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  # viridis::scale_colour_viridis() +
  # viridis::scale_fill_viridis() +
  ggplot2::labs(title = "My prelateral vowels in Hz") +
  ggplot2::theme_bw()

# My vowels by ∆F
lateral_norm |>
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = vowel,
    label = vowel
  )) +
  ggplot2::geom_point() +
  # ggplot2::stat_ellipse(
  #   level = 0.67,
  #   geom = "polygon",
  #   alpha = 0.1,
  #   aes(fill = vowel)
  # ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +

  ggplot2::labs(title = "My ∆F normalized Vowels for Fall 2025") +
  ggplot2::theme_bw()

# My vowels in Nearey
vwls_norm |>
  ggplot2::ggplot(aes(
    x = F2_lm,
    y = F1_lm,
    color = vowel,
    label = vowel,
  )) +
  ggplot2::geom_point() +
  ggplot2::stat_ellipse(
    level = 0.67,
    geom = "polygon",
    alpha = 0.1,
    aes(fill = vowel)
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(title = "My Nearey normalized Vowels") +
  ggplot2::theme_bw()

# My vowels in Bark Difference normalization
vwls_norm |>
  ggplot2::ggplot(aes(
    x = F2_bz,
    y = F1_bz,
    color = vowel,
    label = vowel,
  )) +
  ggplot2::geom_point() +
  ggplot2::stat_ellipse(
    level = 0.67,
    geom = "polygon",
    alpha = 0.1,
    aes(fill = vowel)
  ) +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggplot2::labs(title = "My Bark Difference normalized Vowels") +
  ggplot2::theme_bw()
