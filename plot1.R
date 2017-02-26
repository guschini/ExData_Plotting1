source("read_data.R")

do_plot <- function(data = get_data()){
  hist(data$Global_active_power, col = "red", breaks = 12,
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
}
