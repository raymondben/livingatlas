
#' Species lists
#'
#' Note that this refers to pre-generated lists of species stored on Living Atlas servers. The similarly-named but different function \code{\link{la_specieslist}} provides a different function, namely listing the species matching a query or recorded as present in a search area.
#'
#' @param druid string: data resource UID of the list (i.e. the list identifier)
#' @param kvp logical: include key-value pairs? Some lists contain information about the species in the form of key-value pairs
#' @param verbose logical: show additional progress information? 
#'
#' @return data.frame
#'
#' @seealso \code{\link{la_specieslist}}, \code{\link{la_lists}}
#'
#' @examples
#' \dontrun{
#'  la_config(installation = "au")
#'  all_lists <- la_lists()
#'  ## find the "Field Guide apps species profiles" from Museum Victoria
#'  all_lists[grep("Field Guide", all_lists$listName), ]
#'  ## download the vertebrates one
#'  l <- la_list(druid = "dr1146")
#' }
#'
#' @export
la_list <- function(druid, kvp = TRUE, verbose = la_config()$verbose){
  ALA4R::ala_list(druid = druid, kvp = kvp, verbose = verbose)
}


#' Find species lists
#'
#' @param guid string: (optional) if provided, return only lists in which this GUID appears
#' @param offset integer: the number of lists to skip. This supports paging
#' @param max integer: the maximum number of lists to return. This supports paging
#' @param verbose logical: show additional progress information?
#'
#' @return data.frame of list name and other details
#'
#' @seealso \code{\link{la_list}}
#'
#' @examples
#' \dontrun{
#'  la_config(installation = "au")
#'  ## lists that include the giant African snail Achatina fulica
#'  ##  (which is a notifiable pest species in some states)
#'  l <- la_lists(search_guids("Achatina fulica")$guid)
#' }
#'
#' @export
la_lists <- function(guid, offset = 0, max = 500, verbose = la_config()$verbose) {
 ALA4R::ala_lists(guid = guid, offset = offset, max = max, verbose = verbose)
}
