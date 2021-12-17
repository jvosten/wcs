library(readr)
library(dplyr)

if (!file.exists("data-raw/term.txt")) {
  download.file(
    "https://www1.icsi.berkeley.edu/wcs/data/20021219/txt/term.txt",
    "data-raw/term.txt"
  )
}

raw <- read_tsv("data-raw/term.txt",
                col_names = c("lang_nr", "speaker_nr",
                              "chip_nr", "term_abb"))

term <- raw %>%
  # Recoding NA values for term_abb
  dplyr::mutate(term_abb = na_if(term_abb, "*"),
                term_abb = na_if(term_abb, "?"))

#write_csv(airports, "data-raw/airports.csv")
usethis::use_data(term, overwrite = TRUE,  compress = "xz")
