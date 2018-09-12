# Welcome message + package loading
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Welcome to Forecasting class!")
  suppressPackageStartupMessages(require(gmailr))
  suppressPackageStartupMessages(require(fpp2))
  suppressPackageStartupMessages(require(cranlogs))
}

# Use the downloaded JSON file as input to use_secret_file(), prior to other gmailr calls.
.onLoad <- function(libname, pkgname) {
  pkg_path <- .libPaths()
  if (length(pkg_path) == 1) {
    gmailr::use_secret_file(paste0(pkg_path,"/fc2018/data/forecasting-unil-2018.json"))
  } else {
    for(i in seq_along(pkg_path)) {
      try(suppressWarnings(gmailr::use_secret_file(
        paste0(pkg_path[i],"/fc2018/data/forecasting-unil-2018.json"))), silent=T)
    }
  }
}

