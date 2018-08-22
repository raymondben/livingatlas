## not exported
## define the parameters for each Living Atlas installation

## NOTE: if an installation does not have a particular base_url_*, for now the best option is probably to use the ALA (aus) one.
## base_url_images can be set to NULL or "" though
## TODO: update ALA4R so that if a given base_url is NULL or "", the requesting function fails informatively

## the relevant options here are:

## max_occurrence_records - the maximum number of occurrences that will be returned by the "indexed" method
##  server_max_url_length - in bytes. The Apache default LimitRequestLine value is 8190, so a value of 8150 allows 40 bytes wiggle room. Users will be warned of possible problems when URL exceeds this length
## base_url_spatial - the base url for spatial web services
## base_url_bie - the base url for BIE web services
## base_url_biocache - Services for mapping occurrence data, and species breakdowns for geographic areas
## biocache_version - the version string of the biocache server. Occurrences has different functionality for version > 1.8.1
## base_url_alaspatial - the base url for older ALA spatial services
## base_url_images - the base url for the images database. Set to NULL or empty string if not available
## base_url_logger - the base url for usage logging webservices
## base_url_lists - base url for services for creating & editing lists of taxa

installation_info <- function(installation) {
    out <- list()
    switch(installation,
           au = {
               out$max_occurrence_records <- 500000
               out$server_max_url_length <- 8150
               out$base_url_spatial <- "http://spatial.ala.org.au/ws/"
               out$base_url_bie <- "http://bie.ala.org.au/ws/"
               out$base_url_biocache <- "http://biocache.ala.org.au/ws/"
               out$base_url_biocache_download <- "https://biocache.ala.org.au/biocache-download/"
               out$biocache_version <- "1.8.2"
               out$base_url_alaspatial <- "http://spatial.ala.org.au/alaspatial/ws/"
               out$base_url_images <- "http://images.ala.org.au/"
               out$base_url_logger <- "http://logger.ala.org.au/service/logger/"
               out$base_url_fieldguide <- "http://fieldguide.ala.org.au/"
               out$base_url_lists <- "http://lists.ala.org.au/ws/"
           },
           se = {
               out$max_occurrence_records <- 500000
               out$server_max_url_length <- 8150
               out$base_url_spatial <- "https://spatial.ala.org.au/layers-service/" ## TODO
               out$base_url_bie <- "http://bie.ala.org.au/ws/" ## TODO "https://bioatlas.se/bie/"
               out$base_url_biocache <- "https://bioatlas.se/biocache-service"
               out$biocache_version <- "1.9" # TODO: upgrade
               out$base_url_alaspatial <- "http://spatial.ala.org.au/alaspatial/ws/" ## TODO "https://bioatlas.se/alaspatial/"
               out$base_url_images <- "https://bioatlas.se/images/"
               out$base_url_logger <- "https://bioatlas.se/logger-service/service/logger/"
               out$base_url_fieldguide <- "http://fieldguide.ala.org.au/" ## TODO "https://bioatlas.se/fieldguide/"
               out$base_url_lists <- "http://lists.ala.org.au/ws/" ## TODO "https://bioatlas.se/lists/" # TODO
           },
           uk = {
               out$max_occurrence_records <- 500000
               out$server_max_url_length <- 8150
               out$base_url_spatial <- "https://layers.nbnatlas.org/ws"
               out$base_url_bie <- "https://species-ws.nbnatlas.org/"
               out$base_url_biocache <- "https://records-ws.nbnatlas.org/"
               out$biocache_version <- "1.8.2"
               out$base_url_alaspatial <- "https://layers.nbnatlas.org/alaspatial/ws/"
               out$base_url_images <- "https://images.nbnatlas.org/"
               out$base_url_logger <- "http://logger.ala.org.au/service/logger/"
               out$base_url_lists <- "https://lists.nbnatlas.org/ws"
           },
           stop("unrecognized installation:", installation)
           )
        out
}
