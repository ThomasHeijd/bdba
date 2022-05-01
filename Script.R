# loading data
dfSurvey <- read.csv("data_new.csv")

# removing case number column
dfSurvey[,1] <- NULL

# converting age group column to factor and assigning ordinal ranking
dfSurvey$Age_group <- factor(dfSurvey$Age_group, levels = c("Very Young Learners (aged 3-6 yrs)", "Young Students upto Class V (aged 6-11 yrs)", "Middle School Students (aged 11-14 yrs)", "Secondary / Senior Secondary Students (aged 14-18 yrs)", "Undergraduate Students (Adults aged 18 yrs and above )", "Post Graduate Students", "Research Scholar"))

# converting several columns to factor
dfSurvey[,2:7] <- lapply(dfSurvey[,2:7], as.factor)

# converting hours of classes column to factor and assigning ordinal ranking
dfSurvey$Hours_of_classes <- factor(dfSurvey$Hours_of_classes, levels = c("Less than 2 hrs", "2 hours", "3 hours", "4 hours", "5 hours", "More than 5 hours"))

# converting class duration column to factor and assigning ordinal ranking
dfSurvey$Class_duration <- factor(dfSurvey$Class_duration, levels = c("Less than 45 mins", "More than 45 minutes  but less than 1 hour", "Between 1 hour = 1.5 hours", "More than 1.5 hours"))