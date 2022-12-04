newton_page <- fluidPage(
  useShinyjs(),
  create_popup_window(
    'newton_popup',
    'newton_popup_plot',
    'newton_download_plot',
    'Newton'
  ),
  tags$head(tags$script(HTML(newton_js_logify))),
  tags$head(tags$script(HTML(newton_js_onload))),
  fluidRow(column(
    12,
    create_box_for_html("newton_html", "html/newton.html")
  )),
  fluidRow(
    column(
      12,
      create_box_for_function_text('newton_text_function', 173),
      create_box_for_single_initial_value('newton_init_value')
    )
  ),
  fluidRow(
    column(
      12,
      create_box_for_max_iter('newton_max_iter_value'),
      create_box_for_tolerance('newton_tolerance_value')
    )
  ),
  fluidRow(column(
    12,
    uiOutput('newton_solution'),
    uiOutput('newton_plot')
  )),
  fluidRow(
    column(
      6,
      create_action_button_for_calculation('newton_calculate_button'),
      align = "right"
    ),
    column(
      6,
      create_action_button_for_reset('newton_reset_button'),
      align = "left"
    )
  )
)
