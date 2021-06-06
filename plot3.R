plot3 <- function(){
  
  df <- subset(read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header =  TRUE) , (Date == "1/2/2007" | Date == "2/2/2007")) ##Taking only subset of two days while reading table
  
  plot(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Sub_metering_1,type =  "n", ylab = "Energy sub metering", xlab = "", ylim = c(0,30))
  points(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Sub_metering_1,type =  "l", col = "black")
  points(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Sub_metering_2,type =  "l", col = "red")
  points(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Sub_metering_3,type =  "l", col = "blue")

  legend("topright",lty = 1,col = c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  dev.copy(png, file = "plot 3.png", width = 800) ##Added width so that legend text will not be cut off
  dev.off()


}