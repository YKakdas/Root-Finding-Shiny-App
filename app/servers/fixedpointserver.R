shinyjs::onclick("fixedpoint_plot_render",
                 pop_up_plot(session, "fixedpoint_popup"))

fixedpoint_reactive_values <- reactiveValues(
  func = "",
  status = F,
  root = NA,
  error = F
)

fixedpoint_wait_for_button_click <-
  eventReactive(input$fixedpoint_calculate_button, {
    fixedpoint_reactive_values$error <- F
  })

fixedpoint_solution <-
  eventReactive(
    input$fixedpoint_calculate_button,
    calculate_root_finding(
      input$fixedpoint_text_function,
      fixedpoint,
      c(
        x0 = as.numeric(input$fixedpoint_init_value),
        max.iter = input$fixedpoint_max_iter_value,
        tol = 10 ^ input$fixedpoint_tolerance_value
      ),
      fixedpoint_reactive_values
    )
    
  )

observeEvent(input$fixedpoint_reset_button, {
  shinyjs::reset("fixedpoint_text_function")
  shinyjs::reset("fixedpoint_init_value")
  shinyjs::reset("fixedpoint_max_iter_value")
  shinyjs::reset("fixedpoint_tolerance_value")
  shinyjs::hide("fixedpoint_solution_table")
  shinyjs::hide("fixedpoint_plot_render")
  
  fixedpoint_reactive_values <- reactiveValues(
    func = "",
    status = F,
    root = NA,
    error = F
  )
  
  
})


output$fixedpoint_solution_table <-
  render_table(fixedpoint_solution, fixedpoint_reactive_values)

output$fixedpoint_solution <-
  output_root_finding_solution(
    fixedpoint_wait_for_button_click,
    fixedpoint_reactive_values,
    'fixedpoint_solution_table'
  )

output$fixedpoint_plot <-
  output_plot(
    fixedpoint_wait_for_button_click,
    fixedpoint_reactive_values,
    'fixedpoint_plot_render'
  )

output$fixedpoint_plot_render <-
  render_plot(fixedpoint_reactive_values)

output$fixedpoint_popup_plot <-
  render_plot(fixedpoint_reactive_values)

output$fixedpoint_download_plot <-
  get_download_handler("fixedpoint_plot.png", fixedpoint_reactive_values)