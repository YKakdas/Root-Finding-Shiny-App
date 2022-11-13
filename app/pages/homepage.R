home_page <-
  fluidPage(useShinyjs(),
            fluidRow(column(
              10,
              offset = 1,
              box(
                title = "Newton Ralphson",
                width = 6,
                height = "50%",
                solidHeader = TRUE,
                status = "primary",
                img(id = "newton",
                    src = "newton.gif",
                    width = "100%")
              ),
              box(
                title = "Secant",
                width = 6,
                height = "50%",
                solidHeader = TRUE,
                status = "primary",
                img(id = "secant",
                    src = "secant.gif",
                    width = "98%")
              )
            ))
            ,
            fluidRow(column(
              10,
              offset = 1,
              box(
                title = "Bisection",
                width = 6,
                solidHeader = TRUE,
                status = "primary",
                img(id = "bisection",
                    src = "bisection.gif",
                    width = "100%")
              ),
              box(
                title = "Fixed Point",
                width = 6,
                solidHeader = TRUE,
                status = "primary",
                img(id = "fixedpoint",
                    src = "fixedpoint.gif",
                    width = "75%")
              )
            )))