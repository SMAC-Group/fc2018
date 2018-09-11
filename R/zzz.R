# Welcome message + package loading
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Welcome to Forecasting class!")
  suppressPackageStartupMessages(require(gmailr))
  suppressPackageStartupMessages(require(fpp2))
}

# Use the downloaded JSON file as input to use_secret_file(), prior to other gmailr calls.
.onLoad <- function(libname, pkgname) {
  gmailr::use_secret_file(paste0(getwd(),"/R/forecasting-unil-2018.json"))
}

