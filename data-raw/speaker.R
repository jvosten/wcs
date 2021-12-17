library(readr)
library(dplyr)

if (!file.exists("data-raw/spkr-lsas.txt")) {
  download.file(
    "https://www1.icsi.berkeley.edu/wcs/data/20100912/spkr-lsas.txt",
    "data-raw/spkr-lsas.txt"
  )
}

raw <- read_tsv("data-raw/spkr-lsas.txt",
                col_names = c("lang_nr", "speaker_nr",
                              "speaker_age", "speaker_sex") )

speaker <- raw %>%
  # Recode values of speaker_sex to M,F or missing
  dplyr::mutate(speaker_sex = case_when(speaker_sex == "m" ~ "M",
                                        speaker_sex == "FA" ~ "F",
                                        speaker_sex == "f" ~ "F",
                                        speaker_sex == "?" ~ NA_character_,
                                        speaker_sex == "*" ~ NA_character_,
                                        TRUE ~ speaker_sex) %>%
                  as.factor()) %>%
  # Change all non-number values in missing
  dplyr::mutate(speaker_age = case_when(speaker_age == "?" ~ NA_character_,
                                        speaker_age == "??" ~ NA_character_,
                                        speaker_age == "*" ~ NA_character_,
                                        speaker_age == "0" ~ NA_character_,
                                        speaker_age == "M" ~ NA_character_,
                                        speaker_age == "X" ~ NA_character_,
                                        TRUE ~ speaker_age)
                ) %>%
  # There is a spelling mistake in lang 97; there exists a speaker 12 twice but no speaker 13:
  # raw %>%
  # dplyr::filter(lang_nr == 97 & speaker_nr %in% c(10:15))
  dplyr::mutate(speaker_nr = if_else(lang_nr == 97 & speaker_nr == 12 & speaker_age == 19, 13, speaker_nr))


#write_csv(airports, "data-raw/airports.csv")
usethis::use_data(speaker, overwrite = TRUE,  compress = "xz")
