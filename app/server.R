
library(shiny)

server<-function(input, output, session) {    
    #callModule(dropDown, id = "dropdown")

    output$menu<-renderMenu({
      sidebarMenuFunc()
    })
  }

