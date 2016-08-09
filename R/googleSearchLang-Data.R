##############################################################################
#                             Google Search Language                         #
##############################################################################
#' Goolge search language.
#'
#' @docType data
#'
#' @usage data(googleSearchLang)
#'
#' @format An data frame with 2 columns Language and Code.
#'
#' @keywords datasets
#'
#' @references 
#' https://sites.google.com/site/tomihasa/google-language-codes
#'
#' @source \href{#' https://sites.google.com/site/tomihasa/google-language-codes}
#'
#' @examples
#' data(googleSearchLang)
#' code <- googleSearchLang[googleSearchLang$Language == 'Japanese',2]
"googleSearchLang"