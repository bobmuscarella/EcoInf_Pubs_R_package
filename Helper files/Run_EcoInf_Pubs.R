
### Set the working directory to that location (it needs to end with '/')
setwd("/Users/au529793/Desktop/EcoInf_publications_archive/")


### Run this code to generate an initial archive of pending papers:
install.packages("gsheet")
library(gsheet)
url <- "https://docs.google.com/spreadsheets/d/1k_Jyejd4f7E7PWbK9OHI5gkmSOymlfyA54hIfOpIm6g/edit?usp=sharing"
pubs <- read.csv(text=gsheet2text2(url, format="csv"), stringsAsFactors=FALSE, row.names=NULL)
filename <- paste0("archive/EcoInf_publications_", Sys.Date(), ".csv")
write.csv(pubs, file=filename, row.names=F)


### Install and load the EcoInf Pubs R pacakge
install.packages("package/EcoinfPubsRpackage_1.0.tar.gz", repos=NULL, type="source")
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
