source("read_data.R")

do_plot <- function(data = get_data()){
  png(filename="plot2.png", width = 480, height = 480)
  with(data, plot(data$TimeTime, data$Global_active_power, type = 'l',
                  xlab = "", ylab = "Global Active Power (kilowatts)"))
  dev.off()
}
