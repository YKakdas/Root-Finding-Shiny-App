shinyjs::onclick("secant_plot_render",
                 pop_up_plot(session, "secant_popup"))

secant_reactive_values <- reactiveValues(
  func = "",
  status = F,
  root = NA,
  error = F
)

secant_wait_for_button_click <-
  eventReactive(input$secant_calculate_button, {
    secant_reactive_values$error <- F
  })

secant_solution <-
  eventReactive(
    input$secant_calculate_button,
    calculate_root_finding(
      input$secant_text_function,
      secant,
      c(
        x0 = as.numeric(input$secant_init_value_start),
        x1 = as.numeric(input$secant_init_value_end),
        max.iter = input$secant_max_iter_value,
        tol = 10 ^ input$secant_tolerance_value
      ),
      secant_reactive_values
    )
  )

observeEvent(input$secant_reset_button, {
  shinyjs::reset("secant_text_function")
  shinyjs::reset("secant_init_value_start")
  shinyjs::reset("secant_init_value_end")
  shinyjs::reset("secant_max_iter_value")
  shinyjs::hide("secant_solution_table")
  shinyjs::hide("secant_plot_render")
  
  secant_reactive_values <- reactiveValues(
    func = "",
    status = F,
    root = NA,
    error = F
  )
})

output$secant_solution_table <-
  render_table(secant_solution, secant_reactive_values)

output$secant_solution <-
  output_root_finding_solution(
    secant_wait_for_button_click,
    secant_reactive_values,
    'secant_solution_table'
  )

output$secant_plot <-
  output_plot(
    secant_wait_for_button_click,
    secant_reactive_values,
    'secant_plot_render'
  )

output$secant_plot_render <-
  render_plot(secant_reactive_values)

output$secant_popup_plot <-
  render_plot(secant_reactive_values)

output$secant_download_plot <-
  get_download_handler("secant_plot.png", secant_reactive_values)