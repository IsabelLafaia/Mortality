##
##  WHO Mortality data: Download the all the data from the zip files
##

# Load libraries
library(rvest)
library(RCurl)
library(stringr)
library(dplyr)
library(XML)
library(tibble)

# URL of the data to be downloaded
wmdat.url <- "http://www.who.int/healthinfo/statistics/mortality_rawdata/en"

# Directory where the downloaded data will be stored.
dldir <- paste0(getwd(), "/WHOdata/")

##
## Method 2: Using the XML library 
##
getDat <- getHTMLLinks(wmdat.url, relative = TRUE) %>%
        as_tibble() %>%
        filter(grepl(".zip", value)) %>%
        rename(dlfile = value) %>%
        mutate(destfile = paste0(dldir, (gsub(".*/([^/]*)$", "\\1", dlfile)))) %>%
        mutate(wait = sample(seq(3, 12, 0.1), n(), replace=TRUE))


for(i in 1:dim(getDat)[1]){
        download.file(getDat$dlfile[i], getDat$destfile[i])
        unzip(getDat$destfile[i], exdir = "WHOdata/")
        print(paste0(getDat$destfile[i], " - Waiting ", getDat$wait[i], " seconds...\n"))
        Sys.sleep(getDat$wait[i])
}