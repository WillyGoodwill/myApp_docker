#

library(shiny)
library(shinydashboard)
library(shinyWidgets)

#print("test")

shinyUI(fluidPage(dashboardPage(
  dashboardHeader(
     title="Modelling Tool", 
     titleWidth=290),
  dashboardSidebar1 <- dashboardSidebar(width=290,
                                        sidebarMenu(id="tabs",sidebarMenuOutput("menu")),
                                        tags$head(tags$style(".container {border:2px solid white; width: 100%;overflow-y: scroll;}")), #height:490px; 
                                        tags$head(tags$style(".dropdown {margin-left:10px;}")),
                                        tags$head(tags$style(".test {background-color: #000000;}"))
                                    ),  
dashboardBody1
)))
