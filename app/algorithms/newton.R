newtonraphson <- function(ftn,
                          x0,
                          tol = 1e-9,
                          max.iter = 100) {
  # Newton_Raphson algorithm for solving ftn(x)[1] == 0
  # we assume that ftn is a function of a single variable that returns
  # the function value and the first derivative as a vector of length 2
  # x0 is the initial guess at the root. The algorithm terminates when the function
  # value is within distance tol of 0, or the number of iterations exceeds max.iter
  x <- x0 # initialize
  fx <- ftn(x)
  iter <- 0
  # continue iterating until stopping conditions are met
  while ((abs(fx[3]) > tol) && (iter < max.iter)) {
    x <- x - (2*fx[1]* fx[2]) / (2*(fx[2]^2) - fx[1]*fx[3])
    fx <- ftn(x)
    iter <- iter + 1
    cat("At iteration", iter, "value of x is:", x, "\n")
  }
  
  if (abs(fx[2]) > tol) {
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
        abs(fx[2]),
        ", and the root for the function is at x = ",
        x
      )
    )
  }
} 
