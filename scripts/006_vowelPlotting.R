#----------------------------------------------------------------------------------------
# File: 006_vowelPlotting.R
# Project:
# Author: Mykel Brinkerhoff
# Date: 2026-02-01 (Su)
# Description:
#   - Plots vowel space based on raw Hz and each normalization
#   - Each vowel is plotted as a point and there is a 1sd elipsis
#     around each centroid
#
# Usage:
#   Rscript 006_vowelPlotting.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

# Vowels in Hz
zpq_norm |>
  ggplot2::ggplot(aes(
    x = F2,
    y = F1,
    color = vowel,
    label = vowel
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(data = zpq_means, colour = "black") +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggokabeito::scale_color_okabe_ito() +
  ggokabeito::scale_fill_okabe_ito() +
  ggplot2::labs(
    title = "SLZ Vowels in Hz",
    x = "F2 (Hz)",
    y = "F1 (Hz)"
  ) +
  ggplot2::facet_wrap(~gender) +
  ggplot2::theme_bw()

# Vowels in Nearey
zpq_norm |>
  ggplot2::ggplot(aes(
    x = F2_lm,
    y = F1_lm,
    color = vowel,
    label = vowel
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(data = zpq_means, colour = "black") +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggokabeito::scale_color_okabe_ito() +
  ggokabeito::scale_fill_okabe_ito() +
  ggplot2::labs(
    title = "SLZ Nearey Normalized Vowels ",
    x = "F2 (nearey)",
    y = "F1 (nearey)"
  ) +
  ggplot2::facet_grid(. ~ gender) +
  ggplot2::theme_bw()

# Vowels in bark
zpq_norm |>
  ggplot2::ggplot(aes(
    x = F2_bz,
    y = F1_bz,
    color = vowel,
    label = vowel
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(data = zpq_means, colour = "black") +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggokabeito::scale_color_okabe_ito() +
  ggokabeito::scale_fill_okabe_ito() +
  ggplot2::labs(
    title = "SLZ Bark Difference Normalized Vowels ",
    x = "F2 (bark)",
    y = "F1 (bark)"
  ) +
  ggplot2::facet_grid(. ~ gender) +
  ggplot2::theme_bw()

# Vowels in ∆F
zpq_norm |>
  ggplot2::ggplot(aes(
    x = F2_df,
    y = F1_df,
    color = vowel,
    label = vowel
  )) +
  ggplot2::geom_point(alpha = 0.2) +
  ggplot2::stat_ellipse(
    level = 0.67,
    linewidth = 1
  ) +
  ggplot2::geom_label(data = zpq_means, colour = "black") +
  ggplot2::scale_x_reverse(position = "top") +
  ggplot2::scale_y_reverse(position = "right") +
  ggokabeito::scale_color_okabe_ito() +
  ggokabeito::scale_fill_okabe_ito() +
  ggplot2::labs(
    title = "SLZ ∆F Normalized Vowels ",
    x = "F2 (∆F)",
    y = "F1 (∆F)"
  ) +
  ggplot2::facet_grid(. ~ gender) +
  ggplot2::theme_bw()
