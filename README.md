# wcs

## Overview

This package contains a tidied version of each data table of the [World Color Survey](https://www1.icsi.berkeley.edu/wcs/). In the WCS investigation, initiated by Berlin and Kay, an average of 24 native speakers of each of 110 unwritten languages were asked 

1. to name each of 330 Munsell chips, shown in a constant, random order, and 
2. exposed to a palette of these chips and asked to to pick out the best example(s) ("foci") of the major terms elicited in the naming task.

The results are publically availaible in an online [archive](https://www1.icsi.berkeley.edu/wcs/data.html).
The package makes available a tidied version of the following files:

* `?term`: data for the WCS naming task (chip responses)
* `?focus_exp`: WCS focus task responses, all chip ranges are expanded, with a single chip per line
* `?chip`: Chip numbers and grid coordinates for the Munsell chart
* `?dict`: dictionary file to lookup term number and the corresponding term and abbreviaton for each language
* `?lang`: information on the WCS language names, including origin and ISO 693-3 codes
* `?mun_2_lab`: mapping table for Munsell Value, Chroma & Hue values to the CIELAB color space
* `?speaker`: information on each speaker of WCS, including age and sex

To gain an inside behind the reasoning of the tidying process, see the corresponding script in [jvosten/tidy_wcs](https://github.com/jvosten/tidy_wcs/blob/master/scripts/tidying_wcs_exp.R)

## Installation

wcs can be installed from CRAN with:

```r
remotes::install_github("jvosten/wcs")
```

## Examples

To obtain a merged data set for both of the above cited tasks 1 & 2 (term and foci task), the package addionally to the data, contains two functions for merging:

```r
term_task()
```
merges the term data frame with all dictionary data frames.

```r
foci_task()
```
merges the foci data frame with all dictionary data frames.
