
solution3 <- eventReactive(input$calculate3_button,
                           {
                             ftn3 <- function(x) {
                               exp <- parse(text = as.character(input$text3_function))
                               return(eval(exp))
                             }
                             fun_result3 <-
                               bisection(ftn3, a = input$init_value3, b = input$second_init_value, tol = 10^input$tolerance_value3)
                             
                           })

output$bisection_method_solution <- renderUI({
  result3 <- solution3()
  if (is.null(result3)) {
    result2 <- "Algorithm failed to converge!"
  }
  h4("Bisection Algorithm Solution =", result3)
  
})