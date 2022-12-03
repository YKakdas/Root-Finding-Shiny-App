fixedpoint <- function (ftn, params)
{
  with(as.list(c(params)), {
    # Copy given arguments into local function definition
    xold <- x0
    xnew <- ftn(xold)
    iter <- 1
    while ((abs(xnew - xold) > tol) && (iter < max.iter)) {
      xold <- xnew
      xnew <- ftn(xold)
      iter <- iter + 1
    }
    if (abs(xnew - xold) > tol) {
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
        root = xnew,
        iteration = iter,
        tolerance = xnew - xold
      ))
    }
  })
  
}