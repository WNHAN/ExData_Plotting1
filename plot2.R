---
title: "Week1-Exploratory Analysis-plot2"
author: "WNH"
date: "December 31, 2019"
output: html_document
---
#install packages
install.packages("lattice")
install.packages("ggplot2")
library("lattice")
library("ggplot2")
library("dplyr")
library("lubridate")

#set up workding directory and sub-directory
getwd()
setwd("c:/Users/hanwe/Documents/Datasciencecoursera/Exploratory Data Analysis")
if(!file.exists("Data")) {
  dir.create("Data")
}

#download the file from url,unzip the file and saved in the working directory
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
power_consumption <- download.file(fileurl, destfile = "./Data/power_consumption.zip", method = "curl")
if(!file.exists("power_consumption")) {
  unzip("./Data/power_consumption.zip")
}

list.files()

# load the unzipped file, format the date, and subset the file as the date required
tmp <- read.table("household_power_consumption.txt", stringsAsFactors=FALSE, na.strings = "?",
                  sep =";",header=T,dec = ".")
names(tmp) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                  "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subData <- subset(tmp,tmp$Date=="1/2/2007"|tmp$Date=="2/2/2007")
subData <-na.omit(subData)
str(subData)
head(subData)

# Transforming the Date and Time vars from characters into objects of type 
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subData$Global_active_power)

# create the plot and saved as 480X480 png format plot
GlobalActivePower <- as.numeric(subData$Global_active_power)
# Step 1: Call the pdf command to start the plot

png("rlog.png")
png(file = "c:/Users/hanwe/Documents/Datasciencecoursera/Exploratory Data Analysis/plot2.png",   # The directory you want to save the file in
    width = 480, # The width of the plot in inches
    height = 480) # The height of the plot in inches

# Step 2: Create the plot with R code
plot(datetime,GlobalActivePower,type="l",xlab="",ylab="Global Active Power (kilowatts)")

# Step 3: Run dev.off() to create the file!
dev.off()


