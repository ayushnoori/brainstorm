#' Show Markdown table.
#'
#' Read table in Markdown document. Depends on \code{knitr} and \code{kableExtra} packages.
#'
#' @param table Table to display.
#' @param height Optional parameter to set height of scroll box. Default is 300px.
#' @return \code{kable} table object.
#' @author Ayush Noori
#' @export
#' @importFrom magrittr "%>%"
show_table = function(table, height = "300px") {
  knitr::kable(table, row.names = FALSE, align = "c") %>%
    kableExtra::kable_styling(bootstrap_options = c("striped", "bordered", "hover", "responsive"), font_size=12)  %>%
    kableExtra::kable_styling(width = "100%", height = height, fixed_thead = list(enabled = T, background = "#159957"), extra_css = "margin-bottom: 1.2em;")
}
