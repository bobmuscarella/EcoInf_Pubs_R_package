send.submitted.email <- 
function(ArchiveFile=NULL, DraftOnly=FALSE, SendersEmail=NULL, Deadline=NULL, Salutation="Kind regards,\nAnne"){
  require(gmailr)
  pubs <- read.csv(paste0("archive/", ArchiveFile))
  submitted <- pubs[pubs$Status %in% "Submitted" & !is.na(pubs$Status0), ]
  dl <- ifelse(is.null(Deadline), "", paste("\n\nPlease respond by", Deadline, "to ensure the update gets into the next newsletter"))
  
  for(i in 1:length(unique(submitted$Contact.Email))){
    titles <- submitted$Title[submitted$Contact.Email %in% unique(submitted$Contact.Email)[i]]
    urls <- submitted$X[submitted$Contact.Email %in% unique(submitted$Contact.Email)[i]]
    txt <- paste0("Hello!\nJust a reminder that you can update the status of your submitted article(s) when they change status using the link(s) below:\n\n", paste0(titles, "\n", urls, collapse="\n\n"), dl, "\n\n", Salutation)
    
    tmp_email <- mime(To = as.character(unique(submitted$Contact.Email)[i]), 
                    From = SendersEmail, 
                    Subject = "EcoInf publications list", 
                    body = txt)
    if(DraftOnly) { create_draft(tmp_email) }
    if(!DraftOnly) { send_message(tmp_email) }
    }
}
