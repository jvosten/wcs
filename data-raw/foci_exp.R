library(readr)
library(dplyr)
library(purrr)

if (!file.exists("data-raw/foci-exp.txt")) {
  download.file(
    "https://www1.icsi.berkeley.edu/wcs/data/20030414/txt/foci-exp.txt",
    "data-raw/foci-exp.txt"
  )
}

raw <- read_table("data-raw/foci-exp.txt",
                col_names = c("lang_nr", "speaker_nr", "focus_response",
                              "term_abb", "grid_coord"))

grid_coordinates <- function() {
  LETTERS[2:9] %>%
    purrr::map(paste0, 0:40) %>%
    purrr::flatten_chr() %>%
    c("A0", ., "J0")
}

foci_exp <- raw %>%
  dplyr::filter(grid_coord %in% grid_coordinates()) %>%
  dplyr::mutate(grid_coord = as.factor(grid_coord))

#write_csv(airports, "data-raw/airports.csv")
usethis::use_data(foci_exp, overwrite = TRUE,  compress = "xz")
