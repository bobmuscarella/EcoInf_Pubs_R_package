
### Set the working directory to that location (it needs to end with '/')
setwd("/Users/au529793/Desktop/EcoInf_publications_archive/")


# ### Run this code to generate an initial archive of pending papers:
# install.packages("googlesheets4")
# library(googlesheets4)
# url <- "https://docs.google.com/spreadsheets/d/1k_Jyejd4f7E7PWbK9OHI5gkmSOymlfyA54hIfOpIm6g/edit?usp=sharing"
# pubs <- googlesheets4::read_sheet(url)
# names(pubs) <- c("Timestamp",
#                  "Ecoinf.names",
#                  "Contact.Email",
#                  "Author.list",
#                  "Title.of.Publication",
#                  "Name.of.Journal.Book",
#                  "Status",
#                  "Publication.type",
#                  "DOI",
#                  "X")
# filename <- paste0("archive/EcoInf_publications_", Sys.Date(), ".csv")
# write.csv(pubs, file=filename, row.names=F)


### Install and load the EcoInf Pubs R pacakge
library(devtools)
devtools::install_github("bobmuscarella/EcoInf_Pubs_R_package", ref="googlesheets4")
install.packages("package/EcoinfPubsRpackage_2.0.tar.gz", repos=NULL, type="source")
library(EcoinfPubsRpackage)


### Set email options
MyEmail <- "MyEmail@gmail.com"
ReportFile <- "EcoInf_publications_2017-11-27.csv"
Deadline <- "Friday Aug 28"
Salutation <- "Kind regards,\nAnne"


### Send email to get people to add DOIs to their papers
send.doi.email(ReportFile, 
               SendersEmail = MyEmail,
               Deadline = Deadline,
               Salutation = Salutation,
               DraftOnly = TRUE) # change to FALSE to send emails instead of just generating drafts


### Send emails to get people to update status of their papers
send.submitted.email(ReportFile, 
                     SendersEmail = MyEmail,
                     Deadline = Deadline,
                     Salutation = Salutation,
                     DraftOnly = TRUE) # change to FALSE to send emails instead of just generating drafts


### Generate the report as a word document
get.pubslist()
