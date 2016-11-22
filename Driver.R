rm(list=ls()) 
#options(warn=-1)
# version
version=1.0

setwd(paste0("C:/Users/beukeshz/Desktop/Price_Tracker",version)) # Set working directory

library(ggplot2)
library(quantmod)
source("Input/param.txt")

# include modules
source("get_yahoo_data.R")
source("process_data.R")




