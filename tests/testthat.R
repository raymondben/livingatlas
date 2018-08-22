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
