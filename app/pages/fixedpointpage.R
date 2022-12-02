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
    logifySlider('fixedpoint_tolerance_value')
  }, 5)})
"


fixed_point_page <- fluidPage(
  useShinyjs(),
  mainPanel(
    bsModal("fixedpoint_popup", "Fixedpoint Plot", "NONE", size = "large",plotOutput("popup_plot"),downloadButton('fixedpoint_download_plot', 'Download'))
  ),
  tags$head(tags$script(HTML(JS.logify))),
  tags$head(tags$script(HTML(JS.onload))),
  # Application title
  titlePanel("FixedPoint Algorithm"),
  
  fluidRow(column(
    12,
    box(
      title = "Function",
      width = 6,
      height = "50%",
      solidHeader = TRUE,
      status = "primary",
      textInput("fixedpoint_text_function", h3("Function Input(x)"),
                placeholder = "Enter function..."),
    ),
    box(
      title = "Initial Value",
      width = 6,
      height = "50%",
      solidHeader = TRUE,
      status = "primary",
      textInput("fixedpoint_init_value", h3("Initial Value"),
                placeholder = "Enter initial value...")
      
    )
  )),
  fluidRow(column(
    12,
    box(
      title = "Number of Maximum Iterations",
      width = 6,
      height = "50%",
      solidHeader = TRUE,
      status = "primary",
      sliderInput(
        'fixedpoint_max_iter_value',
        h4('Select the max iteration value'),
        min = 100,
        max = 1000,
        value = 100,
        step = 1,
        round = 0
      )
    ),
    box(
      title = "Tolerance",
      width = 6,
      height = "50%",
      solidHeader = TRUE,
      status = "primary",
      sliderInput(
        'fixedpoint_tolerance_value',
        h4('Select the tolerance value'),
        min = -12,
        max = -6,
        value = -9
      )
    )
  )),
  fluidRow(column(
    12,
    uiOutput('fixedpoint_solution'),
    uiOutput('fixedpoint_plot')
  )),
  fluidRow(column(
    12,
    actionButton("fixedpoint_calculate_button", "Calculate")
  ))
  
)
