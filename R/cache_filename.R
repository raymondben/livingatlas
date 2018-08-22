#' Returns the name of the cache file associated with the given URL. Note that this file 
#' may not actually exist, this function just provides the mapping from URL to filename
#'
#' @seealso \code{la_config} for cache settings, particularly the cache directory
#'
#' @param url string: the URL
#' @return string: the file path and name
#'
#' @examples
#' la_cache_filename("https://records-ws.nbnatlas.org/index/fields")
#'
#' @export
la_cache_filename <- function(url){
  ALA4R::ala_cache_filename(url)
}
