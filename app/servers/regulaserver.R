shinyjs::onclick("regula_plot_render",
                 pop_up_plot(session, "regula_popup"))

regula_reactive_values <- reactiveValues(
  func = "",
  status = F,
  root = NA,
  error = F
)

regula_wait_for_button_click <-
  eventReactive(input$regula_calculate_button, {
    regula_reactive_values$error <- F
  })

observeEvent(input$regula_reset_button, {
  shinyjs::reset("regula_text_function")
  shinyjs::reset("regula_init_value_start")
  shinyjs::reset("regula_init_value_end")
  shinyjs::reset("regula_max_iter_value")
  shinyjs::hide("regula_solution_table")
  shinyjs::hide("regula_plot_render")
  
  regula_reactive_values <- reactiveValues(
    func = "",
    status = F,
    root = NA,
    error = F
  )
})

regula_solution <-
  eventReactive(
    input$regula_calculate_button,
    calculate_root_finding(
      input$regula_text_function,
      regula,
      c(
        a = as.numeric(input$regula_init_value_start),
        b = as.numeric(input$regula_init_value_end),
        max.iter = input$regula_max_iter_value,
        tol = 10 ^ input$regula_tolerance_value
      ),
      regula_reactive_values
    )
  )


output$regula_solution_table <-
  render_table(regula_solution, regula_reactive_values)

output$regula_solution <-
  output_root_finding_solution(regula_wait_for_button_click,
                               regula_reactive_values,
                               'regula_solution_table')

output$regula_plot <-
  output_plot(regula_wait_for_button_click,
              regula_reactive_values,
              'regula_plot_render')

output$regula_plot_render <-
  render_plot(regula_reactive_values)

output$regula_popup_plot <-
  render_plot(regula_reactive_values)

output$regula_download_plot <-
  get_download_handler("regula_plot.png", regula_reactive_values)