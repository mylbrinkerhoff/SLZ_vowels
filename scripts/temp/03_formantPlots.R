#----------------------------------------------------------------------------------------
# File: 03_formantPlots.R
# Project: VowelShift
# Author: Mykel Brinkerhoff
# Date: 2026-02-23 (M)
# Description: What does this script do?
#     Plots the vowels based on formants to find steady state measurements.
#
# Usage:
#   Rscript 03_formantPlots.R
#
# Notes:
#   - Ensure all required packages are installed.
#   - Modify the script as needed for your specific dataset and analysis requirements.
#----------------------------------------------------------------------------------------

# plot the formants
modal_speaker <- zapotec_js |>
  dplyr::filter(Phonation == "modal") |>
  ggplot2::ggplot(aes(
    x = percent,
    y = Hz,
    colour = factor(Vowel),
    group = formant_id
  )) +
  ggplot2::geom_smooth() +
  ggokabeito::scale_colour_okabe_ito() +
  ggplot2::scale_x_continuous(n.breaks = 10) +
  ggplot2::ylim(c(0, 3000)) +
  ggplot2::scale_y_continuous(breaks = seq(0, 3000, by = 500)) +
  ggplot2::facet_grid(Speaker ~ Vowel) +
  ggplot2::labs(
    title = "Vowel trajectories by Speaker and vowel (modal phonation)",
    x = "Percent of vowel",
    y = "Hz"
  ) +
  ggplot2::theme_bw()

ggplot2::ggsave(
  plot = modal_speaker,
  filename = here::here("output", "plots", "SLZ_SpeakerVowel_modal.jpeg"),
  width = 6,
  height = 4,
  dpi = 300,
  units = "in"
)

modal_vowel <- zapotec_js |>
  dplyr::filter(Phonation == "modal") |>
  ggplot2::ggplot(aes(
    x = percent,
    y = Hz,
    colour = factor(Vowel),
    group = formant_id
  )) +
  ggplot2::geom_smooth() +
  ggokabeito::scale_colour_okabe_ito() +
  ggplot2::scale_x_continuous(n.breaks = 10) +
  ggplot2::ylim(c(0, 3000)) +
  ggplot2::scale_y_continuous(breaks = seq(0, 3000, by = 500)) +
  ggplot2::facet_grid(~Vowel) +
  ggplot2::labs(
    title = "Vowel trajectories by vowel (modal phonation)",
    x = "Percent of vowel",
    y = "Hz"
  ) +
  ggplot2::theme_bw()

ggplot2::ggsave(
  plot = modal_vowel,
  filename = here::here("output", "plots", "SLZ_Vowels_modal.jpeg"),
  width = 6,
  height = 4,
  dpi = 300,
  units = "in"
)

speaker_vowels <- zapotec_js |>
  ggplot2::ggplot(aes(
    x = percent,
    y = Hz,
    colour = factor(Vowel),
    group = formant_id
  )) +
  ggplot2::geom_smooth() +
  ggokabeito::scale_colour_okabe_ito() +
  ggplot2::scale_x_continuous(n.breaks = 10) +
  ggplot2::ylim(c(0, 3000)) +
  ggplot2::scale_y_continuous(breaks = seq(0, 3000, by = 500)) +
  ggplot2::facet_grid(Speaker ~ Vowel) +
  ggplot2::labs(
    title = "Vowel trajectories by speaker and vowel (all phonations)",
    x = "Percent of vowel",
    y = "Hz"
  ) +
  ggplot2::theme_bw()

ggplot2::ggsave(
  plot = speaker_vowels,
  filename = here::here("output", "plots", "SLZ_SpeakerVowels.jpeg"),
  width = 6,
  height = 4,
  dpi = 300,
  units = "in"
)

vowels <- zapotec_js |>
  ggplot2::ggplot(aes(
    x = percent,
    y = Hz,
    colour = factor(Vowel),
    group = formant_id
  )) +
  ggplot2::geom_smooth() +
  ggokabeito::scale_colour_okabe_ito() +
  ggplot2::scale_x_continuous(n.breaks = 10) +
  ggplot2::ylim(c(0, 3000)) +
  ggplot2::scale_y_continuous(breaks = seq(0, 3000, by = 500)) +
  ggplot2::facet_grid(~Vowel) +
  ggplot2::labs(
    title = "Vowel trajectories by vowel (all phonation)",
    x = "Percent of vowel",
    y = "Hz"
  ) +
  ggplot2::theme_bw()

ggplot2::ggsave(
  plot = vowels,
  filename = here::here("output", "plots", "SLZ_Vowels.jpeg"),
  width = 6,
  height = 4,
  dpi = 300,
  units = "in"
)
