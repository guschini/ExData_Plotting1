get_data <- function(){
  file <- "household_power_consumption.txt"
  if(!file.exists(file)){
    zipped_data <- "household_power_consumption.zip"
    if(!file.exists(zipped_data)){
      message("Downloading data ...")
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", zipped_data)
      message("Zip file downloaded")
    }
    message("Unzipping data ...")
    unzip(zipped_data)
    message("Zip file unzipped")
  }
  
  message("Reading data ...")
  # Reading "Date" column only
  # Reading 3 times are done here in order to accelerate process of reading
  # as well as allocating minimum memory
  dates <- read.table("household_power_consumption.txt", sep=";",
                      colClasses = c("character", replicate(8, "NULL")),
                      header = TRUE)
  # Detecting which row numbers needed in the original data
  date.format <- "%d/%m/%Y"
  dates <- as.Date(dates$Date, date.format)
  needed_dates <- (dates >= as.Date("01/02/2007", date.format) & dates <= as.Date("02/02/2007", date.format))
  period <- which(needed_dates %in% TRUE)
  
  # Reading column names
  cols <- read.table("household_power_consumption.txt", sep=";",
                     nrows = 1, header = TRUE)
  
  # Reading the needed rows with assigning column names
  # Since we are skipping rows at the begginning, we need to assing the original column names
  x <- read.table("household_power_consumption.txt", sep=";",
                  colClasses = c("character", "character", replicate(7, "numeric")),
                  skip = period[1]-1,
                  nrows = length(period),
                  col.names = names(cols),
                  na.strings = "?",
                  header = TRUE)
  x$DateDate <- dates[needed_dates]
  Sys.setlocale("LC_TIME", "English")
  x$WeekDay <-  weekdays(x$DateDate, abbreviate = TRUE)
  x$TimeTime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
  x  
}