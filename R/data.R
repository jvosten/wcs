#' @importFrom tibble tibble
NULL

#' Chips
#'
#' Chip numbers and grid coordinates for the Munsell chart.
#'
#' @source <https://www1.icsi.berkeley.edu/wcs/data/20021219/txt/chip.txt>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{chip_nr}{WCS Chip Number: values from 1 to 330}
#'  \item{grid_row}{WCS Grid Row: values from A to J}
#'  \item{grid_col}{WCS Grid Columns: values from 0 to 40}
#'  \item{grid_coord}{Concatenation of grid_row and grid_col}
#' 
#' }
#' @examples
#' chip
#'
#' if (require("dplyr")) {
#'
#' chip %>% dplyr::filter(chip_nr > 150)
#'
#' }
"chip"

#' Term task
#'
#' Data for the WCS naming task (chip responses).
#'
#' @source <https://www1.icsi.berkeley.edu/wcs/data/20021219/txt/term.txt>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{lang_nr}{WCS Language Number: values from 1 to 110}
#'  \item{speaker_nr}{Unique number of speakers per language}
#'  \item{chip_nr}{WCS Chip Number: values from 1 to 330}
#'  \item{term_abb}{A unique abbreviation of the term}
#' }
"term"

#' Munsell to CIEL*a*b
#'
#' Mapping table for Munsell Value, Chroma & Hue values to the CIELAB color space.
#' The conversion from Munsell to CIEL*a*b* was done assuming Illuminant C.
#'
#' @source <https://www1.icsi.berkeley.edu/wcs/data/cnum-maps/cnum-vhcm-lab-new.txt>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{wcs_mv}{WCS code for Munsell Value}
#'  \item{wcs_mh}{WCS code for Munsell Hue}
#'  \item{mun_chroma}{Munsell Chroma}
#'  \item{mun_hue}{Munsell Hue}
#'  \item{mun_value}{Munsell Value}
#'  \item{L_star}{CIEL*a*b* `L*` reference value }
#'  \item{a_star}{CIEL*a*b* `a` reference value}
#'  \item{b_star}{CIEL*a*b* `b*` reference value}
#' } 
"mun_2_lab"

#' Foci task (expanded)
#'
#' WCS focus task responses, all chip ranges are expanded, with a single chip per line.
#'
#' @source <https://www1.icsi.berkeley.edu/wcs/data/20030414/txt/foci-exp.txt>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{lang_nr}{WCS Language Number: values from 1 to 110}
#'  \item{speaker_nr}{Unique number of speakers per language}
#'  \item{focus_response}{Sequential enumeration of focus responses}
#'  \item{term_abb}{A unique abbreviation of the term}
#'  \item{grid_coord}{Concatenation of grid_row and grid_col}
#' }
"foci_exp"

#' Languages
#'
#' Information on the WCS language names, including origin and ISO 693-3 codes.
#'
#' @source <https://www1.icsi.berkeley.edu/wcs/WCS_SIL_codes.html>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{lang_nr}{WCS Language Number: values from 1 to 110}
#'  \item{lang_name}{Name of each language}
#'  \item{lang_country}{Country}
#'  \item{iso_693_3}{ISO code of each language}
#' }
"lang"

#' Speaker
#'
#' Information on each speaker of WCS, including age and sex.
#'
#' @source <https://www1.icsi.berkeley.edu/wcs/data/20100912/spkr-lsas.txt>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{lang_nr}{WCS Language Number: values from 1 to 110}
#'  \item{speaker_nr}{Unique number of speakers per language}
#'  \item{speaker_age}{Age, in years}
#'  \item{speaker_sex}{Sex, male or female}
#' }
"speaker"

#' Dictionary
#'
#' Dictionary file to lookup term number and the corresponding term and abbreviaton for each language.
#'
#' @source <https://www1.icsi.berkeley.edu/wcs/data/20041016/txt/dict.txt>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{lang_nr}{WCS Language Number: values from 1 to 110}
#'  \item{term_nr}{Sequential numbering of terms per language}
#'  \item{term}{Transcription of the color term}
#'  \item{term_abb}{A unique abbreviation of the term}
#' }
"dict"
