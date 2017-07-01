#### web_parser #### ----
#' web_parser
#'
#' With just one API request, Mercury takes any web article and returns only the
#' relevant content — headline, author, body text, relevant images and more —
#' free from any clutter. It’s reliable, easy-to-use and free.
#'
#' @param page_urls One or more urls to be parsed
#' @param api_key Key for the API
#'
#' @return a tibble
#' @export
#'
#' @source \url{https://mercury.postlight.com/web-parser/}
#'
#' @examples
#' \dontrun{
#' # First get api key here: https://mercury.postlight.com/web-parser/
#'
#' # Then run the code below replacing the X's wih your api key.
#'
#' web_parser(page_urls = "https://trackchanges.postlight.com/building-awesome-cms-f034344d8ed",
#'            api_key = XXXXXXXXXXXXXXXXXXXXXXX)
#' }

web_parser <- function(page_urls, api_key){

  if(missing(page_urls)) stop("One or more urls must be provided")
  if(missing(api_key)) stop("API key must be provided. Get one here: https://mercury.postlight.com/web-parser/")

  # Create a list of calls to make to the server using the crul package.
  # We will make asynchronous calls to speed up everything.
  async <- lapply(page_urls, function(page_url){
    crul::HttpRequest$new(
      url = "https://mercury.postlight.com/parser",
      headers = list(`x-api-key` = api_key)
    )$get(query = list(url = page_url))
  })

  # Now we supply those calls to our async client
  res <- crul::AsyncVaried$new(.list = async)

  # We execute the calls
  output <- res$request()

  # Next extract the content from the api calls
  api_content <- lapply(output, function(x) x$parse("UTF-8"))
  api_content <- lapply(api_content, jsonlite::fromJSON)
  api_content <- null_to_na(api_content)

  # Converts the data to a tibble
  df <- purrr::map_df(api_content, tibble::as_tibble)

  # Returns the tibble
  return(df)
}

#### null_to_na #### ----
# Is not exported. It is a helper.

#' Turns NULL values in a list into NAs.
#'
#' @param mylist is a list, where the NULL values are to be turned into NAs.

null_to_na <- function (mylist) {
  lapply(mylist, function(x) {
    if (is.list(x)) {
      null_to_na(x)
    }
    else {
      if (is.null(x))
        NA_character_
      else x
    }
  })
}


