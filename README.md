# Installation
Below are the following tools required to build and execute the application.
## R
A comprehensive list of download mirrors can be found [here](https://cran.r-project.org/mirrors.html)
## RStudio
A list of download mirrors for different operating systems can be found [here](https://www.rstudio.com/products/rstudio/download/#download)
## MySQL
A list of all MySQL tools available for download can be found [here](https://dev.mysql.com/downloads/)
> For the purpose of this application MySQL Server is required. However, MySQL Workbench may be easier to work with and will be used in the following installation guides.
## Git
Git can be downloaded [here](https://git-scm.com/downloads) and will be used to clone this repository.

Open git bash in the directory in which you would like to clone the files, then type the following to clone them:
`git clone https://github.com/JaySaulHowarth/IowaHomesShinyApp.git .`

# Required R Packages
The easiest way to install R packages is through RStudio, please make sure you already have this installed before continuing.

Once RStudio is open you should notice a tab in the top left named **console**, ensure this is selected and anything you type appears after the **>** in the console window. All of the following packages are installed using the same command: `install.packages("packageName")`

Replace **packageName** with the following package names and run the command for each:

 - kknn
 - RMySQL
 - shiny
 - semantic.dashboard
 - shiny.semantic
 
 or you could just copy and paste them all from below **;)**
`install.packages("kknn")`
`install.packages("RMySQL")`
`install.packages("shiny")`
`install.packages("semantic.dashboard")`
`install.packages("shiny.semantic")`

# Running the Application
## Importing the Database
Before the application can be ran a MySQL Database must be made for the application to communicate with. Using MySQL workbench we are going to import the **dumpiowa.sql** file.

Upon launching MySQL for the first time you will see a welcome page, below the text "MySQL Connections" you will see a box for each seperate MySQL connection you are currently maintaining. By default this will be a single box named Local Instance, clicking on this box will prompt you for the password you provided during installation.

Once the connection has been opened there will be a **Navigator** menu on the left hand side, in this menu under the **Management** section there should be a hyperlink called **Data Import/Restore**.  Once this window has been opened under **Import Options** ensure you have "Import from self contained file" selected and use the built in file browser to find and select the **dumpiowa.sql** file you cloned from the github. Under the **Default Schema to be Imported to** section press the new button and name the new schema "iowahomes". You should now have a database containing the iowahomes dataset.

## Launching the Application Via RStudio
Assuming you have successfully created the MySQL databse and imported the data then the final step is to update the database credentials within the RScript itself. Open the file **server.R** in RStudio and navigate to line 33, at this line you should find some text that looks like so:

`mydb <- dbConnect(RMySQL::MySQL(), user='rscript', password='rscript', dbname='iowahomes', host='127.0.0.1', port=3306)`

Replace rscript in both **user** and **password** with the username and password for your MySQL database.

Assuming all of the steps have been completed correctly the application will be ready to run. In the top right of the **server.R** press the  "Run App"  to launch the application.

# Using the Application
Once the application has been opened the first (and currently only) window you will see is the "Get a Quote" window. From here you can enter specific details about a home using numeric inputs and sliders, once you are ready press the "Generate Quote" button and the predicted price of a house with the following attributes will be displayed.
