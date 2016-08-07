######################################################################################################
#                                             Google Auto Complete                                   #
######################################################################################################
#' @title
#' Google Auto Complete search suggestion results.
#' 
#' @description
#' Get country specific google auto complete results. Country codes are avaliable in googleSubDomain
#' data set or wiki link[1]. 
#'
#' @param country
#' The term on which search is performed
#'
#' @param lang
#' Language of google search page
#'
#' @return
#' An list of terms which match the query
#'
#' @details
#' \code{country} make sure that results retrieved for \code{query} are local to mentioned country.
#' \code{lang} parameter is for language specific search suggestions. Check the wikipedia link[1] for
#' google domains(Country Codes).
#'
#' @examples
#' wikiEdits("Auto Complete", "in","en")
#' wikiEdits("Auto Complete", "com")
#' 'com' gives results based on the location of the user 
#'
#' @author
#' Abhinav Yedla \email{abhinavyedla@gmail.com}
#'
#' @references
#' [1] https://en.wikipedia.org/wiki/List_of_Google_domains
#'
#' @keywords
#' Google Auto Complete Suggestions
#'
#' @seealso
#' \code{\link{}}
#'
#' @note 
#' Please dont spam. Make requests only after waiting for resonable time.
#'
#' @import xml2
#'
#' @export

googleAutoComplete <-
  function(query,
           country = "com",
           lang = "en") {
    #If query is missing stop the program
    if (missing(query))
    {
      stop("Please enter query and try again")
    }
    
    #Load google sub domain data
    data(googleSubDomain,package = "googleautocomplete")
    
    #Get the domain name for a given country
    domainName <-
      as.character(googleSubDomain[googleSubDomain$TLD == country, 3])
    
    #Check if country code is correct or not
    if (identical(domainName, character(0))) {
      stop("Please re check your country short code")
    }
    
    #Construct the url
    subDomain <-
      paste0("http://clients1.", domainName)
    lang <- paste0("hl=", lang)
    query <- paste0("q=", query)
    url <-
      paste0(subDomain,
             "/complete/search?",
             lang,
             "&output=toolbar&",
             query)
    
    tryCatch({
      #Read the xml data from url
      xmlData <- read_xml(url)
      
      xmlChildren <- xml_find_all(xmlData, ".//suggestion")
      
      result <- data.frame(xml_attr(xmlChildren, "data"))
      
      colnames(result) <- "Result"
      
      return(result)
    }, error = function(ex) {
      cat("An error was detected")
      
      print(ex)
      
    }, finally = {
      cat("Please check language and country code")
      
      #if (isOpen(fh)) {
      #  close(fh);
      #  rm(fh);
      #  file.remove(filename);
      #}
      cat("done\n")
      
    })
  }