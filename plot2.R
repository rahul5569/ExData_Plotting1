plot2 <- function(){
  df <- subset(read.table("household_power_consumption.txt", sep = ";", na.strings = "?", header =  TRUE) , (Date == "1/2/2007" | Date == "2/2/2007")) ##Taking only subset of two days while reading table
  
  plot(strptime(with(df, paste(Date,Time)),'%d/%m/%Y %H:%M:%S'),df$Global_active_power,type =  "l", ylab = "Global Active Power(kilowatts)", xlab = "")
  
  dev.copy(png, file = "plot 2.png")
  dev.off()
  
}