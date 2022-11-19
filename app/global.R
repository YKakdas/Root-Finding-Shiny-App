list.of.packages <- c("shiny", "shinyjs","shinydashboard","spuRs")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(shiny)
library(shinyjs)
library(shinydashboard)
library(spuRs)

server <- function(input, output, session) {
  source('servers/fixedpointserver.R', local = TRUE)
  source('servers/bisectionserver.R', local = TRUE)
  source('servers/dashboardserver.R', local = TRUE)
  source('servers/newtonserver.R', local = TRUE)
  source('servers/secantserver.R', local = TRUE)
  source('servers/regulaserver.R', local = TRUE)
  source('servers/halleyserver.R', local = TRUE)
  
}

source("pages/homepage.R")
source("pages/fixedpointpage.R")
source("pages/bisectionpage.R")
source("pages/newtonpage.R")
source("pages/secantpage.R")
source("pages/regulapage.R")
source("pages/halleypage.R")
source("pages/reipage.R")

source('dashboard.R')

source("algorithms/bisection.R")
source("algorithms/fixedpoint.R")
source("algorithms/newton.R")
source("algorithms/secant.R")
source("algorithms/regula.R")
source("algorithms/halley.R")