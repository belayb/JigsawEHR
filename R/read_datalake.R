
#' Read a tabular data file into a Spark DataFram from datalake storage account
#'
#' @parm dir - path to the dbfs directory or container 
#' @param folder The name of the folder with in the storage account that holds 'filename'
#' @param filename The name of the data file (with its extension) to be imported
#'
#' @importFrom sparklyr dplyr
#'
#' @return A Spark DataFrame object
#' @export
#'
#' @examples
#' \dontrun{
#' Inpatient_Demographic <- read_datalake(dir = 'dbfs:/mnt/jigsawdatalake/MSK Project' ,file= "Inpatient_Demographic.csv", folder = "Inpatient")}
#'
read_datalake <- function(dir, filename, folder){
  sc <- sparklyr::spark_connect(method = 'databricks')
  opts <- list(multiline = TRUE)
  sparklyr::spark_read_csv(sc, path = file.path(dir, folder, filename), opt = opts) %>%
    dplyr::collect
}
