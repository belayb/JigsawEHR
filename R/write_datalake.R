#' write_csv_datlake - an r function for writing csv file to datalake. 
#' @parm data - An r data frame object 
#' @parm dataname - name of the dataset to be used up on saving 
#' @parm account_endpoint - azure acount endpoint (get from your admin)
#' @parm scope - the node in the Azure resource (get it from your admin)
#' @parm key - like password in azure (get it from your admin)
#' @parm container_name - the name of the container where the data to be saved 
#' 
#' The package depends on the R-package AzureStor and it will install if ot installed 
#' 
write_csv_datalake <- function(data, dataname, account_endpoint, scope, key, container_name){
if (!require("(AzureStor)")){ install.packages("AzureStor") library(AzureStor)   }
account_endpoint <- account_endpoint
account_key <- dbutils.secrets.get(scope = scope, key = key)
container_name <- container_name
bl_endp_key <- storage_endpoint(account_endpoint, key=account_key)
cont <- storage_container(bl_endp_key, container_name)
w_con <- textConnection("foo", "w")
write.csv(data, w_con)
r_con <- textConnection(textConnectionValue(w_con))
close(w_con)
upload_blob(cont, src=r_con, dest=paste0("dataname", ".csv"))
close(r_con)
}