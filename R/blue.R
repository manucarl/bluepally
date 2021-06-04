#' These functions provide colour palettes based on fresh and delicious blueberries.
#' @docType package
#' @name bluepally
#' @usage
#' scale_color_blueberry(palette = "main", reverse = FALSE, ...)
#' scale_fill_blueberry(palette = "main", reverse = FALSE, ...)
#' blueberry_cols()
#'
#'
#' @examples
#' library(bluepally)
#' library(ggplot2)
#'
#' blueberry_colors
#'
#' ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
#'  geom_point(size = 4) +
#'  scale_color_blueberry(palette="blue", reverse = TRUE)
#'
#' ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
#'  geom_bar() +
#'  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
#'  scale_fill_blueberry( guide = "none")
#'
#' ggplot(faithfuld, aes(waiting, eruptions, fill = density)) +
#' geom_raster() +
#'   scale_x_continuous(NULL, expand = c(0, 0)) +
#'   scale_y_continuous(NULL, expand = c(0, 0)) +
#'   theme_void()+
#'   theme(legend.position = "none")+
#'   scale_fill_blueberry(discrete=F)
#'
#' blueberry_pal("blue")(10)
#' @aliases scale_color_blueberry scale_fill_blueberry blueberry_cols
#' @importFrom ggplot2
#'
#' @export
blueberry_colors <- c(
 lighred = "#EBA79C",
 lightgreen = "#E1F1E6",
 green = "#6D8064",
 lightviolet=  "#D5C4F8",
 violet=  "#B292DE",
 darkviolet=  "#9A78D7",
 lightblue=  "#B0CFFD",
 blue=  "#3A5DAE",
 darkblue=  "#37376B"
)


#' @export
blueberry_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (blueberry_colors)

  blueberry_colors[cols]
}


#' @export
blueberry_palettes <- list(
  `violet`  = blueberry_cols("lightviolet", "violet", "darkviolet"),

  `blue`  = blueberry_cols("lightblue", "blue", "darkblue"),

  `main` = blueberry_cols("lightviolet", "violet", "darkviolet", "lightblue", "blue", "darkblue"),

  `all`   = blueberry_cols("green","lightgreen", "lightred", "lightviolet", "violet", "darkviolet", "lightblue", "blue", "darkblue")
)

#' @export
blueberry_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- blueberry_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}




#' @export
scale_color_blueberry <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- blueberry_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("blueberry_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' @export
scale_fill_blueberry <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- blueberry_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("blueberry_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

