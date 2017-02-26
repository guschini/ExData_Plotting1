source("read_data.R")

do_plot <- function(data = get_data()){
  with(data, plot(data$TimeTime, data$Global_active_power, type = 'l',
                  xlab = "", ylab = "Global Active Power (kilowatts)"))
}
