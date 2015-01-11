fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "household_power_consumption.zip"

if (!file.exists(fileName)){
  message("Downloading data file:" + fileName)
  download.file(fileUrl, fileName, "curl")
  unzip(fileName)
}else{
  message(paste("Data file already downloaded:", fileName))
}