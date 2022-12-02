shinyjs::onclick("newton_plot_render",
                 pop_up_plot(session, "newton_popup"))

newton_reactive_values <- reactiveValues(func = "",
                                         status = F,
                                         root = NA)

newton_wait_for_button_click <-
  eventReactive(input$newton_calculate_button, {
    # No action needed. Just used as a callback
  })

newton_solution <-
  eventReactive(
    input$newton_calculate_button,
    calculate_root_finding(
      input$newton_text_function,
      newton,
      c(
        x0 = as.numeric(input$newton_init_value),
        max.iter = input$newton_max_iter_value,
        tol = 10 ^ input$newton_tolerance_value
      ),
      newton_reactive_values,
      is_newton = T
    )
  )


output$newton_solution_table <-
  render_table(newton_solution)

output$newton_solution <-
  output_root_finding_solution(newton_wait_for_button_click,
                               newton_reactive_values,
                               'newton_solution_table')

output$newton_plot <-
  output_plot(newton_wait_for_button_click,
              newton_reactive_values,
              'newton_plot_render')

output$newton_plot_render <-
  render_plot(newton_reactive_values)

output$newton_popup_plot <-
  render_plot(newton_reactive_values)

output$newton_download_plot <-
  get_download_handler("newton_plot.png", newton_reactive_values)