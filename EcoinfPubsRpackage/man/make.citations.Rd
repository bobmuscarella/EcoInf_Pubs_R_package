\name{make.citations}
\alias{make.citations}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Make a list of citations from the publication database.
}
\description{
}
\usage{
make.citations(x)
}
\arguments{
  \item{x}{
A data.frame created by reading an archive file of the publications database.
}
}
\value{
A reference for each row, based on the DOI if provided or generated with the existing entires.
}
