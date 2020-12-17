# Zainab Sherani
# INST 462 - Putting together all cleaned datasets and recode all variables

setwd("/Users/zainabsherani/Desktop/INST462 - Final Project/")
br11 <- read.csv("2011cleaned.csv")
br12 <- read.csv("2012cleaned.csv")
br13 <- read.csv("2013cleaned.csv")
br14 <- read.csv("2014cleaned.csv")
br15 <- read.csv("2015cleaned.csv")
br <- rbind(br11, br12, br13, br14, br15)

#write.csv(br, "/Users/zainabsherani/Desktop/INST462 - Final Project/MasterDataset.csv")

View(br11)
br11_test <- filter(br11, br11$X_STATE == 24)
View(br11_test)