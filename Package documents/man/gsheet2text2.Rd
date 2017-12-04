\name{gsheet2text2}
\alias{gsheet2text2}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
gsheet2text2
}
\description{
Read a GoogleSheet.  This is a hacked version of the \code{gsheet2text} function in the \code{gsheets} package.
}
\usage{
gsheet2text2(url, format = "csv", sheetid = NULL, encoding = "UTF-8")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{url}{
url address
}
  \item{format}{
File format
}
  \item{sheetid}{
The ID of the sheet
}
  \item{encoding}{
File encoding
}
}
\value{
A data.frame
}
