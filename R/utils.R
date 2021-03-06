`%||%` <- function(x, y) {
  if (length(x) > 0) x else y
}

epoch_ms <- function() {
  round(as.numeric(Sys.time()) * 1000)
}

isBool <- function(x) {
  isTRUE(x) || isFALSE(x)
}

get_values_from_list <- function(list, key) {
  unlist(lapply(list, function(element) element[[key]]))
}

generate_random_id <- function() {
  paste0(epoch_ms(), "-", paste0(sample(c(0:9, letters[1:6]), 8, TRUE), collapse = ""))
}

experiment_log_metadata <- function(experiment) {
  experiment$log_other(key = "Created by", value = "cometr")
}

create_experiment_link <- function(base_url, workspace_name, project_name, experiment_key, archived) {
  if (archived) {
    experiment_link <- paste(
      base_url,
      workspace_name,
      "/",
      project_name,
      "/archived/",
      experiment_key,
      sep = ""
    )
  } else {
    experiment_link <- paste(
      base_url, workspace_name,
      "/",
      project_name,
      "/",
      experiment_key,
      sep = "")
  }
}
