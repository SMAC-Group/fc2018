#' Function to send a single forecast
#'
#' @param group Group number (integer)
#' @param forecast Single forecast (numeric)
#' @param key The secret key corresponding to the group number
#' @param date The date ('YYYY-MM-DD' format). Default is the date of the system plus one day.
send_forecast <- function(group, forecast, key, date = paste(Sys.Date()+1)){
  # prior verifications
  if(!is.numeric(forecast)){stop("Your forecast is not a number, please enter a number.")}
  if(!is.numeric(group)){stop("Your group is not a number, please enter a number.")}
  if(date <= Sys.Date()){stop("Forecasting is about the future, please check the date you entered. The format is YYYY-MM-DD.")}

  # sending the message
  send_message(
    mime(
      To = "unil.forecasting.instructor@gmail.com",
      From = paste0("unil.forecasting.group",group,"@gmail.com"),
      Subject = paste0("[Forecasting Unil 2018] Group ", group),
      body = paste(key, date, forecast, sep = ";")
    )
  )
}
