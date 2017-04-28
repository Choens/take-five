# README

[Take Five](http://on.ny.gov/1DYGlWJ) is one of several games in the
New York State Lottery. It is supposed to be a game of chance. But, is
it? Fortunately for us, the State publishes all winning numbers since
1992 on the
State's
[Open Data](https://data.ny.gov/Government-Finance/Lottery-Take-5-Winning-Numbers/dg63-4siq) site.

Every day, the NYS Lottery selects five "winning numbers". On some
days, there is an additional "bonus number". All winning numbers are
between 1 and 39.

## Research Questions:

Assuming the winning numbers are chosen at random, each number should
account for ~2.56% of the winning numbers.

    1/39
    [1] 0.02564103

The question we seek to answer here is simple. Are the winning numbers
from Take 5 chosen at random or are some numbers more likely than
others to be selected?

- Are winning numbers across all years evenly distributed?
- Are winning numbers from this year and last year evenly distrbuted?
- Are the bonus numbers evenly distributed?

## How to run this project:

The following instructions assume you have previously installed R. If
you haven't, you may install R from the website here:
https://cran.r-project.org/

- Download the zip file containing the code: TODO
- Run [setup.R](setup.R) to make sure your computer has all the necessary
  packages installed.
- Acquire an APP TOKEN from New York State Open Data:
  https://data.ny.gov/profile/app_tokens
- Open [data-raw/take_five.R](data-raw/take_five.R).
    - In the `GET DATA` section, find the `read.socrata` function.
    - Replace `YOURAPPTOKENHERE` with your actual app token.
- Running [data-raw/take_five.R](data-raw/take_five.R) creates a data
  frame called take_five which is stored in the [data](data) folder.
- The R scripts in this folder all use this data frame. After creating
  take_five.Rda in [data](data), the R scripts in this folder may be
  run in any order.

## Data:

The data frame take_five is downloaded from Open Data New York via the
RSocrata package. To run this code, you must have an active APP TOKEN
from the State of New York. To see more about the lottery data:
https://data.ny.gov/Government-Finance/Lottery-Take-5-Winning-Numbers/dg63-4siq

## Additional Links

- To learn more about Socrata: https://socrata.com/
- To learn more about using the Socrata API:
  https://dev.socrata.com/foundry/data.ny.gov/hh4x-xmbw
- To learn more about the RSocrata package:
  https://cran.r-project.org/web/packages/RSocrata/index.html
- To see the RSocrata source code: https://github.com/Chicago/RSocrata
