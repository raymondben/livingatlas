Define the parameters for each Living Atlas installation

Each configuration should be in a JSON file called xx.json in the package's inst/configurations directory

NOTE: if an installation does not have a particular base_url_*, for now the best option is probably to use the ALA (aus) one. base_url_images can be set to NULL or "" though
TODO: update ALA4R so that if a given base_url is NULL or "", the requesting function fails informatively

The relevant options that can be set in the JSON file are:

- max_occurrence_records - the maximum number of occurrences that will be returned by the "indexed" method
  server_max_url_length - in bytes. The Apache default LimitRequestLine value is 8190, so a value of 8150 allows 40 bytes wiggle room. Users will be warned of possible problems when URL exceeds this length
- base_url_spatial - the base url for spatial web services
- base_url_bie - the base url for BIE web services
- base_url_biocache - Services for mapping occurrence data, and species breakdowns for geographic areas
- biocache_version - the version string of the biocache server. Occurrences has different functionality for version > 1.8.1
- base_url_alaspatial - the base url for older ALA spatial services
- base_url_images - the base url for the images database. Set to NULL or empty string if not available
- base_url_logger - the base url for usage logging webservices
- base_url_lists - base url for services for creating & editing lists of taxa

Note, when adding a new configuration to this directory you will also need to update the tests (currently in testthat.R, to be moved to testthat/test-installations.R)
