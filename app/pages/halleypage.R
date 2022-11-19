halley_page <- fluidPage(
  # Application title
  titlePanel("Halley Algorithm"),
  br(),
  
  fluidRow(column(
    4,
    br(),
    textInput(
      "text_function_halley",
      h3("Function Input(x)"),
      placeholder = "Enter function..."
    ),
    br()
  )),
  fluidRow(column(
    4,
    h3("Initial value"),
    br(),
    sliderInput(
      'init_value_halley',
      h4('Select the initial value'),
      min = 1,
      max = 120,
      value = 1,
      step = 1,
      round = 0
    ),
    br(),
    br(),
  )),
  fluidRow(column(
    8,
    h3("Output"),
    br(),
    htmlOutput("root_method_solution_halley"),
    actionButton("calculate_button_halley", "Calculate")
  ))
)
