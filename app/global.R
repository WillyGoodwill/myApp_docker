library(shiny)
library(shinydashboard)
library(shinyWidgets)

dropDownUI <- function(id, div_width = "col-xs-12 col-md-8") {
  
  ns <- NS(id)
  
  div(column(3, uiOutput(ns("class_level"))),
      column(
        width = 3,
        # selectInput(
        #   inputId = ns("selected_product"),
        #   label = h4("Product Family"),
        #   choices <- c("22","33","44"),
        #   width = "100%"
        # )
        uiOutput(ns("selected_product_ui"))
      ))
}

dropDown <- function(input, output, session) {
  
  ns <- session$ns
  
  output$class_level <- renderUI({
    selectInput(
      ns("selected_class"),
      label = h4("Classification Level"),
      choices = list(
        "apple " = "apple",
        "orange " = "orange"),
      selected = "orange"
    )})
  
  output$selected_product_ui <- renderUI({
    req(input$selected_class)
    Sys.sleep(0.2)
    ns <- session$ns
    
    if (input$selected_class == "apple") {
      my_choices <- c("foo","zoo","boo")
    } else if (input$selected_class == "orange") {
      my_choices <- c("22","33","44")
    } else {
      my_choices <- c("aa","bb","cc")
    }
    
    selectInput(inputId = ns("selected_product"),
                      label = h4("Product Family"),
                      choices = my_choices)
  })
  
}



sidebar <- dashboardSidebar(sidebarMenu(
  menuItem("aaa",tabName = "aaa"),
  menuItem("bbb", tabName = "bbb"),
  menuItem("ccc", tabName = "ccc")
))

body <- dashboardBody(tabItems(
    tabItem(tabName = "aaa",
            fluidRow(dropDownUI(id = "dropdown"))
            # fluidRow(chartTableBoxUI(id = "ATC_Topline"))) # render the tabBox inside a fluidRow
    
  )))
