#' Get or set configuration options that control livingatlases behaviour
#'
#' Invoking \code{la_config()} with no arguments returns a list with the current values of the options.
#'
#' \code{la_reasons()} returns a data frame with information describing the valid options for \code{download_reason_id}
#'
#' @param \dots Options can be defined using name = value. Valid options are:
#' \itemize{
#'   \item reset: \code{la_config("reset")} will reset the options to their default values
#'   \item installation string: defines the Living Atlases installation that the package will be retrieving data from. By default this is the Atlas of Living Australia (\code{installation = "au"}). Valid values are currently:
#'   \itemize{
#'     \item "au": Atlas of Living Australia (\url{https://ala.org.au})
#'     \item "se": Biodiversity Atlas Sweden (\url{https://bioatlas.se})
#'     \item "uk": UK's National Biodiversity Network (\url{https://nbnatlas.org/})
#'   }
#'   Alternatively, if the installation to be used is not currently defined in this package, the installation configuration details can be provided as a list object. Inspect the source code for hints
#'   \item caching string: caching can be
#'     "on" (results will be cached, and any cached results will be re-used),
#'     "refresh" (cached results will be refreshed and the new results stored in the cache), or
#'     "off" (no caching, default).
#'   \item cache_directory string: the directory to use for the cache.
#'     By default this is a temporary directory, which means that results will only be cached
#'     within an R session and cleared automatically when the user exits R. The user may wish to set this to a non-temporary directory for
#'     caching across sessions. The directory must exist on the file system.
#'   \item verbose logical: should verbose output be given to assist debugging?  (default=FALSE)
#'   \item warn_on_empty logical: should a warning be issued if a request returns an empty result set? (default=FALSE)
#'   \item user_agent string: the user-agent string used with all web requests to the Living Atlases servers
#'     Default = "livingatlases" with version number
#'   \item text_encoding string: text encoding assumed when reading cached files from local disk (default="UTF-8")
#'   \item download_reason_id numeric or string: the "download reason" required by some services, either as a numeric ID (currently 0--11)
#'   or a string (see \code{nbn_reasons()} for a list of valid ID codes and names). By default this is NA. Some services require a valid
#'   download_reason_id code, either specified here or directly to the associated R function.
#' }
#'
#' @return For la_config(), a list of all options. When la_config(...) is
#' called with arguments, nothing is returned but the configuration is set.
#'
#' @examples
#' \dontrun{
#'  la_config()
#'  la_config(caching = "off")
#'  la_config()
#'  la_config(download_reason_id = 0, verbose = TRUE)
#'  la_config("reset")
#' }
#' @export
la_config <- function(...) {
    z <- list(...)
    if ("installation" %in% names(z)) {
        if (is.character(z$installation)) {
            assert_that(is.string(z$installation))
            ## expect configuration to be in a file called xx.json in the package's inst/configurations directory
            cfile <- system.file("configurations", paste0(z$installation, ".json"), package = "livingatlases")
            if (!nzchar(cfile)) {
                ## file not found
                stop("no configuration information was found for installation = \"", z$installation, "\"")
            }
            tryCatch(new_info <- jsonlite::fromJSON(cfile), error = function(e) stop("could not read configuration for installation \"", z$installation, "\": is the json file present in and valid?"))
        } else {
            ## installation details may have been provided as a list
            stop("direct installation configuration not coded yet")
            ## todo: construct the new_info list here
        }
        temp <- getOption("ALA4R_server_config")
        temp <- list(new_info, temp[!names(temp) %in% names(new_info)])
        options(ALA4R_server_config = temp)
        z <- z[setdiff(names(z), "installation")]
        if (length(z) < 1) return(NULL) ## nothing else to do, return NULL
    }
    do.call(ALA4R::ala_config, z)
}

#' @rdname la_config
#' @export
la_reasons <- function() {
  ALA4R::ala_reasons()
}
