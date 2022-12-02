shinyjs::onclick("fixedpoint_plot_render",  pop_up_plot())

values <- reactiveValues(func = "",
                         status = T,
                         root = NA)

wait_for_button_click <-
  eventReactive(input$fixedpoint_calculate_button, {
    # No action needed. Just used as a callback
  })

solution <-
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
      values
    )
  )


output$fixedpoint_solution_table <- render_table(solution)
output$fixedpoint_solution <-
  output_root_finding_solution(wait_for_button_click, values, 'fixedpoint_solution_table')
output$fixedpoint_plot <-
  output_plot(wait_for_button_click, values, 'fixedpoint_plot_render')
output$fixedpoint_plot_render <- render_plot(values)
output$fixedpoint_popup_plot <- render_plot(values)
output$fixedpoint_download_plot <-
  get_download_handler("fixedpoint_plot.png", values)


pop_up_plot <- function() {
  toggleModal(session, "fixedpoint_popup", toggle = "open")
}
