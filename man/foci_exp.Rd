% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{foci_exp}
\alias{foci_exp}
\title{Foci task (expanded)}
\format{
A data frame with columns:
\describe{
\item{lang_nr}{WCS Language Number: values from 1 to 110}
\item{speaker_nr}{Unique number of speakers per language}
\item{focus_response}{Sequential enumeration of focus responses}
\item{term_abb}{A unique abbreviation of the term}
\item{grid_coord}{Concatenation of grid_row and grid_col}
}
}
\source{
\url{https://www1.icsi.berkeley.edu/wcs/data/20030414/txt/foci-exp.txt}, downloaded 2021-12-17
}
\usage{
foci_exp
}
\description{
WCS focus task responses, all chip ranges are expanded, with a single chip per line.
}
\keyword{datasets}
