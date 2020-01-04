get.pubslist <-
function(url="", ArchivePath="archive/"){
  require(googlesheets4)
  require(rmarkdown)
  
### Set URL for the GoogleSheet
if(url %in% "") {
  url <- "https://docs.google.com/spreadsheets/d/1k_Jyejd4f7E7PWbK9OHI5gkmSOymlfyA54hIfOpIm6g/edit?usp=sharing"
}

### Read and save the google sheet and archive with today's date
pubs <- googlesheets4::read_sheet(url)
names(pubs) <- c("Timestamp",
                 "Ecoinf.names",
                 "Contact.Email",
                 "Author.list",
                 "Title.of.Publication",
                 "Name.of.Journal.Book",
                 "Status",
                 "Publication.type",
                 "DOI",
                 "X")
# pubs <- read.csv(text=gsheet2text2(url, format="csv"), stringsAsFactors=FALSE, row.names=NULL)
filename <- paste0("EcoInf_publications_", Sys.Date(), ".csv")
write.csv(pubs, file=paste0(ArchivePath, filename), row.names=F)

if(nrow(pubs) == 0){
  stop('No publications in spreadsheet!')
}

if(nrow(pubs) > 0){
  ### Load the previous archived table for comparison 
  ### This depends on list.files() correctly sorting by date...
  oldfilename <- list.files(ArchivePath)[which(list.files(ArchivePath)==filename) - 1]
  old <- read.csv(paste0(ArchivePath, oldfilename), fileEncoding="UTF-8", stringsAsFactors=FALSE)
  
  ### Get status of publication in month prior
  pubs$Status0 <- old$Status[match(pubs$Timestamp, old$Timestamp)]
  
  pubs$citation <- make.citations(pubs)
  
  pubs$group <- NA
  pubs$group[pubs$Status %in% "Accepted" & is.na(pubs$Status0)] <- "NewlyAccepted"
  pubs$group[pubs$Status %in% "Accepted" & pubs$Status0 %in% "Accepted"] <- "OldAccepted"
  pubs$group[pubs$Status %in% "Submitted"] <- "Submitted"
  
  pubs$current.report.file <- filename
  pubs$previous.report.file <- oldfilename
  
  ### Save the .csv file as an archive sortable by date to the working directory
  write.csv(pubs, file=paste0(ArchivePath, filename), row.names=F)
  save(pubs, file="tmp_refs.RData")

  ### Move template files to wd
  file.rename("package/Ecoinf_publication_reports.Rmd", "Ecoinf_publication_reports.Rmd")
  file.rename("package/word-styles-reference.docx", "word-styles-reference.docx")

  ### Render report
  render("Ecoinf_publication_reports.Rmd")
  
  ### Clean up by moving files back to template folder or reports folder
  file.rename("EcoInf_publication_reports.docx", paste0("reports/EcoInf_publication_report_", Sys.Date(), ".docx"))
  file.rename("word-styles-reference.docx", "package/word-styles-reference.docx")
  file.rename("Ecoinf_publication_reports.Rmd", "package/Ecoinf_publication_reports.Rmd")
  file.remove("tmp_refs.RData")
}
}