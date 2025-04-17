# Unified filter function
#' Title
#'
#' @param rgb_raw A raw vector of length 3 representing Red, Green, and Blue components.
#' @param mode A string indicating the filter type. Options: "greyscale", "red", "green", "blue", or "cutoff".
#' @param cutoff Integer between 0 and 255 used for the "cutoff" mode. Default is 127.
#'
#' @return A raw vector of 3 values with the filtered RGB result.
#' @export export
#'
#' @examples example
filter_rgb <- function(rgb_raw, mode = "greyscale", cutoff = 127) {
  r <- as.integer(rgb_raw[1])
  g <- as.integer(rgb_raw[2])
  b <- as.integer(rgb_raw[3])

  if (mode == "greyscale") {
    grey <- as.raw(round(r * 0.299 + g * 0.587 + b * 0.114))
    return(rep(grey, 3))
  }

  if (mode == "red") {
    return(c(rgb_raw[1], as.raw(0), as.raw(0)))
  }

  if (mode == "green") {
    return(c(as.raw(0), rgb_raw[2], as.raw(0)))
  }

  if (mode == "blue") {
    return(c(as.raw(0), as.raw(0), rgb_raw[3]))
  }

  if (mode == "cutoff") {
    grey_val <- round(r * 0.299 + g * 0.587 + b * 0.114)
    if (grey_val < cutoff) {
      return(as.raw(c(0, 0, 0)))       # Black
    } else {
      return(as.raw(c(255, 0, 255)))   # Magenta
    }
  }

  stop("Unknown mode. Choose one of: greyscale, red, green, blue, cutoff.")
}
