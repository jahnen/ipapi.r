#'
#' @title Get IP information with IPQuery
#' @description This function queries the IPQuery API to get information about an IP address.
#' @details The function can be used to get information about the client's IP address or any other IP address.  The function supports multiple output formats including text, JSON, YAML, and XML.
#' @param ip IP address or "self" for the client's IP.  Can also be a vector of IPs.
#' @param format Desired output format ("text" or other supported formats). Defaults to "text".
#'
#' @importFrom httr2 request req_perform resp_body_string
#'
#' @return #' A list or a single element depending on the input `ip`.  If `ip` is a vector, a list of responses is returned. Otherwise, a single response is returned.  The response format depends on the `format` parameter.
#' @export
IPQuery <- function(ip = NULL, format = "text") {
  baseURL <- "https://api.ipquery.io/"
  format_query <- ifelse(format == "text", "", paste0("?format=", format))

  if (is.null(ip)) {
    ip <- ""
  } else if (length(ip) > 1) {
    return(lapply(ip, function(single_ip) {
      query(paste0(baseURL, single_ip, format_query))
    }))
  } else if(ip == 'self'){
    ip <- IPQuery()
  }
  resp <- query(paste0(baseURL, ip, format_query))
  return(resp)
}

#' Queries a resource and returns the response body as a string.
#' @title Query a resource
#' @description This function queries a resource and returns the response body as a string.
#' @param i An object representing the resource to query.  The exact nature of this object depends on the `request()` and `req_perform()` functions used.
#'
#' @importFrom httr2 request req_perform resp_body_string
#'
#' @keywords internal
#'
#'
#' @return #' A character string containing the response body.
query <- function(i) {
  i |>
    request() |>
    req_perform() |>
    resp_body_string()
}
