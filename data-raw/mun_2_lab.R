library(readr)
library(dplyr)

if (!file.exists("data-raw/cnum-vhcm-lab-new.txt")) {
  download.file(
    "https://www1.icsi.berkeley.edu/wcs/data/cnum-maps/cnum-vhcm-lab-new.txt",
    "data-raw/cnum-vhcm-lab-new.txt"
  )
}

raw <- read_tsv("data-raw/cnum-vhcm-lab-new.txt",
                col_names = c("chip_nr", "wcs_mv", "wcs_mh", "mun_chroma",
                              "mun_hue", "mun_value", "L_star", "a_star", "b_star"))
raw <- raw[-1, ]

mun_2_lab <- raw %>%
  dplyr::mutate(dplyr::across(!c(wcs_mv, mun_hue), as.numeric),
                dplyr::across(c(wcs_mv, mun_hue), as.factor))

#write_csv(airports, "data-raw/airports.csv")
usethis::use_data(mun_2_lab, overwrite = TRUE,  compress = "xz")
