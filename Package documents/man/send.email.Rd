\name{send.email}
\alias{send.doi.email}
\alias{send.submitted.email}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
send.email
}
\description{
Sends email to remind people to either (1) add a DOI to an accepted article or (2) update status of all submitted papers once the status of the paper changes.
}
\usage{
send.doi.email(ArchiveFile=NULL, DraftOnly=FALSE, SenderEmail=NULL, 
                Deadline=NULL, Salutation="Kind regards,\nAnne")

send.submitted.email(ArchiveFile=NULL, DraftOnly=FALSE, SenderEmail=NULL, 
                     Deadline=NULL, Salutation="Kind regards,\nAnne")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ArchiveFile}{
The publications file to use for sending email.
}
  \item{DraftOnly}{
If set to TRUE, then only draft emails are created, not sent.
}
  \item{SenderEmail}{
Gmail address to send the emails from.
}
  \item{Deadline}{
Text to insert as the deadline.  If this is inserted, a sentence is printed in the email that says, "Please respond by [Deadline] to ensure the update gets into the next newsletter."
}
  \item{Salutation}{
Text to include at the end of the email.
}
}

