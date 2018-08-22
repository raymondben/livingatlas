.onLoad <- function(libname, pkgname) {
    ## override some ALA4R settings on startup
    ## these are package-specific, not server-specific, so don't need to also be updated in installation_configurations.R
    
    ## start with the default server config from ALA4R package
    temp <- getOption("ALA4R_server_config")
    temp$brand <- "livingatlases" ## the package name that is shown to users in messages and warnings
    temp$notify <- "If this problem persists please notify the livingatlases maintainers by lodging an issue at the livingatlases github repo or emailing support@ala.org.au" ## the string that will be displayed to users to notify the package maintainers
    temp$reasons_function = "la_reasons" ## the ala_reasons or equivalent function name
    temp$fields_function = "la_fields" ## the nbn_fields or equivalent function name
    temp$occurrences_function = "la_occurrences" ## the occurrences or equivalent function name
    temp$config_function = "la_config" ## the ala_config or equivalent function name

    options(ALA4R_server_config = temp)
}


