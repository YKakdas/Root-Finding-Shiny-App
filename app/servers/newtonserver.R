
solution2 <- eventReactive(input$calculate2_button,
                          {
                            ftn2 <- function(x) {
                              exp <- parse(text = as.character(input$text2_function))
                              fx <- eval(exp)
                              first_derivative <- D(exp,"x")
                              #second_derivative <- D(first_derivative,"x")
                              fdx <- eval(first_derivative)
                              #fddx <- eval(second_derivative)
                              return(c(fx,fdx))
                            }
                            
                            fun_result2 <-
                              newtonraphson(ftn2, x0 = input$init_value2, max.iter = input$max_iter_value2, tol = 10^input$tolerance_value2)
                            
                          })

output$newton_method_solution <- renderUI({
  result2 <- solution2()
  if (is.null(result2)) {
    result2 <- "Algorithm failed to converge!"
  }
  h4("Newton's Algorithm Solution =", result2)
  
})