
solution8 <- eventReactive(input$calculate8_button,
                           {
                             ftn8 <- function(x) {
                               exp <- parse(text = as.character(input$text8_function))
                               return(eval(exp))
                             }
                             fun_result8 <-
                               regula(ftn8, a = input$init_value8, b = input$second_init_value_8, tol = 10^input$tolerance_value8)
                             
                           })

output$regula_method_solution <- renderUI({
  result8 <- solution8()
  if (is.null(result8)) {
    result8 <- "Algorithm failed to converge!"
  }
  h4("Regula Algorithm Solution =", result8)
  
})