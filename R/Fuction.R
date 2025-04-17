#' Read image as bitmap
#'
#' Read an image file and convert it into a bitmap array that gives access to raw RGB pixel data.
#'
#' @param image_path Path to the image file (e.g., JPG, PNG).
#'
#' @return A bitmap object (raw 3D RGB array).
#' @export
#'
#' @examples
#' bmp <- read_image_as_bitmap("path/to/image.jpg")
read_image_as_bitmap <- function(image_path) {
  image_obj <- magick::image_read(image_path)
  bitmap <- image_obj[[1]]
  return(bitmap)
}
