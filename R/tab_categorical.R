#' Tabulate categorical data
#'
#' @param df a spark data frame object
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
tab_categorical <- function(df, ...){
  df<-dplyr::as_tibble(df)
  df_tab<- df%>%
    dplyr::select(...)%>%
    tidyr::gather(., "var", "value") %>%
    dplyr::count(var, value) %>%
    dplyr::group_by(var) %>%
    dplyr::mutate(prop = prop.table(n))

  knitr::kable(df_tab)
}
