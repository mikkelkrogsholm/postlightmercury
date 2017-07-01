
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/postlightmercury)](https://cran.r-project.org/package=postlightmercury)

postlightmercury
================

The goal of postlightmercury is to wrap the postlight mercury web parser API for R. With just one API request, Mercury takes any web article and returns only the relevant content — headline, author, body text, relevant images and more — free from any clutter. It’s reliable, easy-to-use and free.

Installation
------------

You can install postlightmercury from github with:

``` r
# install.packages("devtools")
devtools::install_github("56north/postlightmercury")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
## basic example code

# First get api key here: https://mercury.postlight.com/web-parser/

# Then run the code below replacing the X's wih your api key.
library(postlightmercury)

df <- web_parser(
  page_urls = "https://trackchanges.postlight.com/building-awesome-cms-f034344d8ed",
  api_key = XXXXXXXXXXXXXXXXXXXXXXX)
```
