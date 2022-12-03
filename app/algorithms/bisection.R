bisection <- function(ftn, params) {
  # applies the bisection algorithm to find x such that ftn(x) == 0
  # we assume that ftn is a function of a single variable
  #
  # a and b must bracket the fixed point, that is
  # a < b and ftn(a) * ftn(b) < 0
  #
  # the algorithm iteratively refines a and b and terminates when
  # b - a <= tol
  
  # check inputs
  with(as.list(c(params)), {
    iter <- 1
    if (a >= b) {
      cat("error: a >= b \n")
      return(list(
        status = "FAIL",
        root = NA,
        iteration = iter,
        tolerance = tol
      ))
    }
    f.l <- ftn(a)
    f.r <- ftn(b)
    if (f.l == 0) {
      return(list(
        status = "SUCCESS",
        root = a,
        iteration = iter,
        tolerance = 0
      ))
    } else if (f.r == 0) {
      return(list(
        status = "SUCCESS",
        root = b,
        iteration = iter,
        tolerance = 0
      ))
    } else if (f.l * f.r > 0) {
      cat("error: ftn(a) * ftn(b) > 0 \n")
      return(list(
        status = "FAIL",
        root = NA,
        iteration = iter,
        tolerance = tol
      ))
    }
    
    # successively refine a and b
    n <- 0
    while ((b - a) > tol && (iter < max.iter)) {
      x.m <- (a + b) / 2
      f.m <- ftn(x.m)
      if (f.m == 0) {
        return(list(
          status = "SUCCESS",
          root = x.m,
          iteration = iter,
          tolerance = 0
        ))
      } else if (f.l * f.m < 0) {
        b <- x.m
        f.r <- f.m
      } else {
        a <- x.m
        f.l <- f.m
      }
      n <- n + 1
      iter <- iter + 1
    }
    
    # return (approximate) root
    return(list(
      status = "SUCCESS",
      root = (a + b) / 2,
      iteration = iter,
      tolerance = b - a
    ))
  })
  
}
