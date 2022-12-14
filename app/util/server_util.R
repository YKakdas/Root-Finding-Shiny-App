createTableSuccess <- function(result) {
  df <- data.frame(
    "status" = c("SUCCESS - CONVERGED"),
    "root" = c(result$root),
    "iter" = c(as.integer(result$iteration)),
    "error" = c(result$tolerance),
    stringsAsFactors = FALSE
  )
  df$error <- format(df$error, scientific = TRUE)
  df
}

createTableFailure <- function(result) {
  df <- data.frame(
    "status" = c("FAILED - NOT CONVERGED"),
    "iter" = c(as.integer(result$iteration)),
    "tol" = c(result$tolerance),
    stringsAsFactors = FALSE
  )
  df$tol <- format(df$tol, scientific = TRUE)
  df
}

calculate_root_finding <-
  function(input_func,
           root_finding_method,
           params,
           values,
           is_newton = F,
           is_halley = F) {
    tryCatch({
      if (is_newton) {
        ftn <- function(x) {
          exp <- parse(text = as.character(input_func))
          fx <- eval(exp)
          
          first_derivative <- D(exp, "x")
          fdx <- eval(first_derivative)
          
          return(c(fx, fdx))
        }
      } else if (is_halley) {
        ftn <- function(x) {
          exp <- parse(text = as.character(input_func))
          fx <- eval(exp)
          
          first_derivative <- D(exp, "x")
          fdx <- eval(first_derivative)
          
          second_derivative <- D(first_derivative, "x")
          fddx  <- eval(second_derivative)
          
          return(c(fx, fdx, fddx))
        }
      } else{
        ftn <- function(x) {
          exp <- parse(text = as.character(input_func))
          return(eval(exp))
        }
      }
      fun_result <-
        root_finding_method(ftn, params)
      if (fun_result$status == "SUCCESS") {
        values$func <- as.character(input_func)
        values$status <- T
      } else{
        values$status <- F
      }
      values$root <- fun_result$root
      values$error <- F
      fun_result
    }, error = function(error_message) {
      shinyalert(
        "Oops!",
        "Something went wrong. Please ensure that you've entered both function and the initial value in correct format",
        type = "error"
      )
      values$error <- T
    })
    
  }


render_table <- function(solution, values) {
  renderTable(digits = 10,
              rownames = TRUE,
              colnames = FALSE,
              {
                result <- solution()
                if (!is.null(result) && !values$error) {
                  if (result$status == "SUCCESS") {
                    df <- createTableSuccess(result)
                    df <- t(df)
                    rownames(df) <-
                      c("STATUS",
                        "ROOT",
                        "NUMBER OF ITERATION",
                        "ABSOLUTE ERROR")
                  } else{
                    df <- createTableFailure(result)
                    df <- t(df)
                    rownames(df) <-
                      c("STATUS", "NUMBER OF ITERATION", "TOLERANCE")
                  }
                  df
                }
              })
}

output_root_finding_solution <-
  function(wait_func, values, table_id) {
    renderUI({
      wait_func()
      status <- "success"
      if (!values$status) {
        status <- "danger"
      }
      
      if (!values$error) {
        box(
          title = "Result",
          width = 12,
          height = "267px",
          solidHeader = TRUE,
          status = status,
          collapsible = T,
          tableOutput(table_id)
        )
      }
    })
  }

create_plot <- function(values) {
  if (values$status && !values$error) {
    ftn <- function(x) {
      exp <- parse(text = values$func)
      return(eval(exp))
    }
    curve(ftn, values$root - 5, values$root + 5)
    abline(h = 0, lty = 5)
    abline(v = values$root, lty = 5)
    points(values$root, 0, pch = 15)
  }
}

render_plot <- function(values) {
  renderPlot({
    create_plot(values)
  })
}

output_plot <- function(wait_func, values, plot_id) {
  renderUI({
    wait_func()
    if (values$status && !values$error) {
      box(
        title = "Plot",
        width = 12,
        height = "50%",
        solidHeader = TRUE,
        status = "success",
        collapsible = T,
        plotOutput(plot_id, height = "205")
      )
    }
    
  })
}

get_download_handler <- function(filename, values) {
  downloadHandler(
    filename = filename,
    content = function(file) {
      png(file)
      create_plot(values)
      dev.off()
    }
  )
}

pop_up_plot <- function(session, modal_id) {
  toggleModal(session, modal_id, toggle = "open")
}