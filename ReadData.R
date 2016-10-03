##  Program: readWHOdat.R
##   Author: S. Bashir
## Function: Automatically read in the all the datasets in the WHO database

# Load libraries
library(stringr)
library(readr)
library(tibble)

# Set the directory where you have saved the data.
setwd("WHOdata/")

# Select the data files (exclude .zip, .doc, .xls)
csvWHO <- list.files(path=".", full.names = FALSE) %>%
        str_subset("^((?!zip|doc|xls).)*$")

# Use the lapply to read all the data into one list
dataList <- lapply(csvWHO, read_csv, guess_max = min(300000, Inf))

# Extract the data into data.frames (tbl) but start by giving them the dataest you want.
# I convert them to lower case as they are not consistent in the original.
names(dataList) <- str_to_lower(csvWHO) 
list2env(dataList, envir=.GlobalEnv)

# dataList is not longer needed so we will remove it.
rm(dataList)

# Some garbage collection to free up the memory (although this is something that is
# automatically by kernel). In future we may not need this step.
gc()

# Issue with morticd7 for columns Deaths24 and Deaths25 as both are character and not
# not numeric. They are all NA values as they might not have been collected or there
# were not any deaths observed in those age groups.
spec(morticd7)
