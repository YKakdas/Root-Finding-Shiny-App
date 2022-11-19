regula <- function(ftn, a, b, tol = 1e-9) {
  # applies the bisection algorithm to find x such that ftn(x) == 0
  # we assume that ftn is a function of a single variable
  #
  # a and b must bracket the fixed point, that is
  # a < b and ftn(a) * ftn(b) < 0
  #
  # the algorithm iteratively refines a and b and terminates when
  # b - a <= tol
  
  # check inputs
  if (a >= b) {
    cat("error: a >= b \n")
    return(NULL)
  }
  f.l <- ftn(a)
  f.r <- ftn(b)
  if (f.l == 0) {
    return(a)
  } else if (f.r == 0) {
    return(b)
  } else if (f.l * f.r > 0) {
    cat("error: ftn(a) * ftn(b) > 0 \n")
    return(NULL)
  }
  
  # successively refine a and b
  n <- 0
  while ((b - a) > tol) {
    x.m <- b - f.r * (b - a) / (x.r - x.l)
    f.m <- ftn(x.m)
    if (f.m == 0) {
      return(x.m)
    } else if (f.l * f.m < 0) {
      b <- x.m
      f.r <- f.m
    } else {
      a <- x.m
      f.l <- f.m
    }
    n <- n + 1
    cat("at iteration",
        n,
        "the root lies between",
        a,
        "and",
        b,
        "\n")
  }
  
  # return (approximate) root
  return(x.m)
}
