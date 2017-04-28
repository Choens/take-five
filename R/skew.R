#' skew
#'
#' Pearson's second skew coefficient
#' https://en.wikipedia.org/wiki/Skewness
#'
#' @param x A vector of numbers we can
#' @return Pearson's second skewness coefficient of the numbers in x.
#' 
#' @
skew <- function(x) {

    ## These will help us in a minute.
    x_median <- median(x, na.rm=TRUE)
    x_mean <- mean(x, na.rm=TRUE)
    x_sd <- sd(x, na.rm=TRUE)

    x_skew <- 3*(x_mean - x_median) / x_sd

    return(x_skew)
}
