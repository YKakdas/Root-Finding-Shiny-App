regula_page <- fluidPage(
  useShinyjs(),
  create_popup_window(
    'regula_popup',
    'regula_popup_plot',
    'regula_download_plot',
    'Regula'
  ),
  tags$head(tags$script(HTML(
    regula_js_logify
  ))),
  tags$head(tags$script(HTML(
    regula_js_onload
  ))),
  # Application title
  titlePanel("Regula Algorithm"),
  
  fluidRow(
    column(
      12,
      create_box_for_function_text('regula_text_function',249),
      create_box_for_multiple_initial_values('regula_init_value_start', 'regula_init_value_end')
    )
  ),
  fluidRow(
    column(
      12,
      create_box_for_max_iter('regula_max_iter_value'),
      create_box_for_tolerance('regula_tolerance_value')
    )
  ),
  fluidRow(column(
    12,
    uiOutput('regula_solution'),
    uiOutput('regula_plot')
  )),
  fluidRow(column(
    12,
    offset = 5,
    create_action_button_for_calculation('regula_calculate_button')
  ))
  
)
