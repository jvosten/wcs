library(readr)
library(dplyr)

if (!file.exists("data-raw/chip.txt")) {
  download.file(
    "https://www1.icsi.berkeley.edu/wcs/data/20021219/txt/chip.txt",
    "data-raw/chip.txt"
  )
}

raw <- read_tsv("data-raw/chip.txt",
                col_names = c("chip_nr", "grid_row",
                              "grid_col", "grid_coord"))

chip <- raw %>%
  dplyr::mutate(across(c(grid_row, grid_coord), as.factor))

#write_csv(airports, "data-raw/airports.csv")
usethis::use_data(chip, overwrite = TRUE,  compress = "xz")
