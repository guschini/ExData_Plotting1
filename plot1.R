source("read_data.R")

do_plot <- function(data = get_data()){
  png(filename="plot1.png", width = 480, height = 480)
  hist(data$Global_active_power, col = "red", breaks = 12,
       main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
  #dev.print(png, "plot1.png", width = 480, height = 480)
  dev.off()
}
