#' Check assertions in an occurrences object
#'
#' This provides a data.frame detailing the assertions that are found in a dataset returned from \code{\link{la_occurrences}}.
#'
#' @param x list: an object returned from \code{\link{la_occurrences}}
#'
#' @return A dataframe of assertions column names, descriptions and categories/error codes. If no assertions are in the dataset, NULL is returned.
#'
#' @examples
#' \dontrun{
#'  ## download species data with all possible assertions
#'  x <- la_occurrences(taxon = "golden plover", download_reason_id = 10,
#'     qa = la_fields("assertions")$name)
#'
#'  asserts <- check_assertions(x)
#'  ## data.frame of assertions, their description and column names
#'
#'  ## get descriptions of all (current) assertions
#'  asserts$description
#'
#'  ## extract the assertion columns from the data
#'  tmp <- x$data[, names(x$data) %in% asserts$name]
#'
#'  ## discard those not seen in the data
#'  which(colSums(tmp)>0)
#' }
#' @export
la_check_assertions <- function(x) {
  ALA4R::check_assertions(x)
}
