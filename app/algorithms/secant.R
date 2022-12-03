secant <-
  function(ftn, params) {
    # Takes function ftn with two initial guesses x0 and x1 and tries to find the root
    # loops until max_iter has been reached or the difference between x_n and x_(n+1) is less than tolerance
    
    with(as.list(c(params)), {
      x_previous <- x0
      x_current <- x1
      
      iter <- 0
      
      while (abs(ftn(x_current)) > tol && iter < max.iter) {
        x_next = x_current - ftn(x_current) * ((x_current - x_previous) / (ftn(x_current) - ftn(x_previous)))
        
        x_previous <- x_current
        x_current <- x_next
        
        iter <- iter + 1
        if (is.null(ftn(x_current)) ||
            is.nan(ftn(x_current)) ||
            is.na(ftn(x_current)) ||
            is.infinite(ftn(x_current))) {
          return(list(
            status = "FAIL",
            root = NA,
            iteration = iter,
            tolerance = tol
          ))
        }
      }
      
      if (is.null(ftn(x_current)) ||
          is.nan(ftn(x_current)) ||
          is.na(ftn(x_current)) ||
          is.infinite(ftn(x_current)) || abs(ftn(x_current)) > tol) {
        return(list(
          status = "FAIL",
          root = NA,
          iteration = iter,
          tolerance = tol
        ))
      }
      else {
        return(list(
          status = "SUCCESS",
          root = x_current,
          iteration = iter,
          tolerance = abs(ftn(x_current) - tol)
        ))
      }
    })
    
  }