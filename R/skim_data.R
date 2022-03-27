#' Skim data - get basic information about a given data set
#'
#' @param df Spark DataFrame object
#' @param vars list of variables in spark dataframe object to explore
#'
#' @return A tibble object with columns: variable name, variable type, example, missing count, missing percent, unique count, and total number of rows
#' @export
#' @importFrom dplyr stats methods
#'
#' @examples
skim_data <- function(df, vars=NULL) {
  df<-dplyr::as_tibble(df)
  if (is.null(vars) == TRUE) vars <- names(df)

  variable_type <- sapply(vars,
                          function(x) methods::is(df[, x][[1]])[1])
  missing_count <- sapply(vars,
                          function(x) sum(!stats::complete.cases(df[, x])))
  unique_count <- sapply(vars,
                         function(x) dplyr::n_distinct(df[, x]))
  data_count <- nrow(dplyr::as_tibble(df))
  Example <- sapply(vars,
                    function(x) (df[1, x]))

  dplyr::tibble(variables = vars, types = variable_type,
                Example = Example,
                missing_count = missing_count,
                missing_percent = (missing_count / data_count) * 100,
                unique_count = unique_count,
                Total_data = data_count)
}
