#' Compute model summary.
#'
#' Compute coefficients and confidence intervals from a fitted model object (e.g., from \code{lme4::lmer} or \code{limma::lmFit}).
#'
#' @param model
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
    as.data.table(keep.rownames = "Comparison")

  # model results
  model_results = my_summary$coefficients %>%
    as.data.table(keep.rownames = "Comparison") %>%
    merge(my_confint, by = "Comparison") %>%
    setnames(c("2.5 %", "97.5 %"), c("Lower CI", "Upper CI"))

  if(!is.null(label)) {
    model_results = model_results %>%
      .[, Label := ..label] %>%
      setcolorder(c("Label", "Comparison"))
  }

  # return model results
  return(model_results)

}
