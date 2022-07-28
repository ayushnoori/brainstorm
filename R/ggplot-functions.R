#' Return base theme.
#'
#' Return base theme from the \code{ggplot2} package.
#'
#' @return \code{ggplot2} theme.
#' @author Ayush Noori
#' @export
base_theme = function() {
  ggplot2::theme_bw() +
    ggplot2::theme(

      # plot title
      plot.title = ggplot2::element_text(size = 16, hjust = 0.5, face = "bold"),

      # axis title and text
      axis.title = ggplot2::element_text(size = 12, face = "bold"),
      axis.text.x = ggplot2::element_text(size = 10),

      # strip title
      strip.text = ggplot2::element_text(size = 12, face = "bold"),

      # legend title
      legend.title = ggplot2::element_text(size = 12, face = "bold")

    )
}
