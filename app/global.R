library(shiny)
library(shinyjs)
library(shinydashboard)
library(spuRs)

server <- function(input, output, session) {
  source('servers/fixedpointserver.R', local = TRUE)
  source('servers/bisectionserver.R', local = TRUE)
  source('servers/dashboardserver.R', local = TRUE)
}

source("pages/homepage.R")
source("pages/fixedpointpage.R")
source("pages/bisectionpage.R")

source('dashboard.R')

source("algorithms/bisection.R")
source("algorithms/fixedpoint.R")
source("algorithms/newton.R")
source("algorithms/secant.R")