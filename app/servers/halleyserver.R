solution_halley <- eventReactive(input$calculate_button_halley,
                          {
                            ftn <- function(x) {
                              exp <- parse(text = as.character(input$text_function_halley))
                              fx <- eval(exp)
                              first_derivative <- D(exp,"x")
                              second_derivative <- D(first_derivative,"x")
                              fdx <- eval(first_derivative)
                              fddx <- eval(second_derivative)
                              return(c(fx,fdx,fddx))
                            }
                            fun_result <-
                              halley_root_finding(ftn, x0 = 1.5)
                            
                          })

output$root_method_solution_halley <- renderUI({
  result_halley <- solution_halley()
  if (is.null(result_halley)) {
    result_halley <- "Algorithm failed to converge!"
  }
  h4("Halley Algorithm Solution =", result_halley)
  
})