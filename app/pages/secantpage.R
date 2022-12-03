secant_page <- fluidPage(
  useShinyjs(),
  create_popup_window(
    'secant_popup',
    'secant_popup_plot',
    'secant_download_plot',
    'secant'
  ),
  tags$head(tags$script(HTML(secant_js_logify))),
  tags$head(tags$script(HTML(secant_js_onload))),
  fluidRow(column(
    12,
    create_box_for_html("secant_html", "html/secant.html")
  )),
  fluidRow(
    column(
      12,
      create_box_for_function_text('secant_text_function', 249),
      create_box_for_multiple_initial_values(
        'secant_init_value_start',
        'secant_init_value_end',
        first_title = "First Initial Guess",
        first_placeholder = "Enter first...",
        second_title = "Second Initial Guess",
        second_placeholder = "Enter second..."
      )
    )
  ),
  fluidRow(
    column(
      12,
      create_box_for_max_iter('secant_max_iter_value'),
      create_box_for_tolerance('secant_tolerance_value')
    )
  ),
  fluidRow(column(
    12,
    uiOutput('secant_solution'),
    uiOutput('secant_plot')
  )),
  fluidRow(
    column(
      12,
      offset = 4,
      create_action_button_for_calculation('secant_calculate_button'),
      create_action_button_for_reset('secant_reset_button')
    )
  )
  
)
