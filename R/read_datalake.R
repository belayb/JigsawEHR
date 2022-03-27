
#' Read a tabular data file into a Spark DataFram from datalake storage account
#'
#' @param filename The name of the data file (with its extension) to be imported
#' @param folder The name of the folder with in the storage account that holds 'filename'
#'
#' @importFrom sparklyr dplyr
#'
#' @return A Spark DataFrame object
#' @export
#'
#' @examples
#' \dontrun{
#' Inpatient_Demographic <- read_datalake("Inpatient_Demographic.csv", "Inpatient")}
#'
read_datalake <- function(filename, folder){
  sc <- sparklyr::spark_connect(method = 'databricks')
  opts <- list(multiline = TRUE)
  sparklyr::spark_read_csv(sc, path = file.path('dbfs:/mnt/jigsawdatalake/MSK Project', folder, filename), opt = opts) %>%
    dplyr::collect
}
