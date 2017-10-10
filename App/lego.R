library(shiny)
mySets <- read.csv("Data/brickset_sets_20171003.csv", stringsAsFactors = F)
  
# Define UI for app that draws a histogram
ui <- fluidPage(title="Lego", 
  titlePanel(h1("Header panel")),
  sidebarLayout(
    sidebarPanel(selectInput(inputId = "colorPicker", label = "Select a color", choices = mySets)),
    mainPanel(textOutput("color"), img(src="http://cache.lego.com/media/bricks/5/1/302324.jpg"))
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  output$mySets <- renderText({mySets$set_num})
  
  output$color <- renderText({paste(input$colorPicker, mySets$QtyOwned[mySets$SetNumber==input$colorPicker], sep=": " )})
  
}

shinyApp(ui = ui, server = server)

