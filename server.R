#Difference Tests

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
  
#Reactive for the effect size that the user selects
es <- reactive({
  return(input$ef.size)
})

#Reactive for the sample size that the user selects
n1 <- reactive({
  return(input$samp.size)
})

#Initial way of changing the color
global <- reactiveValues(clicked = FALSE)

observe({
  if(length(input$tab1)){
    if(input$tab1) global$clicked <- TRUE
  } 
})

output$table1 <- renderUI({
  if(!is.null(input$tab1) & global$clicked){
    actionButton(inputId= "tab1", label = "", 
                 style = "color: white; 
                  background-color: #1C2C5B;
                  height: 35px;
                  width: 35px;
                 "
                 )
  }
  else{
    actionButton(inputId = "tab1",label = "",
                 style = "
                  height: 35px;
                  width: 35px;
                 "
                 )
  }
})
val <- reactiveValues(btn = c())
observe({
  val$tab[2] = input$tab2
  val$tab[3] = input$tab3
  val$tab[4] = input$tab4
  val$tab[5] = input$tab5
  val$tab[6] = input$tab6
  val$tab[7] = input$tab7
  val$tab[8] = input$tab8
  val$tab[9] = input$tab9
  val$tab[10] = input$tab10
  val$tab[11] = input$tab11
  val$tab[12] = input$tab12
  val$tab[13] = input$tab13
  val$tab[14] = input$tab14
  val$tab[15] = input$tab15
  val$tab[16] = input$tab16
  val$tab[17] = input$tab17
  val$tab[18] = input$tab18
  val$tab[19] = input$tab19
  val$tab[20] = input$tab20
  val$tab[21] = input$tab21
  val$tab[22] = input$tab22
})
#The other way of chaning the oclor
observeEvent(val$tab,({
  for (i in 2:22){
    if (val$tab[i] == 1){
      updateButton(session,paste("tab",i,sep = ""), style = "color: #1C2C5B;
                      background-color: #1C2C5B;", disabled = TRUE)
    }
  }
}))

output$values <- renderText({
  es1 <- es()
  n2 <- n1()
  sigma1 = 4
  sigma2 = 4
  se1 = sqrt(((sigma1^2)/n2)+((sigma2^2)/n2))
  #diff = es1*1.5 
  diff = es1
  z = diff/se1
  pval = 2*pnorm(z,lower.tail = FALSE)
  
  paste("The p-value of the test is ", round(pval,4))
})
  
})
