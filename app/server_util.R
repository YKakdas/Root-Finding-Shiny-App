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
           values) {
    ftn <- function(x) {
      exp <- parse(text = as.character(input_func))
      return(eval(exp))
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
    fun_result
  }


render_table <- function(solution) {
  renderTable(digits = 10,
              rownames = TRUE,
              colnames = FALSE,
              {
                result <- solution()
                if (result$status == "SUCCESS") {
                  df <- createTableSuccess(result)
                  df <- t(df)
                  rownames(df) <-
                    c("STATUS", "ROOT", "NUMBER OF ITERATION", "ABSOLUTE ERROR")
                } else{
                  df <- createTableFailure(result)
                  df <- t(df)
                  rownames(df) <-
                    c("STATUS", "MAX NUMBER OF ITERATION", "TOLERANCE")
                }
                df
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
      
      box(
        title = "Result",
        width = 6,
        height = "50%",
        solidHeader = TRUE,
        status = status,
        tableOutput(table_id)
      )
    })
  }

create_plot <- function(values) {
  if (values$status) {
    ftn <- function(x) {
      exp <- parse(text = values$func)
      return(eval(exp))
    }
    curve(ftn, values$root - 5, values$root + 5)
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
    if (values$status) {
      box(
        title = "Plot",
        width = 6,
        height = "50%",
        solidHeader = TRUE,
        status = "success",
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