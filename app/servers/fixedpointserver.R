solution_fixed <- eventReactive(input$calculate_button_fixed,
                                {
                                  ftn <- function(x) {
                                    exp <- parse(text = as.character(input$text_function_fixed))
                                    return(eval(exp))
                                  }
                                  fun_result <-
                                    fixedpoint(ftn, input$init_value_fixed)
                                  
                                })

output$root_method_solution_fixed <- renderUI({
  result_fixed <- solution_fixed()
  if (is.null(result_fixed)) {
    result_fixed <- "Algorithm failed to converge!"
  }
  h4("FixedPoint Algorithm Solution =", result_fixed)
  
})