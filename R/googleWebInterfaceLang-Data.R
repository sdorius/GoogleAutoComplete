##############################################################################
#                     Google Search Web Interface Language                   #
##############################################################################
#' Google search web interface language.
#'
#' @docType data
#'
#' @usage data(googleWebInterfaceLang)
#'
#' @format A data frame with 2 columns: Language and Code.
#'
#' @keywords datasets
#'
#' @references 
#' https://sites.google.com/site/tomihasa/google-language-codes
#'
#' @source \href{#' https://sites.google.com/site/tomihasa/google-language-codes}
#'
#' @examples
#' data(googleWebInterfaceLang)
#' code <- googleWebInterfaceLang[googleWebInterfaceLang$Language == 'Hindi',2]
"googleWebInterfaceLang"
