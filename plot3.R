source("read_data.R")

do_plot <- function(data = get_data()){
  with(data, {
    plot(data$TimeTime, data$Sub_metering_1, type = 'l', col = "black",
         xlab = "", ylab = "Energy sub metering")
    lines(data$TimeTime, data$Sub_metering_2, type = 'l', col = "red")
    lines(data$TimeTime, data$Sub_metering_3, type = 'l', col = "blue")
  })
  legend(x= "topright", 
         legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"),   
         pch="-")
}
