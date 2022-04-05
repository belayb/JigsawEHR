#' Title
#'
#' @param df A spark data frame object
#' @param ...
#'
#' @return  min, max, median, mean, and SD of the numeric variable(s)
#' @export
#'
#' @examples
explore_numeric <- function(df, ...) {
  df<-dplyr::as_tibble(df)
  df %>%
    summarise(across(
      .cols = is.numeric,
      .fns = list(Min = min, Max = max, Median = median, Mean = mean, SD = sd), na.rm = TRUE,
      .names = "{col}_{fn}"
    ))
}
