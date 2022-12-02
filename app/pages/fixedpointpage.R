fixed_point_page <- fluidPage(
  useShinyjs(),
  create_popup_window(
    'fixedpoint_popup',
    'fixedpoint_popup_plot',
    'fixedpoint_download_plot',
    'Fixedpoint'
  ),
  tags$head(tags$script(HTML(
    fixedpoint_js_logify
  ))),
  tags$head(tags$script(HTML(
    fixedpoint_js_onload
  ))),
  # Application title
  titlePanel("FixedPoint Algorithm"),
  
  fluidRow(
    column(
      12,
      create_box_for_function_text('fixedpoint_text_function',173),
      create_box_for_single_initial_value('fixedpoint_init_value')
    )
  ),
  fluidRow(
    column(
      12,
      create_box_for_max_iter('fixedpoint_max_iter_value'),
      create_box_for_tolerance('fixedpoint_tolerance_value')
    )
  ),
  fluidRow(column(
    12,
    uiOutput('fixedpoint_solution'),
    uiOutput('fixedpoint_plot')
  )),
  fluidRow(column(
    12,
    offset = 5,
    create_action_button_for_calculation('fixedpoint_calculate_button')
  ))
  
)
