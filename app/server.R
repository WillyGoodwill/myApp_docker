
library(shiny)

server = {
  shinyServer(function(input, output, session) {    
    callModule(dropDown, id = "dropdown")

    output$menu<-renderMenu({
      sidebarMenuFunc()
    })
  })
}
