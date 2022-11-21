
solution4 <- eventReactive(input$calculate4_button,
                           {
                             ftn4 <- function(x) {
                               exp <- parse(text = as.character(input$text4_function))
                               return(eval(exp))
                             }
                             fun_result4 <-
                               secant_root_finding(ftn4, x0 = input$init_value4, x1 = input$second_init_value_2, max_iter = input$max_iter_value3, tol = 10^input$tolerance_value4)
                             
                           })

output$secant_method_solution <- renderUI({
  result4 <- solution4()
  if (is.null(result4)) {
    result4 <- "Algorithm failed to converge!"
  }
  h4("Secant Algorithm Solution =", result4)
  
})