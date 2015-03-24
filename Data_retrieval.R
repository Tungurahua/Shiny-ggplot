library(RJSDMX)
library(dplyr)
library(reshape2)

census1 <- getSDMX("EUROSTAT",id = "demo_pjan.A.TOTAL.T.")
census2 <- sdmxdf(census1, meta = T)

census3 <- 
  census2 %>%
  filter(grepl("\\b[[:alpha:]]{2}\\b",GEO)) %>%
  filter(GEO %in% c("AT", "BE", "BG", "CY", "CZ", "DK", "EE", "FI", "FR", "DE", "EL", "HU","HR", "IE", "IT", "LV", "LT", "LU", "MT", "NL", "PL", "PT", "RO", "SK", "SI", "ES", "SE", "UK")) %>%
  select(GEO,TIME,OBS) %>%
  mutate(OBS=round(OBS/1000000,2)) %>%
  droplevels()


census <- dcast(census3,TIME~GEO,value.var = "OBS")
head(census)
str(census)
