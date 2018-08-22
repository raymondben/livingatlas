#' Generate a PDF field guide using the Living Atlas field guide generator
#'
#' @param guids character: vector of GUIDs
#' @param title string: title to use in the field guide PDF
#' @param filename string: filename for the PDF document
#' @param overwrite logical: overwrite the file if it already exists?
#'
#' @return filename
#'
#' @seealso \code{\link{la_search_guids}}
#'
#' @examples
#' \dontrun{
#' la_fieldguide(guids =
#'   c("urn:lsid:biodiversity.org.au:afd.taxon:95773568-053d-44de-a624-5699f0ac4a59",
#'   "http://id.biodiversity.org.au/node/apni/2890970"))
#' }
#'
# @export
la_fieldguide <- function(guids, title = "Field guide", filename = tempfile(fileext = ".pdf"), overwrite = FALSE) {
  ALA4R::fieldguide(guids, title, filename, overwrite) 
}
