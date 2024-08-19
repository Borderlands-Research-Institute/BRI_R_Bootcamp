###--------------------------------------###
### Automatic GPS and Map Udpates: v 2.0 ###
###    Created: 2020-04-30               ###
###    Updated: 2020-10-27               ###
###    - Updated automation              ###
###      process                         ###
###    Updated: 2020-11-20               ###
###    - Scheduled to generate reports   ###
###      on the 1st of the month, not    ###
###      weekly                          ###
###    Updated:2021-03-18                ###
###    - Split the report update and     ###
###      email to separate script to     ###
###      make updates simpler            ###
###    Major Update: 2022-06-12          ###
###    - Revised to eliminate FMP from   ###
###      workflow, transition to         ###
###      PostgreSQL/PostGIS              ###
###    - Revised logging procedure       ###
###                                      ###
###    Author: Justin French             ###
###--------------------------------------###
### This script automates the process of ###
### updating the big_game GPS table, GIS ### 
### files, maps, and reports for active  ###
### collars.                             ###
###--------------------------------------###



### Set WD ###--------------------------------------

setwd('B:/')

### Set automation (added 2020-10-27) %%%-----------

  ### Included for maintenance purposes, not needed for regular use ###

# library(taskscheduleR)
# job <- file.path(getwd(),"scripts/automateR1.R")
# taskscheduler_create(taskname = "automate1", rscript = job,
#                      schedule = "DAILY", starttime = "01:00", 
#                      startdate = format(Sys.Date()+1, "%m/%d/%Y"))

### Get Packages ###--------------------------------

  ipak <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg)) 
      install.packages(new.pkg, dependencies = TRUE)
    sapply(pkg, require, character.only = TRUE)
  }

  packages <- c('knitr','lubridate','mailR')

  ipak(packages)
  
  
### Get New Data ###--------------------------------

  source('scripts/dataWrangler.R')
    
### Update GPS Shapefiles ###-------------------

  source('scripts/dataMapper.R')

### Update Reports ###--------------------------

  source('scripts/reportUpdate.R')
  
### Leave a paper-trail ###------------------------------
  
  source('scripts/logUpdate.R')

    