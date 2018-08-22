<!-- [![Travis-CI Build Status](https://travis-ci.org/raymondben/livingatlases.svg?branch=master)](https://travis-ci.org/raymondben/livingatlases)
[![Build status](https://ci.appveyor.com/api/projects/status/qwskau4m0q5gcewa/branch/master?svg=true)](https://ci.appveyor.com/project/raymondben/nbn4r-5uu46/branch/master)
[![codecov](https://codecov.io/gh/raymondben/livingatlases/branch/master/graph/badge.svg)](https://codecov.io/gh/raymondben/livingatlases) -->

# livingatlases

An R package that provides access to data from [Living Atlases](https://living-atlases.gbif.org/) servers.


On startup the package is configured to access data from the [Atlas of Living Australia](https://ala.org.au). Users can direct the package to use data from other installations, e.g. the UK's [National Biodiversity Network](https://nbnatlas.org/):

```{r eval = FALSE}
library(livingatlases)
la_config(installation = "uk")
```

See `help("la_config")` for more information.
