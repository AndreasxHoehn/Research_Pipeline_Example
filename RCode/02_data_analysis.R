## ---------------------------------------------------------------------------- #  

### Let's do some very simple analyses ... ###

# Creating a Figure and save 
plot <- ggplot2::ggplot(dt_studypop, aes(x = age, y = income)) +
  geom_point() + 
  theme_minimal()
ggsave(plot = plot, "RImages/plot.jpeg", width = 20, height = 20, units = "cm")
# title for the figure
plot_title <- paste("This is a  long title for which we split over two lines",
                    "in our code to meet code formatting requirements.")

# creating a table

# using a function that just depends on a data object we pass in
# we do this in a function to make sure we don't get a messed up work space
# the table will look ugly and won't be formatted for open office 
# however, it looks kind of okay in MS Word 

.MakeTable <- function(data_input) {
  tab_N   <- data.frame(
    Summary = "Individuals",
    Value   = length(unique(data_input$ID,2)))
  tab_age <- data.frame(
    Summary = "Mean Age",
    Value   = sprintf("%.2f", round(mean(data_input$age), 2)))
  tab_inc <- data.frame(
    Summary = "Mean Income",
    Value   = sprintf("%.2f", round(mean(data_input$income), 2)))
  
  table <- rbind(tab_N, tab_age, tab_inc)
  return(table)
}

table_studypop <- .MakeTable(dt_studypop)
table_studypop_title <- paste("Overview of the Study Population. Another long",
                              "title which we split over two lines in our code.")

# ---------------------------------------------------------------------------- # 