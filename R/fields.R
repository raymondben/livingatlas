#' Retrieves a list of all field names that can be used with data retrieval functions
#'
#' Note for occurrence fields: only fields that are indexed in the database can be queried (e.g. used in the \code{fq} parameter in \code{\link{occurrences}}. These fields are identified by the \code{indexed} column in \code{la_fields("occurrence")}. Only fields that are stored in the database can be returned as part of an \code{occurrences} call. These fields are identified by the \code{stored} column in \code{la_fields("occurrence")}. The calling syntaxes \code{la_fields("occurrence_stored")} and \code{la_fields("occurrence_indexed")} are for convenience, and are equivalent to \code{subset(la_fields("occurrence"),stored)} and \code{subset(la_fields("occurrence"),indexed)}.
#' 
#' @seealso \code{\link{search_layers}} to search for spatial layers
#' @param fields_type text: one of the following
#' \itemize{
#' \item "general" - for searching taxa, datasets, layers, and collections metadata
#' \item "occurrence" - for species occurrence records
#' \item "occurrence_stored" - can be returned as part of a species occurrence record search (equivalant to \code{subset(la_fields("occurrences"),stored)})
#' \item "occurrence_indexed" - can be queried as part of a species occurrence record search (equivalant to \code{subset(la_fields("occurrences"),indexed)})
#' \item "layers" - fields associated with the environmental and contextual layers. For additional information 
#' on layers, including metadata and licensing, see \code{\link{search_layers}}
#' \item "assertions" - potential issues flagged on one or more occurrence record fields
#' }
#' @param as_is logical: if TRUE, leave the field names as they are returned from the web service. Arguments that are passed
#' directly to the web services (e.g. parameter \code{fq} in \code{\link{occurrences}}) should use field names in this format. If \code{as_is} is FALSE, the returned $names entries will be modified to make them consistent with the corresponding column names in R data.frames returned by e.g. \code{\link{occurrences}}. \code{as_is=FALSE} has no effect when \code{fields_type} is "layers". Note that prior to v1.20, \code{as_is=FALSE} did not work correctly. 
#' @param field_id text: id of environmental/contextual layer field for which to look up information
#' Prepend "el" for "environmental" (gridded) layers and "cl" for "contextual" (polygonal) layers
#' @param maxrows integer: maximum number of records to download. Some contextual layers (those with \code{field_id}s starting with "cl") have a very large number of records and attempting to download the full set can cause R to crash. Specifying -1 for maxrows will download the full set of records for that field
#' @param record_count_only logical: if TRUE, return just the count of records that would be downloaded, but don't download them. This really only makes sense for contextual layers, because environmental layers have only one record per layer
#' @return If \code{record_count_only} is TRUE, the number of records is returned as numeric. Otherwise, a data frame containing the field name and various attributes; an empty data frame is returned if no match is found
#' @examples
#' \dontrun{
#'  l <- la_fields("layers")
#'  l[,4]
#'  o <- la_fields("occurrence")
#'  o[1:13,]
#'  a <- la_fields("assertions")
#'  a$description
#'  la_field_info("cl22")
#'  la_field_info("el773")
#' }
#' @export

la_fields <- function(fields_type, as_is = TRUE) {
  ALA4R::ala_fields(fields_type = fields_type, as_is = as_is)
}

#' @rdname la_fields
#' @export
la_field_info  <-  function(field_id, maxrows = 50, record_count_only = FALSE) {
  ALA4R::field_info(field_id, maxrows = maxrows, record_count_only = record_count_only)
}
