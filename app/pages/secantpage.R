JS.logify <-
  "
// function to logify a sliderInput
function logifySlider (sliderId) {
    // scientific style
    $('#'+sliderId).data('ionRangeSlider').update({
      'prettify': function (num) { return ('10<sup>'+num+'</sup>'); }
    })
}"

JS.onload <-
  "
// execute upon document loading
$(document).ready(function() {
  // wait a few ms to allow other scripts to execute
  setTimeout(function() {
    // include call for each slider
    logifySlider('tolerance_value4')
  }, 5)})
"


secant_page <- fluidPage(
  useShinyjs(),
  tags$head(tags$script(HTML(JS.logify))),
  tags$head(tags$script(HTML(JS.onload))),
  # Application title
  titlePanel("Secant Algorithm"),
  
  fluidRow(column(
    4,
    br(),
    textInput("text4_function", h3("Function Input(x)"),
              placeholder = "Enter function..."),
    br()
  )),
  fluidRow(column(
    4,
    h3("Initial value 1(a)"),
    br(),
    sliderInput(
      'init_value4',
      h4('Select the initial value'),
      min = 1,
      max = 120,
      value = 1,
      step = 1,
      round = 0
    ),
    br(),
  )),
  fluidRow(column(
    4,
    h3("Initial value 2(b)"),
    br(),
    sliderInput(
      'second_init_value_2',
      h4('Select the initial value'),
      min = 1,
      max = 120,
      value = 1,
      step = 1,
      round = 0
    ),
    br(),
  )),
  fluidRow(column(
    4,
    h3("Max Iteration"),
    br(),
    sliderInput(
      'max_iter_value3',
      h4('Select the max iteration value'),
      min = 100,
      max = 1000,
      value = 100,
      step = 1,
      round = 0
    ),
    br(),
  )),
  fluidRow(column(
    4,
    h3("Tolerance"),
    br(),
    sliderInput(
      'tolerance_value4',
      h4('Select the tolerance value'),
      min = -12,
      max = -2,
      value = -9
    ),
    br(),
  )),
  fluidRow(column(
    8,
    h3("Output"),
    br(),
    htmlOutput("secant_method_solution"),
    actionButton("calculate4_button", "Calculate")
    
    
  )),
  
)


