plot4 <- function(){
  
  par(mfrow = c(2,2))
  df <- subset(read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header =  TRUE) , (Date == "1/2/2007" | Date == "2/2/2007"))
  
  ## 1st chart
  plot(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Global_active_power,type =  "l", ylab = "Global Active Power", xlab = "")
  
  ##2nd chart
  plot(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Voltage,type =  "l", ylab = "Voltage", xlab = "datetime")
  
  ##3rd chart
  plot(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Sub_metering_1,type =  "n", ylab = "Energy sub metering", xlab = "", ylim = c(0,30))
  points(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Sub_metering_1,type =  "l", col = "black")
  points(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Sub_metering_2,type =  "l", col = "red")
  points(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Sub_metering_3,type =  "l", col = "blue")
  legend("topright",lty = 1,col = c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", pt.cex = 0.7,cex = 0.7)

  ##4th chart
  plot(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Global_reactive_power,type =  "l", ylab = "Global_reactive_power", xlab = "datetime")

  dev.copy(png, file = "plot 4.png", width = 800) 
  dev.off()

  }