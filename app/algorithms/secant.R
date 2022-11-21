secant_root_finding <-
  function(ftn,
           x0,
           x1,
           tol = 1e-9,
           max_iter = 100) {
    # Takes function ftn with two initial guesses x0 and x1 and tries to find the root
    # loops until max_iter has been reached or the difference between x_n and x_(n+1) is less than tolerance
    x_previous <- x0
    x_current <- x1
    
    iter <- 0
    
    while (abs(ftn(x_current)) > tol && iter < max_iter) {
      x_next = x_current - ftn(x_current) * ((x_current - x_previous) / (ftn(x_current) - ftn(x_previous)))
      
      x_previous <- x_current
      x_current <- x_next
      
      iter <- iter + 1
      cat("At iteration", iter, "value of x is:", x_current, "\n")
    }
    
    if (abs(ftn(x_current)) > tol) {
      return(
        paste0(
          "The algorithm failed to converge for given error tolerance ",
          tol,
          " and maximum number of iterations ",
          max.iter
        )
      )
    }
    else {
      return(
        paste0(
          "The algorithm converged after ",
          iter,
          " iteration with error ",
          tol,
          ", and the root for the function is at x = ",
          abs(ftn(x_current))
        )
      )
    }
}