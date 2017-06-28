#Difference Tests
#Waiter Experiment
#http://onlinelibrary.wiley.com/doi/10.1111/j.1559-1816.2002.tb00216.x/abstract

library(shiny)
library(shinydashboard)
library(shinyBS)
library(shinyjs)

jsResetCode <- "shinyjs.reset = function() {history.go(0)}"

dashboardPage(skin="blue",
              
              #Title
              dashboardHeader(title="The waiter experiment",titleWidth=450),
              
              #Sidebar
              dashboardSidebar(
                width = 260,
                sidebarMenu(
                  
                  #menuItem("Overview", tabName = "over", icon = icon("university")),
                  menuItem("Part 1", tabName = "first", icon = icon("pencil-square")),
                  menuItem("Part 2", tabName = "second", icon = icon("pencil-square")),
                  menuItem("Part 3", tabName = "third", icon = icon("pencil-square"))
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
                  tabItem(tabName = "first",
                          fluidPage(
                            sidebarLayout(
                              sidebarPanel(
                                "A study published in the Journal of Applied Social Psychology claims that giving candy to customers can increase a waiters tip by about 23%",
                                br(),br(),
                                "See if you can replicate this experiment",
                                br(),br(),
                                "Randomly assign which tables you would like the waiter to give candy and what percent the waiter will receive as a tip.",br(),
                                bsButton("tab26",label = "Randomly Assign"),br(),
                                # actionButton(inputId = "more","Generate new"),br(),
                                # textOutput("n1text"),
                                # textOutput("n2text"),
                                numericInput(inputId = "tabtip27","Enter the average tip % for the no candy tip", value = 20, step = 0.5),
                                numericInput(inputId = "tabtip28","Enter the average tip % for the tip with candy", value = 20, step = 0.5),
                                uiOutput("table1"),
                                useShinyjs(),
                                extendShinyjs(text = jsResetCode),
                                #Use jscode to disable all the buttons
                                tags$head(tags$script(HTML('
                                                           Shiny.addCustomMessageHandler("jsCode",
                                                           function(message) {
                                                           console.log(message)
                                                           eval(message.code);
                                                           }
                                                           );
                                                           '))),
                                actionButton("reset_button", "Reset")
                              ),
                              mainPanel(
                                fluidRow(
                                  column(3,
                                         bsButton("tab2",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip2",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab3",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip3",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab4",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip4",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab5",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip5",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab6",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip6",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab7",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip7",label = NULL, val = 20, width = '72px',step = 0.5)
                                         ),
                                  column(3,
                                         bsButton("tab8",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip8",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab9",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip9",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab10",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip10",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab11",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip11",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab12",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip12",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab13",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip13",label = NULL, val = 20, width = '72px',step = 0.5)
                                         ),
                                  column(3,
                                         bsButton("tab14",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip14",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab15",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip15",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab16",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip16",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab17",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip17",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab18",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip18",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab19",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip19",label = NULL, val = 20, width = '72px',step = 0.5)
                                         ),
                                  column(3,
                                         bsButton("tab20",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip20",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab21",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip21",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab22",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip22",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab23",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip23",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab24",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip24",label = NULL, val = 20, width = '72px',step = 0.5),
                                         
                                         bsButton("tab25",label = tags$img(src = 'restTable.png',width = 45)),
                                         numericInput(inputId = "tabtip25",label = NULL, val = 20, width = '72px',step = 0.5)
                                         )
                                ),
                                fluidRow(
                                  column(4,
                                         checkboxInput(inputId = "showHyp","Show the test hypotheses"),
                                         conditionalPanel("input.showHyp == true",
                                                          "H0: giving a mint does not affect the tip percentage (No candy tip = Candy tip)",
                                                          br(),br(),
                                                          "H1: giving a mint does affect the tip percentage (No candy tip < Candy tip)"
                                         )
                                         ),
                                  column(4,
                                         checkboxInput(inputId = "showTest", "Show the test values"),
                                         conditionalPanel("input.showTest == true",
                                                          textOutput("avg1"),br(),br(),
                                                          textOutput("effect"),br(),br(),
                                                          textOutput("z")
                                         )
                                         ),
                                  column(4,
                                         checkboxInput(inputId = "showPlot", "Show the plot")
                                         )
                                  
                                )
                                
                              )
                            )
                          )
                  ),
                  
                  # tabItem(tabName = "noname",
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
                  tabItem(tabName = "second",
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
                          
                          ),
                  tabItem(tabName = "third",
                          fluidRow(
                            column(3,""),
                            column(6,
                                   h1("Test your understanding"),br()
                                   )
                          ),
                          fluidRow(
                            column(6,
                                   uiOutput("chooseA"),
                                   div(dragUI("div1","A", style = "background-color:orange", 
                                              class = "dragelement"), style = "margin-left:-70%"),
                                   br()
                                   ),
                            column(6,
                                   textOutput("option1pval"),
                                   tags$head(tags$style("#option1pval{color: black;font-size: 30px;font-style: bold;}")),
                                   dropUI("di1", row_n = 1, col_n = 1,style = "background-color:lightgrey")
                                   )
                            
                          ),
                          fluidRow(
                            column(6,
                                   uiOutput("chooseB"),
                                   div(dragUI("div2","B", style = "background-color:orange", 
                                              class = "dragelement"), style = "margin-left:-70%"),
                                   br()
                            ),
                            column(6,
                                   textOutput("option2pval"),
                                   tags$head(tags$style("#option2pval{color: black;font-size: 30px;font-style: bold;}")),
                                   dropUI("di2", row_n = 1, col_n = 1,style = "background-color:lightgrey")
                            )
                            
                          ),
                          fluidRow(
                            column(6,
                                   uiOutput("chooseC"),
                                   div(dragUI("div3","C", style = "background-color:orange", 
                                              class = "dragelement"), style = "margin-left:-70%"),
                                   br()
                            ),
                            column(6,
                                   textOutput("option3pval"),
                                   tags$head(tags$style("#option3pval{color: black;font-size: 30px;font-style: bold;}")),
                                   dropUI("di3", row_n = 1, col_n = 1,style = "background-color:lightgrey")
                            )
                            
                          ),
                          fluidRow(
                            column(6,
                                   uiOutput("chooseD"),
                                   div(dragUI("div4","D", style = "background-color:orange", 
                                              class = "dragelement"), style = "margin-left:-70%"),
                                   br()
                            ),
                            column(6,
                                   textOutput("option4pval"),
                                   tags$head(tags$style("#option4pval{color: black;font-size: 30px;font-style: bold;}")),
                                   dropUI("di4", row_n = 1, col_n = 1,style = "background-color:lightgrey")
                            )
                            
                          ),
                          fluidRow(
                            column(4, 
                                   ""
                                   ),
                            column(4,br(),br(),
                                   actionButton(inputId = "submit", label = "Submit Answers")
                                   ),
                            column(4,
                                   ""
                                   )
                          )
                          )
                  
                  )
                )
              )




