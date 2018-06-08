library(acs)
library(devtools)
library(roxygen2)
floridaCountyMarital <- acs.fetch(endyear = 2016,
                               geography = geo.make(state = "FL", county = "*"),
                               variable = acs.lookup(endyear = 2015,
                                                     table.number = "B12002",
                                                     dataset = "acs"),
                               dataset = "acs",
                               col.names = "pretty")
print(floridaCountyMarital@geography$NAME)

#devtools::use_data(floridaCountyMarital)
