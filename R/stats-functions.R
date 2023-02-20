#' Compute model summary.
#'
#' Compute coefficients and confidence intervals from a fitted model object (e.g., from \code{lme4::lmer} or \code{limma::lmFit}).
#'
#' @param model Fitted model object.
#' @param label Optional parameter to add a label to the resulting \code{data.table}.
#' @return \code{data.table} object with coefficients and CIs.
#' @author Ayush Noori
#' @export
#' @importFrom magrittr "%>%"
summarize_model = function(model, label = NULL) {

  # compute summary
  my_summary = summary(model)

  # compute CIs
  my_confint = confint(model) %>%
    data.table::as.data.table(keep.rownames = "Comparison")

  # model results
  model_results = my_summary$coefficients %>%
    data.table::as.data.table(keep.rownames = "Comparison") %>%
    data.table::merge.data.table(my_confint, by = "Comparison") %>%
    data.table::setnames(c("2.5 %", "97.5 %"), c("Lower CI", "Upper CI"))

  if(!is.null(label)) {
    model_results = model_results %>%
      .[, Label := ..label] %>%
      data.table::setcolorder(c("Label", "Comparison"))
  }

  # return model results
  return(model_results)

}
