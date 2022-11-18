fixedpoint <- function (ftn,
                        x0,
                        tol = 1e-09,
                        max.iter = 100)
{
  xold <- x0
  xnew <- ftn(xold)
  iter <- 1
  while ((abs(xnew - xold) > tol) && (iter < max.iter)) {
    xold <- xnew
    xnew <- ftn(xold)
    iter <- iter + 1
  }
  if (abs(xnew - xold) > tol) {
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
        xnew - xold,
        ", and the root for the function is at x = ",
        xnew
      )
    )
  }
}