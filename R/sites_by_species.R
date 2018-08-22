#' Sites by species
#' 
#' A data.frame is returned as grid cells by species with values in each cell being the number of occurrences of each species. No null (all zero) species should be returned. The coordinates returned are the TOP-LEFT corner of the grid cell.
#'
#' @references \url{http://www.geoapi.org/3.0/javadoc/org/opengis/referencing/doc-files/WKT.html}
#'
#' @param taxon string: the identifier to get the species data from the biocache. E.g. "genus:Macropus". See \code{la_fields("occurrence_stored")} for valid field names
#' @param wkt string: Bounding area in Well Known Text (WKT) format. E.g. "POLYGON((-3 56,-4 56,-4 57,-3 57,-3 56))".
#' @param gridsize numeric: size of output grid cells in decimal degrees. E.g. 0.1 (=~10km)
#' @param SPdata.frame logical: should the output be returned as a SpatialPointsDataFrame of the sp package?
#' @param verbose logical: show additional progress information? [default is set by la_config()]
#' @return A data.frame or a SpatialPointsDataFrame containing the species by sites data. Columns will include longitude, latitude, and each species present. Values for species are record counts (i.e. number of recorded occurrences of that taxon in each grid cell). The \code{guid} attribute of the data frame gives the guids of the species (columns) as a named character vector
#'
#' @examples
#' \dontrun{
#' la_config(installation = "uk")
#' ## Otters in Scotland based on a 0.1 degree grid
#' ss <- sites_by_species(taxon="genus:Leutra", wkt = "POLYGON((-3 56,-4 56,-4 57,-3 57,-3 56))",
#'     gridsize = 0.1, verbose = TRUE)
#' head(ss[,1:6])
#'
#' ## get the guid of the first species (which is the third column of the data frame, since the
#' ##  first two columns are longitude and latitude)
#' attr(ss,"guid")[1]
#' }
#' @export
la_sites_by_species <- function(taxon, wkt, gridsize = 0.1, SPdata.frame = FALSE, verbose = la_config()$verbose) {
    ALA4R::sites_by_species(taxon = taxon, wkt = wkt, gridsize = gridsize, SPdata.frame = SPdata.frame, verbose = verbose)
}
