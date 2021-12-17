library(readr)
library(dplyr)

if (!file.exists("data-raw/dict.txt")) {
  download.file(
    "https://www1.icsi.berkeley.edu/wcs/data/20041016/txt/dict.txt",
    "data-raw/dict.txt"
  )
}

raw <- read_tsv("data-raw/dict.txt",
                col_names = c("lang_nr", "term_nr",
                              "term", "term_abb"))
raw <- raw[-1, ]

dict <- raw %>%
  # Transform char vars to numeric
  dplyr::mutate(across(c(lang_nr, term_nr), as.numeric)) %>%
  # Deal with missing values and falsely named vars
  dplyr::mutate(term_abb = dplyr::case_when(term == "'ndaa" ~ "ND", # This recodes the missing term_abb which have a corresponding term
                                            term == "namonsitihante" ~ "NM",
                                            term == "naatuca" ~ "NT",
                                            term == "anaranjada/naranjada" ~ "AN",
                                            term == "naranjana" ~ "NR",
                                            term == "néng2/niáng2" ~ "NE",
                                            term == "naranjado" ~ "NR",
                                            term == "najerona" ~ "NJ",
                                            term == "narane" ~ "NR",
                                            term == "nilea" ~ "NI",
                                            term == "naranjada" ~ "NR",
                                            term == "cana" ~ "CA",
                                            term == "naraja" ~ "NR",
                                            term == "ñagla" ~ "NG",
                                            term == "namaal" ~ "NM",
                                            term == "ñiro" ~ "NI",
                                            TRUE ~ term_abb),
                # This cleans the terms, which are missing
                term = dplyr::case_when(term == "??" ~ NA_character_,
                                        term == "blank" ~ NA_character_,
                                        TRUE ~ term),
                # this cleans the two term_abb, which are '??'
                term_abb = dplyr::case_when(term == is.na(term) ~ NA_character_,
                                            term == "welee" ~ "WE",
                                            term_abb == "??" ~ NA_character_,
                                            TRUE ~ term_abb)
  )

usethis::use_data(dict, overwrite = TRUE,  compress = "xz")
