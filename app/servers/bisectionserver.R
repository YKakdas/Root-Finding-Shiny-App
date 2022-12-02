shinyjs::onclick("bisection_plot_render",
                 pop_up_plot(session, "bisection_popup"))

bisection_reactive_values <- reactiveValues(func = "",
                                            status = F,
                                            root = NA)

bisection_wait_for_button_click <-
  eventReactive(input$bisection_calculate_button, {
    # No action needed. Just used as a callback
  })

bisection_solution <-
  eventReactive(
    input$bisection_calculate_button,
    calculate_root_finding(
      input$bisection_text_function,
      bisection,
      c(
        a = as.numeric(input$bisection_init_value_start),
        b = as.numeric(input$bisection_init_value_end),
        max.iter = input$bisection_max_iter_value,
        tol = 10 ^ input$bisection_tolerance_value
      ),
      bisection_reactive_values
    )
  )


output$bisection_solution_table <-
  render_table(bisection_solution)

output$bisection_solution <-
  output_root_finding_solution(
    bisection_wait_for_button_click,
    bisection_reactive_values,
    'bisection_solution_table'
  )

output$bisection_plot <-
  output_plot(
    bisection_wait_for_button_click,
    bisection_reactive_values,
    'bisection_plot_render'
  )

output$bisection_plot_render <-
  render_plot(bisection_reactive_values)

output$bisection_popup_plot <-
  render_plot(bisection_reactive_values)

output$bisection_download_plot <-
  get_download_handler("bisection_plot.png", bisection_reactive_values)