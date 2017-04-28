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
    x_median <- median(take_five$winning_numbers)
    x_mean <- mean(take_five$winning_numbers)
    x_sd <- sd(take_five$winning_numbers)

    x_skew <- 3*(x_mean - x_median) / x_sd

    return(x_skew)
}
