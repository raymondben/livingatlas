library(testthat)
library(livingatlases)

## run each test with and without caching
check_caching <- function(f) {
    la_config(caching = "off")
    f()
    la_config(caching = "on")
    f()
    f()
}

## EARLY DEVELOPMENT, no testing yet
#test_check("livingatlas")

## temporarily run some tests here, to be migrated into the testthat/ directory later

context("Test installation json files")
test_that("Installation json files are present and valid", {
    expected_insts <- c("uk", "au", "se")
    d <- dir(system.file("configurations", package = "livingatlases"), full.names = TRUE)
    d <- d[grepl("\\.json$", d)]
    if (length(d) < 1) stop("no installation configuration JSON files found")
    expect_that(length(d) == length(expected_insts))
    expect_identical(sort(sub("\\.json$", "", basename(d))), sort(expected_insts))
    for (cf in d) {
        blah <- jsonlite::fromJSON(cf)
    }
})
