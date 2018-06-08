#' usaPlaces2010 - Data frame with all the Census Defined Places in the USA
#'
#' @description
#' These are all the places in the USA. Be aware that the place numbers are not unique even within a state.
#'
#' @usage data(usaPlaces2010)
#'
#' @format Data frame with 41414 observations and 7 variables:
#' \describe{
#'   \item{STATE}{State postal code}
#'   \item{STATEFP}{State FIPS code}
#'   \item{PLACEFP}{Place or county subdivision FIPS code}
#'   \item{PLACENAME}{Place or county subdivision name and legal/statistical area description}
#'   \item{TYPE}{Type of place or county subdivision}
#'   \item{FUNCSTAT}{Functional status. Permitted values:
#'     \itemize{
#'     \item{A: }{identifies an active government providing primary general-purpose functions}
#'     \item{B: }{identifies an active government that is partially consolidated with another government but with separate officials providing primary general-purpose functions }
#'     \item{C: }{identifies an active government consolidated with another government with a single set of officials }
#'     \item{F: }{identifies a fictitious entity created to fill the Census Bureau's geographic hierarchy}
#'     \item{G: }{identifies an active government that is subordinate to another unit of government}
#'     \item{I: }{identifies an inactive governmental unit that has the power to provide primary special-purpose functions }
#'     \item{N: }{identifies a nonfunctioning legal entity}
#'     \item{S: }{identifies a statistical entity}
#'     }
#'   }
#'   \item{COUNTY}{County or counties in which the place or county subdivision is located}
#'   }
#'
#' @source \href{https://www.census.gov/geo/reference/codes/place.html}{www.census.gov/geo/reference/codes/place} download United States
"usaPlaces2010"

