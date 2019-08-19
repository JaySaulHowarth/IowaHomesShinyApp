library(kknn)
library(RMySQL)
library(shiny)
library(semantic.dashboard)
library(shiny.semantic)


options(scipen = 999)
#' Predict the price of a house based on some user input
#'
#' This function will create a kknn model which aims to predict
#' the sale price of a house based off of the following characteristings:
#' TotalBsmtSF, GrLivArea, GarageCars, TotRmsAbvGrd, OverallQual
#' @param input
#' A collection of all the data gathered from the ui input forms
#' @param data
#' Data used to build the kknn model. Must contain the same columns as input.
#' @return The predicted price rounded to the nearest 1000
#' @export
predictPrice <- function(input, data){
  k_value <- floor(sqrt(nrow(data)))
  model <- train.kknn(formula = SalePrice~., data=data, kmax=k_value, kernel="optimal")
  prediction = predict(model, data.frame(TotalBsmtSF = input$TotalBsmtSF,
                                         GrLivArea = input$GrLivArea,
                                         GarageCars = input$GarageCars,
                                         TotRmsAbvGrd = input$TotRmsAbvGrd,
                                         OverallQual = input$OverallQual))
  return(round(prediction, -3))
}

shinyServer(function(input, output, session){
  #Connect to MySQL database
  mydb <- dbConnect(RMySQL::MySQL(), user='rscript', password='rscript', dbname='iowahomes', host='127.0.0.1', port=3306)
  data <- dbSendQuery(mydb, "SELECT GrLivArea, GarageCars, TotRmsAbvGrd, OverallQual, TotalBsmtSF, SalePrice FROM homes")
  data <- dbFetch(data, n = -1)
  dbDisconnect(mydb)


  output$prediction <- renderText({
    predictPrice(input, data = data)
  })
})
