\name{get.pubslist}
\alias{get.pubslist}
\title{
get.pubslist
}
\description{
Generate a report of publications for the newsletter as a Word document.
}
\usage{
get.pubslist(url, ArchivePath = "archive/")
}

\arguments{
  \item{url}{
The url address for the Ecoinformatics publications database (googlesheet).
}
  \item{ArchivePath}{
The path where the archive files are stored (default is \code{archive/})
}
}
\value{
A Word document with publications.
}
