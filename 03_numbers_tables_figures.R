# ---------------------------------------------------------------------------- # 

### Figures ###

# Creating a Figure
plot <- ggplot(data_subset, aes(x = age, y = income)) +
  geom_point() + 
  theme_minimal()
# saving the figure
ggsave(plot = plot, "plot.png",
       device = "png", width = 10, height = 10, units = "cm")
# title for the figure
plot_title <- paste("This is a very long title for plot number and this is",
                    "why we split the line when we code it. In the manuscript",
                    "there won't be any line breaks.")

# ---------------------------------------------------------------------------- # 

### TABLES ###

# using a function that just depends on a data object we pass in
# we do this in a function to make sure we don't get a messed up work space
# the table will look ugly and won't be formatted for open office 
# however, it looks kind of okay in MS Word 

.MakeTable <- function(data_input) {
    tab_N   <- data.frame(
                     Summary = "Individuals",
                     Value   = length(unique(data_input$ID,2)))
    tab_age <- data.table(
                    Summary = "Mean Age",
                    Value   = sprintf("%.2f", round(mean(data_input$age), 2)))
    tab_inc <- data.table(
                   Summary = "Mean Income",
                   Value   = sprintf("%.2f", round(mean(data_input$income), 2)))

    table <- rbind(tab_N, tab_age, tab_inc)
  return(table)
}

table_studypop <- .MakeTable(data_subset)
table_studypop_title <- paste("Overview of the Study Population. A title that",
                               "suddenly became quite long as well suddenly.")

# ---------------------------------------------------------------------------- # 
