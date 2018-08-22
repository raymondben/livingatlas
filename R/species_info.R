#' Fetch a taxon profile given a scientific name or LSID (GUID)
#'
#' @param scientificname string: scientific name of the taxon of interest (species, genus, family etc)
#' @param guid string: The Life Science Identifier of the taxon of interest
#' @param verbose logical: show additional progress information? [default is set by nbn_config()]
#' @return A species profile in the form of a named list, each element of which is generally a data frame. An empty list is returned if no match is found for the supplied name or guid
#' @seealso \code{\link{la_config}}
#' @examples
#' \dontrun{
#'  la_config(installation = "uk")
#'  la_species_info("Diatoma tenuis")
#'  la_species_info(guid="NHMSYS0000080188")
#'  la_species_info("Diatoma", verbose = TRUE)
#' }
#' @export
la_species_info <- function(scientificname, guid, verbose = la_config()$verbose) {
    ALA4R::species_info(scientificname = scientificname, guid = guid, verbose = verbose)
}
