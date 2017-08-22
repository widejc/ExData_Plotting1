plot1<- function(){
        #read data
    powerdata<-read.csv("household_power_consumption.txt", sep=";", na.strings = "?")
    #convert column to numeric
    powerdata$Global_active_power<-as.numeric(powerdata$Global_active_power)    
    #convert to date
    powerdata$Date<-as.Date(powerdata$Date,"%d/%m/%Y")
    #subset data based on specific dates
    powerdata<-subset(powerdata, powerdata$Date=="2007-02-01" | powerdata$Date=="2007-02-02")
    #extract only non NAs data
    powerdata<- powerdata[complete.cases(powerdata),]    
    #plot histogram
    png(filename = "plot1.png", width = 480, height = 480, units = 'px')
    hist(powerdata$Global_active_power, col = "red", main="Global Active Power" , xlab = "Global Active Power(kilowatts)")
    dev.off()    
        
        
}