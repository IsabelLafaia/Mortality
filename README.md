# Mortality

The data that I am referring to can be found at:

  - http://www.who.int/healthinfo/mortality_data/en/

The "Access the online database" link i their app. Have a quick look at it (5 to 10 minute max) and you will see why there is a need for something better. The "Query the online database" link is their "user friendly" access to their data which is anything but user friendly. You will also see the link to download the data.

Your first task will be to write an R program to download the data. Call the function something like "getWHOdata". All the files are zip compressed so that should make it easier to select. The function arguments should be

  - "dir" the directory to download the files to where the (perhaps the default can be the current working directory)
  - "unzip=TRUE" the download files should be unzipped by default. 
