# ---------------------------------------------------------------------------- # 

### Meta ###
# Author: Andreas Höhn
# Version: 1.0
# Date: 2023-01-06
# About: an example of a full pipeline in R representing the typical flow of 
# work we encounter when working on our project. the idea is to never switch 
# software and/or copy&paste numbers, figures tables by hand - starting 
# with the very first steps of the data preparation, analysis, creating output 
# and writing the manuscript

# ---------------------------------------------------------------------------- # 

### Notes ###
# all required libraries are installed (if required) and loaded automatically 
# all file paths are defined in relative terms, ensure you have loaded the project file
# guacamole server settings such as MONA, Sco Safe Havens might will require a workaround for citations

# ---------------------------------------------------------------------------- # 

### [A] Preparation ###

# deep clean work space
rm(list = ls())
gc(full = TRUE)

# List of Required Packages 
RequiredPackages <- c("here",                           # Folder Structure
                      "rmarkdown","tinytex","knitr",    # Report
                      "ggplot2")                        # Data Visualisation

# ensure all packages are installed and loaded -> automatized 
.EnsurePackages <- function(packages_vector) {
  new_package <- packages_vector[!(packages_vector %in% 
                                     installed.packages()[, "Package"])]
  if (length(new_package) != 0) {
    install.packages(new_package) }
  sapply(packages_vector, suppressPackageStartupMessages(require),
         character.only = TRUE)
}
.EnsurePackages(RequiredPackages)

# initialize all relative paths
here <- here::here 

# ---------------------------------------------------------------------------- # 

### [B] Define Study Outline, Cut-Offs etc. ###

# define global variables DONT HARD CODE THEM LATER!
# in this example we want to be able to quickly switch between males females
# subset variable "subset_sex": 
# change the value here and you get the entire paper based on this change
definitions <- list()
definitions$subset_sex <- "female" # either: male/female

# ---------------------------------------------------------------------------- # 

### [1] Source File: Build and Specify the Study Population ###
source("RCode/01_data_preparation.R")

# ---------------------------------------------------------------------------- # 

### [2] Source File: Run Analysis ###
# source analysis file - means run what's in the file. 
# object x shall appear in the work space 
source("RCode/02_data_analysis.R")

# ---------------------------------------------------------------------------- # 

### [3] Source File: Built the Paper ###
# csl files from: https://www.zotero.org/styles
# source bib files as usual
# rmarkdown might requires here:: file paths due to location of pandoc 
rmarkdown::render(input = "RCode/03_manuscript.Rmd",
			output_file = here::here("ROutput/manuscript.docx"),
			output_format = "word_document")

# ---------------------------------------------------------------------------- # 
