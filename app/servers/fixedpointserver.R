
solution <- eventReactive(input$calculate_button,
                                {
                                  ftn <- function(x) {
                                    exp <- parse(text = as.character(input$text_function))
                                    return(eval(exp))
                                  }
                                  fun_result <-
                                    fixedpoint(ftn, x0 = input$init_value, max.iter = input$max_iter_value, tol = 10^input$tolerance_value)
                                  
                                })

output$root_method_solution <- renderUI({
  result <- solution()
  if (is.null(result)) {
    result <- "Algorithm failed to converge!"
  }
  h4("FixedPoint Algorithm Solution =", result)
  
})