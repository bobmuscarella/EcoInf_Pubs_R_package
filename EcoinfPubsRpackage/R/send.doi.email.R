send.doi.email <-
function(ArchiveFile=NULL, DraftOnly=FALSE, SendersEmail=NULL, Deadline=NULL, Salutation="Kind regards,\nAnne"){
  require(gmailr)
  pubs <- read.csv(paste0("archive/", ArchiveFile))
  need.doi <- pubs[pubs$Status %in% "Accepted" & pubs$DOI %in% "", ]
  dl <- ifelse(is.null(Deadline), "", paste("\n\nPlease respond by", Deadline, "to ensure the update gets into the next newsletter."))

  for(i in 1:length(unique(need.doi$Contact.Email))){
    titles <- need.doi$'Title of Publication'[need.doi$'Contact Email' %in% unique(need.doi$'Contact Email')[i]]
    urls <- need.doi$'...10'[need.doi$'Contact Email' %in% unique(need.doi$'Contact Email')[i]]
    txt <- paste0("Hello!\nCongratulations on your publication(s).  Please add a DOI using the link(s) below:\n\n", paste0(titles, "\n", urls, collapse="\n\n"), dl, "\n\n", Salutation)
    
    tmp_email <- mime(To = as.character(unique(need.doi$'Contact Email')[i]), 
                      From = SendersEmail, 
                      Subject = "Please add DOI for EcoInf publication(s)", 
                      body = txt)
    
    if(DraftOnly) { create_draft(tmp_email) }
    if(!DraftOnly) { send_message(tmp_email) }
    }
}
