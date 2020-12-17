# Zainab Sherani
# Data Cleaning

setwd("/Users/zainabsherani/Desktop/INST462 - Final Project/")
br_original <- read.csv("2012.csv")

# filter for 11 (D.C), 24 (Maryland) and 51 (Virginia)
# we need an integer but X_STATE column is double. first convert to integer
br_original$X_STATE <- as.integer(br_original$X_STATE) 
br <- filter(br_original, br_original$X_STATE == 24 | br_original$X_STATE == 11 | br_original$X_STATE == 51)

# filter for 1 (male) and 2 (female) who are 18 years or older 
br <- filter(br, br$CADULT== 1 | br$CADULT== 2)

# filter for 2015 year only
br <- filter(br, br$IYEAR == "b'2012'") 

# change refuse (9) to NA 
br$GENHLTH[br$GENHLTH == 9] <- NA
br$HLTHPLN1[br$HLTHPLN1 == 9] <- NA
br$MEDCOST[br$MEDCOST == 9] <- NA
br$CHECKUP1[br$CHECKUP1 == 9] <- NA
br$CHCOCNCR[br$CHCOCNCR == 9] <- NA
br$ADDEPEV2[br$ADDEPEV2 == 9] <- NA
br$EDUCA[br$EDUCA == 9] <- NA
br$X_SMOKER3[br$X_SMOKER3 == 9] <- NA
br$EXERANY2[br$EXERANY2 == 9] <- NA

# rename EMPLOY column to EMPLOY1 like the rest of the columns
colnames(br)[colnames(br) == "EMPLOY"] <- "EMPLOY1"
br$EMPLOY1[br$EMPLOY1 == 9] <- NA

# change values in INCOME2 with 99 (Refused) to NA
br$INCOME2[br$INCOME2 == 99] <- NA

# filter those who have/ do not have diabetes. 1 (yes), 3 (no), 4 (pre-diabetic), 7 (Don't know/ Not sure)
br <- filter(br, br$DIABETE3 == 1 | br$DIABETE3 == 3 |  br$DIABETE3 == 4 | br$DIABETE3 == 7)

br15 <- subset(br, select = c("X_STATE", "IYEAR", "CADULT", "GENHLTH", "HLTHPLN1", 
                              "MEDCOST", "CHECKUP1", "CHCOCNCR", "ADDEPEV2", 
                              "EDUCA", "EMPLOY1", "X_BMI5CAT", "X_SMOKER3", "EXERANY2", "DRNK3GE5",
                              "INCOME2", "DIABETE3", "DIABAGE2"))

br <- br15
br$X_STATE[br$X_STATE == 11] <- "DC"
br$X_STATE[br$X_STATE == 24] <- "Maryland"
br$X_STATE[br$X_STATE == 51] <- "Virginia"

br$CADULT[br$CADULT== 1] <- "Male"
br$CADULT[br$CADULT== 2] <- "Female"

br$GENHLTH[br$GENHLTH == 1] <- "Excellent"
br$GENHLTH[br$GENHLTH == 2] <- "Very good"
br$GENHLTH[br$GENHLTH == 3] <- "Good"
br$GENHLTH[br$GENHLTH == 4] <- "Fair"
br$GENHLTH[br$GENHLTH == 5] <- "Poor"
br$GENHLTH[br$GENHLTH == 7] <- "Don't know/ Not sure"

br$INCOME2[br$INCOME2 == 77] <- "Don't Know/ Not sure"

br$HLTHPLN1[br$HLTHPLN1 == 1] <- "Yes"
br$HLTHPLN1[br$HLTHPLN1 == 2] <- "No"
br$HLTHPLN1[br$HLTHPLN1 == 7] <- "Don't know/ Not sure"

br$MEDCOST[br$MEDCOST == 1] <- "Yes"
br$MEDCOST[br$MEDCOST == 2] <- "No"
br$MEDCOST[br$MEDCOST == 7] <- "Don't know/ Not sure"

br$CHECKUP1[br$CHECKUP1 == 1] <- "Within past year (anytime less than 12 months ago)"
br$CHECKUP1[br$CHECKUP1 == 2] <- "Within past 2 years (1 year but less than 2 years ago)"
br$CHECKUP1[br$CHECKUP1 == 3] <- "Within past 5 years (2 years but less than 5 years ago)"
br$CHECKUP1[br$CHECKUP1 == 4] <- "5 or more years ago"
br$CHECKUP1[br$CHECKUP1 == 7] <- "Don’t know/Not sure"
br$CHECKUP1[br$CHECKUP1 == 8] <- "Never"

br$CHCOCNCR[br$CHCOCNCR == 1] <- "Yes"
br$CHCOCNCR[br$CHCOCNCR == 2] <- "No"
br$CHCOCNCR[br$CHCOCNCR == 7] <- "Don’t know/Not sure"

br$ADDEPEV2[br$ADDEPEV2 == 1] <- "Yes"
br$ADDEPEV2[br$ADDEPEV2 == 2] <- "No"
br$ADDEPEV2[br$ADDEPEV2 == 7] <- "Don’t know/Not sure"

br$X_SMOKER3[br$X_SMOKER3 == 1] <- "Current smoker - now smokes every day"
br$X_SMOKER3[br$X_SMOKER3 == 2] <- "Current smoker - now smokes some days"
br$X_SMOKER3[br$X_SMOKER3 == 3] <- "Former smoker"
br$X_SMOKER3[br$X_SMOKER3 == 4] <- "Never smoked"

br$DIABETE3[br$DIABETE3 == 1] <- "Yes"
br$DIABETE3[br$DIABETE3 == 3] <- "No"
br$DIABETE3[br$DIABETE3 == 4] <- "No, pre-diabetes or borderline diabetes"
br$DIABETE3[br$DIABETE3 == 7] <- "Don’t know/Not Sure"

br$EDUCA[br$EDUCA == 1] <- "Never attended school or only kindergarten"
br$EDUCA[br$EDUCA == 2] <- "Grades 1 through 8 (Elementary)"
br$EDUCA[br$EDUCA == 3] <- "Grades 9 through 11 (Some high school) "
br$EDUCA[br$EDUCA == 4] <- "Grade 12 or GED (High school graduate)"
br$EDUCA[br$EDUCA == 5] <- "College 1 year to 3 years (Some college or technical school)"
br$EDUCA[br$EDUCA == 6] <- "College 4 years or more (College graduate)"

br$EMPLOY1[br$EMPLOY1 == 1] <- "Employed for wages"
br$EMPLOY1[br$EMPLOY1 == 2] <- "Self-employed"
br$EMPLOY1[br$EMPLOY1 == 3] <- "Out of work for 1 year or more"
br$EMPLOY1[br$EMPLOY1 == 4] <- "Out of work for less than 1 year"
br$EMPLOY1[br$EMPLOY1 == 5] <- "A homemaker"
br$EMPLOY1[br$EMPLOY1 == 6] <- "A student"
br$EMPLOY1[br$EMPLOY1 == 7] <- "Retired"
br$EMPLOY1[br$EMPLOY1 == 8] <- "Unable to work"

br$INCOME2[br$INCOME2 == 1] <- "Less than $10,000"
br$INCOME2[br$INCOME2 == 2] <- "Less than $15,000 ($10,000 to less than $15,000)"
br$INCOME2[br$INCOME2 == 3] <- "Less than $20,000 ($15,000 to less than $20,000)"
br$INCOME2[br$INCOME2 == 4] <- "Less than $25,000 ($20,000 to less than $25,000)"
br$INCOME2[br$INCOME2 == 5] <- "Less than $35,000 ($25,000 to less than $35,000)"
br$INCOME2[br$INCOME2 == 6] <- "Less than $50,000 ($35,000 to less than $50,000)"
br$INCOME2[br$INCOME2 == 7] <- "Less than $75,000 ($50,000 to less than $75,000)"
br$INCOME2[br$INCOME2 == 8] <- "$75,000 or more"

br$X_BMI5CAT[br$X_BMI5CAT == 1] <- "Underweight"
br$X_BMI5CAT[br$X_BMI5CAT == 2] <- "Normal Weight"
br$X_BMI5CAT[br$X_BMI5CAT == 3] <- "Overweight"
br$X_BMI5CAT[br$X_BMI5CAT == 4] <- "Obese"

br$EXERANY2[br$EXERANY2 == 1] <- "Yes"
br$EXERANY2[br$EXERANY2 == 2] <- "No"
br$EXERANY2[br$EXERANY2 == 7] <- "Don’t know/Not Sure"

write.csv(br, "/Users/zainabsherani/Desktop/INST462 - Final Project/2012cleaned.csv")

