# ---------------------------------------------------------------------------- # 

### Meta ###
# Author: Andreas Höhn
# Version: 1.0
# Date: 2022-02-08
# About: an example of a full pipeline in R representing the typical flow of 
# work we encounter when working on our project. the idea is to never switch 
# software and/or copy&paste numbers, figures tables by hand - starting 
# with the very first steps of the data preparation, analysis, creating output 
# and writing the manuscript

# ---------------------------------------------------------------------------- # 

### Notes ###
# 1. ensure all required libraries are installed
# 2. ensure the working directory is set up properly --> ! LINE 31 !
# 3. pipelines in Apache Guacamole server settings such as MONA (Swedish register 
# data) or Scottish safe haven settings will require a workaround for the output 
# which I will show later in a different example

# ---------------------------------------------------------------------------- # 

### [A] Preparation ###

# deep clean work space
rm(list = ls())
gc(full = TRUE)

# working directory
wd_path <- c("/home/rootbeer/ANDI/WORK/pipeline")  # ! SPECIFY PATH #
setwd(wd_path)
dir()

# libraries
library(rmarkdown)
library(tinytex)
library(knitr)
library(ggplot2)

# ---------------------------------------------------------------------------- # 

### [B] Define Study Outline, Cut-Offs etc. ###

# define global variables DONT HARD CODE THEM LATER!
# in this example we want to be able to quickly switch between males females
# subset variable "subset_sex": males = 1 or females = 0
# change the value here and you get the entire paper based on this change
options <- list()
options$subset_sex <- 1 

# ---------------------------------------------------------------------------- # 

### [1] Source File: Build and Specify the Study Population ###
source("01_data_preparation.R")

# ---------------------------------------------------------------------------- # 

### [2] Source File: Run Analysis ###
# source analysis file - means run what's in the file. 
# object x shall appear in the work space 
source("02_data_analysis.R")

# ---------------------------------------------------------------------------- # 

### [3] Source File: Numbers, Tables, Figures
source("03_numbers_tables_figures.R")

# ---------------------------------------------------------------------------- # 

### [4] Source File: Built the Paper ###
# csl files from: https://www.zotero.org/styles
# source bib files as usual
rmarkdown::render(input = "04_manuscript_input.Rmd",
			output_file = "manuscript_output.docx",
			output_format = "word_document")

# ---------------------------------------------------------------------------- # 
