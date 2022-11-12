library(shiny)
library(spuRs)


# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("FixedPoint Algorithm"),
  br(),
  
  fluidRow(
    column(4,
           br(),
           textInput("text_function", h3("Function Input(x)"), 
                     placeholder = "Enter function..."),
           br()
    )),
  fluidRow(
    column(4,
           h3("Initial value"),
           br(),
           sliderInput('init_value', h4('Select the initial value'), 
                       min=1, max=120, value=1, 
                       step=1, round=0),
           br(),
           br(),
    )),
  fluidRow(
    column(8,
           h3("Output"),
           br(),
           htmlOutput("root_method_solution"),
           actionButton("calculate_button","Calculate")
           
           
    ))
)

# Define server logic required to calculate the root and output the result
server <- function(input, output) {
  solution <- eventReactive(input$calculate_button, 
              {
                ftn <- function(x){
                  exp <- parse(text = as.character(input$text_function))
                  return(eval(exp))
                }
                fun_result <- fixedpoint(ftn,input$init_value)
                
              })

  output$root_method_solution <- renderUI({
    solution <- solution()
    if(is.null(solution)){
      solution <- "Algorithm failed to converge!"
    }
    h4("FixedPoint Algorithm Solution =", solution)
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)