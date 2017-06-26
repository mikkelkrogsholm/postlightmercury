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

  # This is the loop that run through the urls.
  loop_data <- pbapply::pblapply(page_urls, function(page_url){

    # Calls the api and fetches the data
    api_data <- httr::GET(
      url = "https://mercury.postlight.com/parser",
      query = list(url = page_url),
      httr::add_headers(`x-api-key` = api_key)
    )

    # Extracts the data from the api call
    api_content <- httr::content(api_data)

    # Replaces NULL with NA's so it kan beput into a tibble
    replace_na <- unlist(lapply(api_content, is.null))
    api_content[replace_na] <- NA_character_

    # Converts the data to a tibble
    df <- tibble::as_tibble(api_content)

    # Returns the tibble
    return(df)

  })

  # Rowbinds all the data into one big data frame
  all_data <- do.call(rbind, loop_data)

  # Returns the tibble
  return(all_data)
}




