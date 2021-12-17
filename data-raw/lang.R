library(readr)
library(dplyr)
library(xml2)
library(rvest)
library(tibble)

# if (!file.exists("data-raw/lang.txt")) {
#   download.file(
#     "https://www1.icsi.berkeley.edu/wcs/data/20021219/txt/lang.txt",
#     "data-raw/lang.txt"
#   )
# }
#
# raw <- read_tsv("data-raw/lang.txt",
#                   col_names = c("lang_nr", "lang_name", "lang_country",
#                                 "field_worker", "field_worker_2", "field_worker_3",
#                                 "Orig_file", "File_type"))

# Since half of the country names are missing in the original file and some languages contain special characters which cause
# problems when displaying the data, we use the "ISO 639-3 codes" file from the "Primary WCS Data" section of the archive and
# substitute lang_name and lang_country with values from that file.

# Downloading the additional table, transforming the html table into R data frame
if (!file.exists("data-raw/wcs_iso_codes")) {
  wcs_iso_codes <- function() {
    file <- xml2::read_html("https://www1.icsi.berkeley.edu/wcs/WCS_SIL_codes.html")
    tables <- rvest::html_nodes(file, "table")

    codes <-
      tibble::as_tibble(rvest::html_table(tables[[1]],
                                          fill = TRUE)) %>%
      dplyr::rename(lang_nr = Index,
                    lang_name = Language,
                    iso_693_3 = `ISO 639-3 Code`,
                    family = Family,
                    lang_country = `Country Where`) %>%
      dplyr::mutate(lang_country = dplyr::recode(lang_country,
                                                 `Mexico|` = "Mexico",
                                                 `Columbia` = "Colombia",
                                                 `Indonesia (Irian Jaya)` = "Indonesia",
                                                 `Peru, Brazil` = "Peru",
                                                 `USA, Mexico` = "Mexico",
                                                 `Nigeria, Cameroon` = "Nigeria")
      )
    return(codes)
  }

  write_csv(wcs_iso_codes(), "data-raw/wcs_iso_codes.csv")

}

raw <- read_csv("data-raw/wcs_iso_codes.csv")

lang <- raw %>%
  # drop the author and file variables, as they are meta data
  dplyr::select(lang_nr, lang_name, lang_country, iso_693_3)

#write_csv(airports, "data-raw/airports.csv")
usethis::use_data(lang, overwrite = TRUE,  compress = "xz")
