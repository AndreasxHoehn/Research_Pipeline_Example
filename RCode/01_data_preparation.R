# ---------------------------------------------------------------------------- # 

### this file does the data preparation ### 

# source the files 
dt_demo   <- read.csv("RData/demogaphic_data.csv")
dt_income <- read.csv("RData/income_data.csv")

# merge demo and income using ID # 
dt_all <- merge(dt_demo, dt_income, by = "ID")

# subset based on global variable
dt_studypop <- subset(dt_all, sex == definitions$subset_sex)

# ---------------------------------------------------------------------------- # 