# loading libraries
library(dplyr)
library(randomForest)
library(rpart)
library(rpart.plot)

# loading data
dfSurvey <- read.csv("data_new.csv")

# removing case number column
dfSurvey[,1] <- NULL

# closer inspection shows that $Support_type, $Platforms, $Attendance_reason and $Participation are (partly) open questions, for now these columns are removed
dfSurvey$Support_type <- NULL
dfSurvey$Platforms <- NULL
dfSurvey$Attendance_reason <- NULL
dfSurvey$Participation <- NULL

# converting non ordinal columns to factor
dfSurvey[,c(2:6, 9, 11, 28, 40)] <- lapply(dfSurvey[,c(2:7, 10, 11, 28, 40)], as.factor)

# converting ordinal columns to factor and assigning ordinal ranking
# Age_group
dfSurvey$Age_group <- factor(dfSurvey$Age_group, levels = c("Very Young Learners (aged 3-6 yrs)", "Young Students upto Class V (aged 6-11 yrs)", "Middle School Students (aged 11-14 yrs)", "Secondary / Senior Secondary Students (aged 14-18 yrs)", "Undergraduate Students (Adults aged 18 yrs and above )", "Post Graduate Students", "Research Scholar"))

# Hours_of_classes
dfSurvey$Hours_of_classes <- factor(dfSurvey$Hours_of_classes, levels = c("Less than 2 hrs", "2 hours", "3 hours", "4 hours", "5 hours", "More than 5 hours"))

# Class_duration
dfSurvey$Class_duration <- factor(dfSurvey$Class_duration, levels = c("Less than 45 mins", "More than 45 minutes  but less than 1 hour", "Between 1 hour = 1.5 hours", "More than 1.5 hours"))

# Screen_time
dfSurvey$Screen_time <- factor(dfSurvey$Screen_time, levels = c("Less than 2 Hrs per day", "2 to 4 Hrs", "4 to 6 Hrs", "6 to 8 Hrs", "8 to 10 Hrs", "10 to 12 Hrs", "More than 12 hrs"))

# Attendance
dfSurvey$Attendance <- factor(dfSurvey$Attendance, levels = c("less than 30%", "30-49%", "50-69%", "70-89%", "90-100%"))

# Attendance_relative
dfSurvey$Attendance_relative <- factor(dfSurvey$Attendance_relative, levels = c("Much Lesser", "Little Lesser", "Almost the Same", "Little More", "Much More"))

# Recoding likert scales (column 34 to 39, are somewhat Likert scale)
for(i in c(14:26, 29:33)){
  dfSurvey[,i] <- recode(dfSurvey[,i], "Strongly disagree" = 1, "Disagree" = 2, "Neither agree nor disagree" = 3, "Agree" = 4, "Strongly agree" = 5)
}
