gsheet2text2 <-
function (url, format = "csv", sheetid = NULL, encoding="UTF-8") 
{
  address <- construct_download_url(url = url, format = format, 
                                    sheetid = sheetid)
  page <- httr::GET(address)
  if (stringr::str_detect(page$headers$`content-type`, stringr::fixed("text/html"))) {
    stop("Unable to retrieve document. Is 'share by link' enabled for this sheet?")
  }
  content <- httr::content(page, as = "text", encoding=encoding)
  return(content)
}
