library(shiny)
library(shinydashboard)
library(shinyWidgets)

source("SideBarMenu.R")


dashboardBody1 <- dashboardBody(tabItems(
    tabItem(tabName = "aaa",
            fluidRow(dropDownUI(id = "dropdown"))
            # fluidRow(chartTableBoxUI(id = "ATC_Topline"))) # render the tabBox inside a fluidRow
    
  )))
