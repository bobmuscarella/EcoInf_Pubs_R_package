make.citations <-
  function(x){
    if(nrow(x) > 0){
      require(rcrossref)
      citations.basic <- paste0(x$'Author list', " (", x$Status, ") ", x$'Title of Publication', ". ", x$'Name of Journal/Book', ".")
      citations <- citations.basic
      if(length(x$DOI[!x$DOI %in% "" & !is.na(x$DOI)]) > 0){
        tmp.citations <- cr_cn(x$DOI[!x$DOI %in% "" & !is.na(x$DOI)], format="text", locale = "UTF-8")
        citations[!x$DOI %in% "" & !is.na(x$DOI)] <- paste(tmp.citations)
      }
      citations[which(citations=='NULL' | grepl("error =", citations))] <- paste(citations.basic[which(citations=='NULL' | grepl("error", citations))], "DOI PROVIDED IS INCORRECT / DOES NOT WORK.")
      citations <- paste0(citations, " [", x$'Ecoinf names', "]")
      return(citations)
    }
  }
