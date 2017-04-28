## #############################################################################
## ANALYSIS
##
## Research Questions
## - Are the New York State Lottery Take-Five Numbers normally distributed?
##
## #############################################################################



## INIT ========================================================================
library(dplyr, lib="~/lib")
library(pander, lib="~/lib")
source("R/skew.R")



## DATA ========================================================================
load("data/take_five.Rda")



## TAKE_FIVE ===================================================================
str(take_five)



## DESCRIPTIVE STATISTICS ======================================================

## Most of what we want can be easily gotten from summary.
summary(take_five)

## We will discuss this command.
## - The %>% is a "pipe". It prevents us from having to make multiple temporary tables
##   when we need to do a multi-step transfortmation.
## - This similar to SQL. If you know SQL (or SAS PROC SQL), this should be familiar.
## - The command pander takes a data frame (and other objects) and makes a pretty
##   markdown compaditble table out of it.
##
## This calculates the percentage distribution by number.
take_five %>%
    group_by(winning_numbers) %>%
    summarize(N = n(),
              P = round(100*n() / nrow(take_five),2) ) %>%
    pander(.)

## Note: Considering the large sample size here, I would have expected those to be closer.

## - This also calculates the percentage of winning numbers.
## - Handles N count separately.
## - Old-school function.
round(prop.table(table(take_five$winning_numbers))*100,2)

## Note: the percents are the same!

## Why am I showing you two ways to do the same thing?
## Both have their place. You will see both if you read R code on the Internet.



## GRAPHICS ====================================================================

## Draws a histogram, with a red line through it for the expected value of all
## numbers if they are evenly distributed.
hist(take_five$winning_numbers, breaks=0:40, freq = FALSE)
abline(h = 1/39, col="red", lwd=3)

## Note: Some of those do seem to deviate from the expected rate.



## STATISTICAL TESTING =========================================================

## Chi Squared Test (Goodness of Fit)
chisq.test(take_five$winning_numbers)

## Note: Yikes!

## Are the winning numbers skewed?
## Base R doesn't have a skew function. So, I wrote my own. And gave it to you.
## We will discuss more.
take_five_skew <- skew(take_five$winning_numbers)

## Note: Not really

## Confession: I assumed they would be randomly distributed when I chose this
## data set. I do NOT know why we are getting these results.
