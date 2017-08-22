plot2<-function(){
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
        #adding Date Time column
        DateTime<-paste(powerdata$Date, powerdata$Time)
        powerdata<-cbind(powerdata, DateTime)
        powerdata$DateTime<-strptime(powerdata$DateTime, "%Y-%m-%d %H:%M:%S")
        png(filename = "plot2.png", width = 480, height = 480, units = 'px')
        
        #plot 
        plot(powerdata$DateTime,powerdata$Global_active_power, type="l",col="black",xlab="",ylab="Global Active Power(kilowatts)")
        dev.off()
        
        ;
        
        
        
}