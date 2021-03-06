context("Test list-related functions")

thischeck=function() {
    test_that("nbn_lists does stuff", {
        skip_on_cran()
        all_lists <- nbn_lists()
        expect_is(all_lists,"data.frame")
        expect_true(all(c("dataResourceUid","listName","listType") %in% names(all_lists)))
        ## should be a few Field Guide lists? not in NBN?
        #expect_gt(nrow(all_lists[grep("Field Guide",all_lists$listName),]),1)
        
        l <- nbn_lists(search_names("Lutra lutra")$guid)
        ## these names (with guid supplied) are different to the case when no guid is supplied
        expect_equal(names(l),c("dataResourceUid","guid","list","kvpValues"))        
    })
}
check_caching(thischeck)


thischeck=function() {
    test_that("nbn_list does stuff", {
        ## skip this one temporarily
        skip("skipping vertebrates field guide test temporarily: something wrong in list content preventing parsing") 
        skip_on_cran()
        ## download the vertebrates field guide
        l <- nbn_list(druid="dr1146")
        expect_is(l,"data.frame")
        expect_named(l,c("id","name","commonName","scientificName","lsid","kvpValues"))
        expect_is(l$kvpValues,"list")
        expect_named(l$kvpValues[[1]],c("key","value"))
    })
}
check_caching(thischeck)

thischeck = function() {
  test_that("nbn_list & nbn_lists arguments in NBN4R package match arguments in ALA4R package", {
    expect_named(formals(nbn_list),names(formals(ALA4R::ala_list)),ignore.order = TRUE)
    expect_named(formals(nbn_lists),names(formals(ALA4R::ala_lists)),ignore.order = TRUE)
  })
}
check_caching(thischeck)
