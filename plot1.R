---
title: "Week1-Exploratory Analysis-plot1"
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
tmp <- read.table("household_power_consumption.txt", sep =";",header=T, as.is=T, stringsAsFactors = F)
tmp$Date <-as.Date(tmp$Date,"%d/%m/%Y")
format(tmp$Date, format="%Y-%m-%d")
subData <- subset(tmp, tmp$Date>="2007-02-01" & tmp$Date<="2007-02-02")
#deleted all the rows that had NA values
subData <-na.omit(subData)
str(subData)
head(subData)
tail(subData)

# create the plot and saved as 480X480 png format plot
GlobalActivePower <- as.numeric(subData$Global_active_power)
# Step 1: Call the pdf command to start the plot

png("rlog.png")
png(file = "c:/Users/hanwe/Documents/Datasciencecoursera/Exploratory Data Analysis/plot1.png",   # The directory you want to save the file in
    width = 480, # The width of the plot in inches
    height = 480) # The height of the plot in inches

# Step 2: Create the plot with R code
hist(GlobalActivePower, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col = "Red")

# Step 3: Run dev.off() to create the file!
dev.off()


