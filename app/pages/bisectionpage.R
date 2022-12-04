bisection_page <- fluidPage(
  useShinyjs(),
  create_popup_window(
    'bisection_popup',
    'bisection_popup_plot',
    'bisection_download_plot',
    'Bisection'
  ),
  tags$head(tags$script(HTML(
    bisection_js_logify
  ))),
  tags$head(tags$script(HTML(
    bisection_js_onload
  ))),
  fluidRow(column(
    12,
    create_box_for_html("bisection_html", "html/bisection.html")
  )),
  fluidRow(
    column(
      12,
      create_box_for_function_text('bisection_text_function', 249),
      create_box_for_multiple_initial_values('bisection_init_value_start', 'bisection_init_value_end')
    )
  ),
  fluidRow(
    column(
      12,
      create_box_for_max_iter('bisection_max_iter_value'),
      create_box_for_tolerance('bisection_tolerance_value')
    )
  ),
  fluidRow(column(
    12,
    uiOutput('bisection_solution'),
    uiOutput('bisection_plot')
  )),
  fluidRow(
    column(
      6,
      create_action_button_for_calculation('bisection_calculate_button'),
      align = "right"
    ),
    column(
      6,
      create_action_button_for_reset('bisection_reset_button'),
      align = "left"
    )
  )
  
)
