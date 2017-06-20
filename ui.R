#Difference Tests
library(shiny)
library(shinydashboard)
library(shinyBS)

dashboardPage(skin="blue",
              
              #Title
              dashboardHeader(title="The waiter experiment",titleWidth=450),
              
              #Sidebar
              dashboardSidebar(
                width = 260,
                sidebarMenu(
                  
                  menuItem("Overview", tabName = "over", icon = icon("university")),
                  menuItem("Part 1", tabName = "second", icon = icon("pencil-square")),
                  menuItem("Part 2", tabName = "third", icon = icon("pencil-square"))
                )),
              
              #Content within the tabs
              dashboardBody(
                tabItems(
                  
                  tabItem(tabName = "over",
                          
                          fluidRow(
                            #column of length 12 which is the whole width
                            #I include everthing in a column though because this way there are margins and it looks better
                            column(12,
                                   "About"
                                   
                            )
                          )
                  ),
                  tabItem(tabName = "second",
                          fluidPage(
                            sidebarLayout(
                              sidebarPanel(
                                "Information",
                                actionButton(inputId = "more","Generate more")
                              ),
                              mainPanel(
                                fluidRow(
                                  column(4,
                                         bsButton("tab2",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab3",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab4",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab5",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab6",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab7",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab8",label = tags$img(src = 'dinTable.jpg',width = 45))
                                         ),
                                  column(4,
                                         bsButton("tab9",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab10",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab11",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab12",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab13",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab14",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab15",label = tags$img(src = 'dinTable.jpg',width = 45))
                                         ),
                                  column(4,
                                         bsButton("tab16",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab17",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab18",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab19",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab20",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab21",label = tags$img(src = 'dinTable.jpg',width = 45)),br(),br(),
                                         bsButton("tab22",label = tags$img(src = 'dinTable.jpg',width = 45))
                                         )
                                )
                                #uiOutput("table1")
                              )
                            )
                          )
                  ),
                  
                  # tabItem(tabName = "second",
                  #         fluidRow(
                  #           withMathJax(),
                  #           column(6,
                  #                  box(width =12,background = "blue",
                  #                      "A study published in the Journal of Applied Social Psychology claims that giving mints to customers can increase a waiters tip by about 23%",
                  #                      br(),br(),
                  #                      img(src="CandyExperiment.png",height = 125,width =250,algin = "middle"),
                  #                      br(),br(),
                  #                      "Researchers want to replicate this experiment to see if the results are accurate",
                  #                      br(),br(),
                  #                      "How likely are the researches to detect a difference when you change the effect size and sample size."
                  #                      ),
                  #                  numericInput(inputId = "ef.size", "Adjust the effect size", min = 0 , max = 10, value = 0.41,step = 0.01),
                  #                  numericInput(inputId = "samp.size", "Adjust the sample size", min = 0, max = 1000, value = 20)
                  #                  ),
                  #           column(6,
                  #                  box(width = 12, background = "blue",
                  #                      "H0: giving a mint does not affect the tip percentage (No candy tip = Candy tip)",
                  #                      br(),br(),
                  #                      "H1: giving a mint does affect the tip percentage (No candy tip not equal to Candy tip)"
                  #                      ),
                  #                  textOutput("values"),
                  #                  tags$head(tags$style("#values{color: black;font-size: 30px;font-style: bold;}")),
                  #                  h4("Did the researchers detect a difference? ")
                  #                  )
                  #         )
                  # ),
                  tabItem(tabName = "third",
                          fluidRow(
                            withMathJax(),
                            column(6,
                                   box(width =12,background = "blue",
                                       "A study published in the Journal of Applied Social Psychology claims that giving mints to customers can increase a waiters tip by about 23%",
                                       #br(),br(),
                                       #img(src="CandyExperiment.png",height = 125,width =250,algin = "middle"),
                                       br(),br(),
                                       "Researchers want to replicate this experiment to see if the results are accurate",
                                       br(),br(),
                                       "How likely are the researches to detect a difference when you change the effect size and sample size."
                                   ),
                                   numericInput(inputId = "ef.size", "Adjust the effect", min = 0 , max = 100, value = 1.5,step = 0.5),
                                   numericInput(inputId = "samp.size", "Adjust the sample size", min = 0, max = 1000, value = 20)
                            ),
                            column(6,
                                   box(width = 12, background = "blue",
                                       "H0: giving a mint does not affect the tip percentage (No candy tip = Candy tip)",
                                       br(),br(),
                                       "H1: giving a mint does affect the tip percentage (No candy tip not equal to Candy tip)"
                                   ),
                                   textOutput("values"),
                                   tags$head(tags$style("#values{color: black;font-size: 30px;font-style: bold;}")),
                                   h4("Did the researchers detect a difference? ")
                            )
                            )
                          
                          )
                  
                  )
                )
              )




