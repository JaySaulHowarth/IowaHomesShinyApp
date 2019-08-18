library(shiny)
library(semantic.dashboard)
library(shiny.semantic)

required_packages <- c("shiny", "semantic.dashboard", "shiny.semantic")
new_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])] #Get all the ones not already installed
install.packages(new_packages) #Install all packages not already installed

shinyUI(dashboardPage(
  dashboardHeader(title = "Iowa Homes", color = "violet", inverted = TRUE, ui = uilabel("Iowa Homes"), disable = FALSE ),
  
  dashboardSidebar(
    size = "thin", color = "teal", side = "left",
    menuItem(tabName = "predictions", "Get a \n Quote", icon = uiicon("violet dollar sign icon")),
    menuItem(tabName = "sales", "View Past Sales", icon = uiicon("violet th list icon"))
  ),
  
  dashboardBody(
    tabItems(
      selected = 1,
      tabItem(
        tabName = "predictions",
        fluidRow(
          box(
            width = 16,
            title = "Enter Details",
            color = "violet",
            ribbon = TRUE,
            collapsible = FALSE,
            title_side = "top left",
            column(
              width = 8,
              uiheader("Please Enter The Following Details: ", "All Fields Are Required"),
              numericInput("TotalBsmtSF", "Total Basement Area (f^2)", value = 1000, min = 100, max = 100000, step = 10),
              numericInput("GrLivArea", "Above Ground Living Area (f^2)", value = 1000, min = 100, max = 100000, step = 10),
              sliderInput("GarageCars", "Number of Cars Your Garage Can Store", min = 0, max = 20, value = 0, step = 1, ticks = 20),
              sliderInput("TotRmsAbvGrd", "Number of Above Ground Rooms", value = 10, min = 2, max = 20, step = 1, ticks = 20),
              sliderInput("OverallQual", "Overall Quality", min = 1, max = 10, value = 5, step = 1, ticks = 10),
              submitButton("GenerateQuote")
            )
          ),
          box(
            width = 16,
            title = "Quote",
            ribbon = FALSE,
            collapsible = FALSE,
            title_side = "top",
            #uiicon("big violet dollar sign icon"),
            fluidRow(
              column(8,
                     uiicon("violet dollar sign icon")
              ),
              column(4,
                     verbatimTextOutput("prediction", placeholder = TRUE)
              )
            )
          )
        )
      )
    )
  )
)
)