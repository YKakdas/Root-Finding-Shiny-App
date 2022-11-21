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
    logifySlider('tolerance_value3')
  }, 5)})
"


bisection_page <- fluidPage(
  useShinyjs(),
  tags$head(tags$script(HTML(JS.logify))),
  tags$head(tags$script(HTML(JS.onload))),
  # Application title
  titlePanel("Bisection Algorithm"),
  
  fluidRow(column(
    4,
    br(),
    textInput("text3_function", h3("Function Input(x)"),
              placeholder = "Enter function..."),
    br()
  )),
  fluidRow(column(
    4,
    h3("Initial value 1(a)"),
    br(),
    sliderInput(
      'init_value3',
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
      'second_init_value',
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
    h3("Tolerance"),
    br(),
    sliderInput(
      'tolerance_value3',
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
    htmlOutput("bisection_method_solution"),
    actionButton("calculate3_button", "Calculate")
    
    
  )),
  
)


