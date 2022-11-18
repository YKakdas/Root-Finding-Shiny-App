fixed_point_page <- fluidPage(
  # Application title
  titlePanel("FixedPoint Algorithm"),
  br(),
  
  fluidRow(column(
    4,
    br(),
    textInput("text_function", h3("Function Input(x)"),
              placeholder = "Enter function..."),
    br()
  )),
  fluidRow(column(
    4,
    h3("Initial value"),
    br(),
    sliderInput(
      'init_value',
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
    4,
    h3("Max Iteration"),
    br(),
    sliderInput(
      'max_iter_value',
      h4('Select the max iteration value'),
      min = 100,
      max = 1000,
      value = 100,
      step = 1,
      round = 0
    ),
    br(),
    br(),
  )),
  fluidRow(column(
    4,
    h3("Tolerance"),
    br(),
    sliderInput(
      'tolerance_value',
      h4('Select the tolerance value'),
      min = 1e-12,
      max = 1e-2,
      value = 1e-12,
      step = 1e-12,
      round = 0
    ),
    br(),
    br(),
  )),
  fluidRow(column(
    8,
    h3("Output"),
    br(),
    htmlOutput("root_method_solution"),
    actionButton("calculate_button", "Calculate")
  
    
  )),
  
)


