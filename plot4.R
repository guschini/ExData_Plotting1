source("read_data.R")

do_plot <- function(data = get_data()){
  png(filename="plot4.png", width = 480, height = 480)
  
  par(mfrow = c(2, 2))
  source("plot2.R")
  do_plot(data)
  
  with(data, plot(data$TimeTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type="l"))
  
  source("plot3.R")
  do_plot(data)
  
  with(data, plot(data$TimeTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l"))
  dev.off()
}
