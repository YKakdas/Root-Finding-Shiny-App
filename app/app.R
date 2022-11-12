source('dashboard.R', local = TRUE)

library(shiny)
library(shinyjs)


server <- function(input, output, session) {
  source('servers/fixedpointserver.R', local = TRUE)
  source('servers/bisectionserver.R', local = TRUE)
  source('servers/dashboardserver.R', local = TRUE)
}

shinyApp(ui = dashboard, server = server)