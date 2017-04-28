## =============================================================================
## TAKE FIVE
##
## - Winning Take Five numbers from the NYS Lottery from 1992 to present.
## - When run interactively, provides a view of the data.
##
## =============================================================================


## INIT ========================================================================
library(dplyr)
library(pander)
library(RSocrata)
library(tidyr)

## GET DATA ====================================================================
## To learn more about using th Socrata API with this data set:
## https://dev.socrata.com/foundry/data.ny.gov/hh4x-xmbw
take_five <- read.socrata("https://data.ny.gov/resource/hh4x-xmbw.json?$$app_token=YOUR_APP_TOKEN")



## REVIEW DATA =================================================================
## When run in an interactive terminal, provides a view of the data for the
## analyst. If not interactive, it skips this part.
if ( interactive() ){
    pander(head(take_five))
}



## DATA MUNGING ================================================================

## Transforms " " separated values into a single column, called winning_numbers:
take_five <-
    take_five %>%
    transform(winning_numbers=strsplit(winning_numbers, split=" ")) %>%
    unnest(winning_numbers) %>%
    select(draw_date, winning_numbers=winning_numbers, bonus) %>%
    distinct()

## Sets Data Class Appropriately:
take_five$winning_numbers <- as.numeric(take_five$winning_numbers)



## REVIEW DATA ==================================================================
## Again, some more feedback for the analyst.
if ( interactive() ){
    head(take_five)
    str(take_five)
}



## SAVE ========================================================================
save(take_five, file="data/take_five.Rda")
