solution_bisection <- eventReactive(input$calculate_button_bisection,
                                    {
                                      ftn <- function(x) {
                                        exp <- parse(text = as.character(input$text_function_bisection))
                                        return(eval(exp))
                                      }
                                      fun_result <-
                                        fixedpoint(ftn, input$init_value_bisection)
                                      
                                    })

output$root_method_solution_bisection <- renderUI({
  result_bisection <- solution_bisection()
  if (is.null(result_bisection)) {
    result_bisection <- "Algorithm failed to converge!"
  }
  h4("FixedPoint Algorithm Solution =", result_bisection)
  
})
