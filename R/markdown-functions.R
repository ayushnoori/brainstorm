#' Show Markdown table.
#'
#' Read table in Markdown document. Depends on `knitr` and `kableExtra` packages.
#'
#' @param table Table to display.
#' @return `kable` table object.
#' @author Ayush Noori
#' @export
show_table = function(table) {
  kable(table, row.names = FALSE, align = "c") %>%
    kable_styling(bootstrap_options = c("striped", "bordered", "hover", "responsive"), font_size=12)  %>%
    scroll_box(width = "100%", height = "300px", fixed_thead = list(enabled = T, background = "#159957"), extra_css = "margin-bottom: 1.2em;")
}
