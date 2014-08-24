# Motor Trend on Cars Shiny Application

## Summary

This application was created for the course 'Developing Data Products' from Coursera, provided by Johns Hopkins Bloomberg School of Public Health. This course was taken in August 2014.

## How to run the project locally

1. Clone this repository in a folder (e.g. ~/ folder): git clone https://github.com/andretadeu/ddp-finalproject
2. Open R or RStudio and install 'memoise' package: install.packages('memoise')
3. Run the following command - runApp('path to the cloned repository folder'). For example, if I cloned the project at /home/test, there should be a folder ddp-finalproject there. The command runApp('/home/test/ddp-finalproject/') should run the Slidy project.

## How to use the application

The application is about **mtcars** dataset. Here I filter the cars by selecting several characteristics:
  * Number of cylinders
  * Number of gears
  * Transmission Type
  * Number of carburetors

This application filters out the irrelevant content and calculate the mean of:
  * Miles per Gallon
  * Horsepower
  * Time for 1/4 mile in seconds
  * Weight.
If the filters results in an empty dataset, it will return the full dataset to avoid errors.
