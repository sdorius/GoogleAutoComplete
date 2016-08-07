######################################################################################################
#                                             Wikipedia Page Edits                                   #
######################################################################################################
#'
#' @description
#' Get Number of edits of a wikipedia page. List of Ip Edits, Minor Edits and total Edits are returned
#'
#' @param page.title
#' Title of the page to get views
#'
#' @param language
#' Language of wikipedia page
#'
#' @return
#' An list with number of edits of a page per month from creation of page
#'
#' @details
#' \code{language} The codes represent the language codes defined by ISO 639-1 and ISO 639-3, and
#' the decision of which language code to use is usually determined by the IETF language tag policy.
#' For more details please check List_of_Wikipedias page[1]
#'
#' @examples
#' wikiEdits("United_States","en")
#'
#' @author
#' Abhinav Yedla \email{abhinavyedla@gmail.com}
#'
#' @references
#' [1] https://en.wikipedia.org/wiki/List_of_Wikipedias
#'
#' @keywords
#' Wikipedia Page Edits
#'
#' @seealso
#' \code{\link{}}
#'
#' @export

googleAutoComplete <-
  function(query,
           country = "us",
           lang = "en") {
    
    
    if (missing(query))
      stop("Please enter and try again")
    
    # if (is.null(subDomainList) || nrow(subDomainList) != 199) {
    #  if (!file.exists("RequiredData\\GoogleSubDomianList.txt"))
    #   stop("Google Sub Domian File Not Found!")
    #else
    # subDomainList <-
    #  read.delim2(file = 'RequiredData\\GoogleSubDomianList.txt', sep = "\t")
    #}
    
    
    
    
    subDomain <-
      paste0("http://clients1.", subDomainList[subDomainList$TLD == country, 3])
    lang <- paste0("hl=", lang)
    query <- paste0("q=", query)
    url <-
      paste0(subDomain,
             "/complete/search?",
             lang,
             "&output=toolbar&",
             query)
    
    
    xmlData <- read_xml(url)
    
    xmlChildren <- xml_find_all(xmlData, ".//suggestion")
    
    result <- data.frame(xml_attr(xmlChildren, "data"))
    
    colnames(result) <- "Result"
    
    return(result)
  }