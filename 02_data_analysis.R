## ---------------------------------------------------------------------------- #  ---------------------------------------------------------------------------- # 

### Let's do some very simple analysis ###

# Study Pop Sizes
N_all      <- length(unique(data$ID))
N_studypop <- length(unique(data_subset$ID))

# A Simple Analysis: Calculate Mean
mean_inc <- mean(data$income)

# ---------------------------------------------------------------------------- # 

