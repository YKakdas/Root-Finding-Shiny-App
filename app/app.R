library(shiny)
source("dashboard.R")
# Preview the UI in the console
shinyApp(ui = dashboard(), server = function(input, output) { })