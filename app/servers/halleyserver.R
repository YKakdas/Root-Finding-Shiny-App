shinyjs::onclick("halley_plot_render",
                 pop_up_plot(session, "halley_popup"))

halley_reactive_values <- reactiveValues(func = "",
                                         status = F,
                                         root = NA,
                                         error = F)

halley_wait_for_button_click <-
  eventReactive(input$halley_calculate_button, {
    halley_reactive_values$error <- F
  })

halley_solution <-
  eventReactive(
    input$halley_calculate_button,
    calculate_root_finding(
      input$halley_text_function,
      halley,
      c(
        x0 = as.numeric(input$halley_init_value),
        max.iter = input$halley_max_iter_value,
        tol = 10 ^ input$halley_tolerance_value
      ),
      halley_reactive_values,
      is_halley = T
    )
  )

observeEvent(input$halley_reset_button, {
  shinyjs::reset("halley_text_function")
  shinyjs::reset("halley_init_value")
  shinyjs::reset("halley_max_iter_value")
  shinyjs::reset("halley_tolerance_value")
  shinyjs::hide("halley_solution_table")
  shinyjs::hide("halley_plot_render")
  
  halley_reactive_values <- reactiveValues(
    func = "",
    status = F,
    root = NA,
    error = F
  )
  
})

output$halley_solution_table <-
  render_table(halley_solution,halley_reactive_values)

output$halley_solution <-
  output_root_finding_solution(halley_wait_for_button_click,
                               halley_reactive_values,
                               'halley_solution_table')

output$halley_plot <-
  output_plot(halley_wait_for_button_click,
              halley_reactive_values,
              'halley_plot_render')

output$halley_plot_render <-
  render_plot(halley_reactive_values)

output$halley_popup_plot <-
  render_plot(halley_reactive_values)

output$halley_download_plot <-
  get_download_handler("halley_plot.png", halley_reactive_values)