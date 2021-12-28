# Helpers ---------------------------------------------------------------------------------------------------------------------- #

# Function, to substitute duplicate values in term_abb by na values
rm_duplicates <- function(lang_dict){
  lang_dict %>%
    dplyr::group_by(lang_nr, term_abb) %>%
    dplyr::mutate(duplicate.flag = dplyr::n() > 1,
                  term_abb = dplyr::if_else(duplicate.flag == TRUE, NA_character_, term_abb),
                  term_abb = as.factor(term_abb)) %>%
    dplyr::ungroup() %>%
    dplyr::select(-duplicate.flag)
}

# Merge chip and mun2lab
chart <- function() {
  mun_2_lab %>% # grid row & col aus chip sind möglw unnötig
    dplyr::mutate(chip_nr = as.numeric(chip_nr)) %>%
    dplyr::left_join(chip, by = "chip_nr") %>%
    dplyr::select(c(1, 12, 2:11)) %>%
    dplyr::arrange(chip_nr)
}

#'
#' Term task
#'
#' Merge term data with all the dictionary data (chip, mun_2_lab, dict, lang, speaker)
#' to obtain one large data frame
#'
#' @return A tibble data frame.
#' @export
#'
#' @examples
#' term_task()
term_task <- function() {
  term %>%
    dplyr::left_join(rm_duplicates(dict),
                     by = c("lang_nr", "term_abb"),
                     na_matches = "never") %>%
    dplyr::left_join(speaker,
                     by = c("lang_nr", "speaker_nr")) %>%
    dplyr::left_join(chart(),
                     by = "chip_nr") %>%
    dplyr::left_join(lang,
                     by = "lang_nr")
}

#'
#' Foci task
#'
#' Merge foci data with all the dictionary data (chip, mun_2_lab, dict, lang, speaker)
#' to obtain one large data frame
#'
#' @return A tibble data frame.
#' @export
#'
#' @examples
#' term_task()
foci_task <- function() {
  foci_exp %>%
    dplyr::left_join(rm_duplicates(dict),
                     by = c("lang_nr", "term_abb"),
                     na_matches = "never") %>%
    dplyr::left_join(speaker,
                     by = c("lang_nr", "speaker_nr")) %>%
    dplyr::left_join(chart(),
                     by = "grid_coord") %>%
    dplyr::left_join(lang,
                     by = "lang_nr")
}
