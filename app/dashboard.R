dashboard <- function() {
  library(shinydashboard)
  
  body <- dashboardBody(fluidRow(column(
    8,
    offset = 2,
    box(
      title = "Newton Ralphson",
      width = 6,
      height = "50%",
      solidHeader = TRUE,
      status = "primary",
      img(
        src = "newton.gif",
        width = "100%",
        height = "100%"
      )
    ),
    box(
      title = "Secant",
      width = 6,
      height = "50%",
      solidHeader = TRUE,
      status = "primary",
      img(
        src = "secant.gif",
        width = "100%",
        height = "100%"
      )
    )
  ))
  ,
  fluidRow(column(
    8,
    offset = 2,
    box(
      title = "Bisection",
      width = 6,
      height = "50%",
      solidHeader = TRUE,
      status = "primary",
      img(
        src = "bisection.gif",
        width = "100%",
        height = "100%"
      )
    ),
    box(
      title = "Fixed Point",
      width = 6,
      height = "50%",
      solidHeader = TRUE,
      status = "primary",
      img(
        src = "fixedpoint.gif",
        width = "100%",
        height = "100%"
      )
    )
  )))
  
  
  # We'll save it in a variable `ui` so that we can preview it in the console
  ui <- dashboardPage(
    dashboardHeader(title = "Root Finding Algorithms"),
    dashboardSidebar(disable = TRUE),
    body
  )
}
