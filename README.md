# EcoInf_Pubs_R_package
An R package to keep track of publications from the Section for Ecoinformatics and Biodiversity at Aarhus University

***Step-by-step instructions***

1. Enter all pending items (papers still with "Submitted" status at end of 2017) to the Google Form here: https://goo.gl/forms/HMlSDEYZ5SEj2XQA3

2. Download the zip file, "EcoInf_publications_archive.zip" from the "Downloads" folder of this repository. (*This should eventually be replaced by installation of package directly from GitHub*)

3. Unzip that file on your own computer and place the main folder wherever on your computer you'd like this stuff to live.

4. The unzipped folder should hold an R script ("Run_EcoInf_Pubs.R") and three subfolders (archive, package, reports).  
The R script ("Run_EcoInf_Pubs.R") simply includes the code also shown below.

5. In R, set the working directory as the main folder named "EcoInf_publications_archive".  
(You need to edit the "..." below and make sure the working directly ends with '/').
``` r
setwd(".../EcoInf_publications_archive/")
```

6. Run the following code to generate an initial archive of pending papers (i.e., those entered in step 1):
``` r
install.packages("googlesheets4")
library(googlesheets4)
url <- "https://docs.google.com/spreadsheets/d/1k_Jyejd4f7E7PWbK9OHI5gkmSOymlfyA54hIfOpIm6g/edit?usp=sharing"
pubs <- as.data.frame(read_sheet(url))
filename <- paste0("archive/EcoInf_publications_", Sys.Date(), ".csv")
write.csv(pubs, file=filename, row.names=F)
```

7. Install and load the EcoInf Pubs R package:
```
install.packages("package/EcoinfPubsRpackage_2.1.tar.gz", repos=NULL, type="source")
library(EcoinfPubsRpackage)
```

8. Set the email options.  Here are some examples, you can change as necessary.  *(Note that the argument "MyEmail" should be replaced with a text string of the Gmail address you plan to use for this.)*
``` r
MyEmail <- "MyEmail@gmail.com"
ReportFile <- "EcoInf_publications_2017-11-27.csv"
Deadline <- "Friday Aug 28"
Salutation <- "Kind regards,\nAnne"
```

9. Send emails to get people to add DOIs to their accepted papers. *(Probably no need to do this for the first time since only "submitted" papers are being carried over?).*
``` r 
send.doi.email(ReportFile, 
               SendersEmail = MyEmail,
               Deadline = Deadline,
               Salutation = Salutation,
               DraftOnly = T)
```

10. Send out emails to get people to update status of their papers.
``` r
send.submitted.email(ReportFile, 
                     SendersEmail = MyEmail,
                     Deadline = Deadline,
                     Salutation = Salutation,
                     DraftOnly = T)
```

You will of course also want to send a general email to everyone providing them with the link to the Google Form:
https://goo.gl/forms/HMlSDEYZ5SEj2XQA3

11. Once people have had a chance to reply (i.e., just before making the newsletter), generate the report as a word document.
``` r
get.pubslist()
```
Running this function should create two things:
1) a new .csv file the 'archive' folder
2) a new .docx file to the 'report' folder with the publications for the newsletter

The naming will be based on the date it is generated.



