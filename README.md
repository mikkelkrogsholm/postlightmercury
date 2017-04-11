
<!-- README.md is generated from README.Rmd. Please edit that file -->
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

Let's have a look at the data:

``` r
str(df)
#> Classes 'tbl_df', 'tbl' and 'data.frame':    1 obs. of  14 variables:
#>  $ title         : chr "Building Awesome CMS"
#>  $ content       : chr "<div><div><div class=\"section-content\"><div class=\"section-inner sectionLayout--insetColumn\"><figure id=\"1b95\" class=\"gr"| __truncated__
#>  $ author        : chr "Jeremy Mack"
#>  $ date_published: chr "2016-10-03T12:48:58.385Z"
#>  $ lead_image_url: chr "https://cdn-images-1.medium.com/max/1200/1*zo51eqdjJ_XSU0D8Vm8P9A.png"
#>  $ dek           : chr NA
#>  $ next_page_url : chr NA
#>  $ url           : chr "https://trackchanges.postlight.com/building-awesome-cms-f034344d8ed"
#>  $ domain        : chr "trackchanges.postlight.com"
#>  $ excerpt       : chr "Awesome CMS is…an awesome list of awesome CMSes. It’s on GitHub, so anyone can add to it via a pull request."
#>  $ word_count    : int 397
#>  $ direction     : chr "ltr"
#>  $ total_pages   : int 1
#>  $ rendered_pages: int 1
```
