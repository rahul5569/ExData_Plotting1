plot1 <- function(){

  df <- subset(read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header =  TRUE) , (Date == "1/2/2007" | Date == "2/2/2007")) ##Taking only subset of two days while reading table

  hist(df$Global_active_power, col = "red", main = "Global Active Power")
  dev.copy(png, file = "plot 1.png")
  dev.off()

}

