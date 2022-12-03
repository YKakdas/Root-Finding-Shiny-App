newton <- function(ftn, params) {
  # Newton_Raphson algorithm for solving ftn(x)[1] == 0
  # we assume that ftn is a function of a single variable that returns
  # the function value and the first derivative as a vector of length 2
  # x0 is the initial guess at the root. The algorithm terminates when the function
  # value is within distance tol of 0, or the number of iterations exceeds max.iter
  with(as.list(c(params)), {
    x <- x0 # initialize
    fx <- ftn(x)
   
    iter <- 0
    # continue iterating until stopping conditions are met
    while (!is.nan(fx[1]) && (abs(fx[1]) > tol) && (iter < max.iter)) {
      x <- x - fx[1] / fx[2]
      fx <- ftn(x)
      iter <- iter + 1
    }
    # output depends on success of algorithm
    if (is.nan(fx[1]) || abs(fx[1]) > tol) {
      return(list(
        status = "FAIL",
        root = NA,
        iteration = iter,
        tolerance = tol
      ))
    } else {
      return(list(
        status = "SUCCESS",
        root = x,
        iteration = iter,
        tolerance = fx[1]
      ))
    }
  })
} 