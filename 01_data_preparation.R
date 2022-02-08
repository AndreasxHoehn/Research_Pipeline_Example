# ---------------------------------------------------------------------------- # 

### this file does the data preparation ### 

# source the files 
demo   <- read.csv("demogaphic_data.csv")
income <- read.csv("income_data.csv")

# merge demo and income using ID # 
data <- merge(demo, income, by = "ID")

# subset based on global variable
data_subset <- subset(data, male == options$subset_sex)

# final data set #
str(data_subset)

# ---------------------------------------------------------------------------- # 