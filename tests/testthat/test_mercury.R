library(webpageparser)
library(testthat)
context("Testing web_parser")

api_key <- readline("Paste in your API key here: ")

parsed_data <- web_parser(
  page_urls = "https://www.r-bloggers.com/how-and-when-ridge-regression-with-glmnet/",
  api_key = api_key
)

test_that("the web parser works with one url", {
  expect_equal(dim(parsed_data), c(1, 14))
})

#

urls <- c(
  "https://www.r-bloggers.com/how-and-when-ridge-regression-with-glmnet/",
  "http://www.dr.dk/nyheder/politik/ammitzboell-ingen-gyldne-haandtryk-i-den-offentlige-sektor",
  "https://www.b.dk/nationalt/da-kirkegaarden-blev-selfiernes-lyseroede-forlystelsespark"
)

parsed_data <- web_parser(
  page_urls = urls,
  api_key = api_key
)

test_that("the web parser works with three urls", {
  expect_equal(dim(parsed_data), c(3, 14))
})

