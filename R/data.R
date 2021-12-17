#' @importFrom tibble tibble
NULL

#' Chip
#'
#' Useful metadata about airports.
#'
#' @source <https://openflights.org/data.html>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{chip_nr}{Values from 1 to 330}
#'  \item{grid_row}{Values from A to J}
#'  \item{grid_col}{Values from 0 to 40}
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

#' Term
#'
#' Useful metadata about airports.
#'
#' @source <https://openflights.org/data.html>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{faa}{FAA airport code.}
#'  \item{name}{Usual name of the airport.}
#'  \item{lat, lon}{Location of airport.}
#'  \item{alt}{Altitude, in feet.}
#'  \item{tz}{Timezone offset from GMT.}
#'  \item{dst}{Daylight savings time zone. A = Standard US DST: starts on the
#'     second Sunday of March, ends on the first Sunday of November.
#'     U = unknown. N = no dst.}
#'  \item{tzone}{IANA time zone, as determined by GeoNames webservice.}
#' }
"term"

#' Mun2Lab
#'
#' Useful metadata about airports.
#'
#' @source <https://openflights.org/data.html>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{faa}{FAA airport code.}
#'  \item{name}{Usual name of the airport.}
#'  \item{lat, lon}{Location of airport.}
#'  \item{alt}{Altitude, in feet.}
#'  \item{tz}{Timezone offset from GMT.}
#'  \item{dst}{Daylight savings time zone. A = Standard US DST: starts on the
#'     second Sunday of March, ends on the first Sunday of November.
#'     U = unknown. N = no dst.}
#'  \item{tzone}{IANA time zone, as determined by GeoNames webservice.}
#' }
"mun_2_lab"

#' Airport metadata
#'
#' Useful metadata about airports.
#'
#' @source <https://openflights.org/data.html>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{faa}{FAA airport code.}
#'  \item{name}{Usual name of the airport.}
#'  \item{lat, lon}{Location of airport.}
#'  \item{alt}{Altitude, in feet.}
#'  \item{tz}{Timezone offset from GMT.}
#'  \item{dst}{Daylight savings time zone. A = Standard US DST: starts on the
#'     second Sunday of March, ends on the first Sunday of November.
#'     U = unknown. N = no dst.}
#'  \item{tzone}{IANA time zone, as determined by GeoNames webservice.}
#' }
"foci_exp"

#' Lang
#'
#' Useful metadata about airports.
#'
#' @source <https://openflights.org/data.html>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{faa}{FAA airport code.}
#'  \item{name}{Usual name of the airport.}
#'  \item{lat, lon}{Location of airport.}
#'  \item{alt}{Altitude, in feet.}
#'  \item{tz}{Timezone offset from GMT.}
#'  \item{dst}{Daylight savings time zone. A = Standard US DST: starts on the
#'     second Sunday of March, ends on the first Sunday of November.
#'     U = unknown. N = no dst.}
#'  \item{tzone}{IANA time zone, as determined by GeoNames webservice.}
#' }
"lang"

#' Speaker
#'
#' Useful metadata about airports.
#'
#' @source <https://openflights.org/data.html>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{faa}{FAA airport code.}
#'  \item{name}{Usual name of the airport.}
#'  \item{lat, lon}{Location of airport.}
#'  \item{alt}{Altitude, in feet.}
#'  \item{tz}{Timezone offset from GMT.}
#'  \item{dst}{Daylight savings time zone. A = Standard US DST: starts on the
#'     second Sunday of March, ends on the first Sunday of November.
#'     U = unknown. N = no dst.}
#'  \item{tzone}{IANA time zone, as determined by GeoNames webservice.}
#' }
"speaker"

#' Dict
#'
#' Useful metadata about airports.
#'
#' @source <https://openflights.org/data.html>, downloaded 2021-12-17
#' @format A data frame with columns:
#' \describe{
#'  \item{faa}{FAA airport code.}
#'  \item{name}{Usual name of the airport.}
#'  \item{lat, lon}{Location of airport.}
#'  \item{alt}{Altitude, in feet.}
#'  \item{tz}{Timezone offset from GMT.}
#'  \item{dst}{Daylight savings time zone. A = Standard US DST: starts on the
#'     second Sunday of March, ends on the first Sunday of November.
#'     U = unknown. N = no dst.}
#'  \item{tzone}{IANA time zone, as determined by GeoNames webservice.}
#' }
"dict"
