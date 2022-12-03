halley <- function(ftn, params) {
  with(as.list(c(params)), {
    x <- x0 # initialize
    fx <- ftn(x)
    iter <- 0
    # continue iterating until stopping conditions are met
    while ((abs(fx[1]) > tol) && (iter < max.iter)) {
      x <- x - 2 * fx[1] * fx[2] / (2 * fx[2] ^ 2 - fx[1] * fx[3])
      fx <- ftn(x)
      iter <- iter + 1
    }
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
        tolerance = abs(fx[1])
      ))
    }
  })
  
} 