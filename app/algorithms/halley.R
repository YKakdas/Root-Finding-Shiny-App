halley_root_finding <- function(ftn,
                          x0,
                          tol = 1e-9,
                          max.iter = 100) {
  x <- x0 # initialize
  fx <- ftn(x)
  iter <- 0
  # continue iterating until stopping conditions are met
  while ((abs(fx[1]) > tol) && (iter < max.iter)) {
    x <- x - fx[1] / fx[2]
    fx <- ftn(x)
    iter <- iter + 1
    cat("At iteration", iter, "value of x is:", x, "\n")
  }
  
  if (abs(fx[1]) > tol) {
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
        abs(fx[1]),
        ", and the root for the function is at x = ",
        x
      )
    )
  }
} 