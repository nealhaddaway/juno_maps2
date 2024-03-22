library(shiny)
library(plotly)
library(tidyverse)

# load data
df <- read.csv('www/juno_maps_data2.csv')


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Visualise Juno data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
          "Select data to map",
          br(),br(),
          selectInput("category", "Category:",
                      c("all" = "all",
                        "cereals" = "cereals",
                        "fruits" = "fruits",
                        "legumes" = "legumes",
                        "nuts" = "nuts",
                        "root & tuber" = "root & tuber",
                        "spices" = "spices",
                        "vegetables" = "vegetables")),
          br(),
          ' - OR - ',
          br(),br(),
          selectInput("crop", "Crop:",
                      c("all" = "all",
                        "acorns" = "acorns",
                        "adzuki beans" = "adzuki beans",
                        "akee" = "akee",
                        "akee apple" = "akee apple",
                        "alkaloid" = "alkaloid",
                        "alligator pear" = "alligator pear",
                        "allspice" = "allspice",
                        "almonds" = "almonds",
                        "amaranth" = "amaranth",
                        "anis" = "anis",
                        "aniseed" = "aniseed",
                        "apples" = "apples",
                        "apricots" = "apricots",
                        "aromatic herb" = "aromatic herb",
                        "artichokes" = "artichokes",
                        "asparagus beans" = "asparagus beans",
                        "asparagus spears" = "asparagus spears",
                        "avocado pear" = "avocado pear",
                        "avocados" = "avocados",
                        "balm" = "balm",
                        "bamboo shoots" = "bamboo shoots",
                        "bananas" = "bananas",
                        "barley" = "barley",
                        "basil" = "basil",
                        "bay laurel" = "bay laurel",
                        "bean sprouts" = "bean sprouts",
                        "beetroot" = "beetroot",
                        "bell peppers" = "bell peppers",
                        "bengal gram" = "bengal gram",
                        "berries" = "berries",
                        "bird chillies" = "bird chillies",
                        "bitter almonds" = "bitter almonds",
                        "black gram" = "black gram",
                        "black pepper" = "black pepper",
                        "black salsify" = "black salsify",
                        "borecole" = "borecole",
                        "brassica" = "brassica",
                        "brazil nuts" = "brazil nuts",
                        "brinjal" = "brinjal",
                        "broad beans" = "broad beans",
                        "broccoli" = "broccoli",
                        "brussels sprouts" = "brussels sprouts",
                        "bulbous vegetables" = "bulbous vegetables",
                        "bush beans" = "bush beans",
                        "cabbages" = "cabbages",
                        "calabrese" = "calabrese",
                        "cantaloupes" = "cantaloupes",
                        "carambola" = "carambola",
                        "caraway" = "caraway",
                        "caraway thyme" = "caraway thyme",
                        "cardamoms" = "cardamoms",
                        "cardoons" = "cardoons",
                        "carob beans" = "carob beans",
                        "carobs" = "carobs",
                        "carrots" = "carrots",
                        "cashews" = "cashews",
                        "cassava" = "cassava",
                        "catjang" = "catjang",
                        "cauliflowers" = "cauliflowers",
                        "caupi" = "caupi",
                        "cayenne peppers" = "cayenne peppers",
                        "celeriac" = "celeriac",
                        "celery" = "celery",
                        "chamomile" = "chamomile",
                        "chard" = "chard",
                        "cherimoyas" = "cherimoyas",
                        "cherries" = "cherries",
                        "chervil" = "chervil",
                        "chestnuts" = "chestnuts",
                        "chickpeas" = "chickpeas",
                        "chicory" = "chicory",
                        "chili" = "chili",
                        "chili peppers" = "chili peppers",
                        "chilies" = "chilies",
                        "chillies" = "chillies",
                        "chinese gooseberry" = "chinese gooseberry",
                        "chives" = "chives",
                        "cilantro" = "cilantro",
                        "cinnamon" = "cinnamon",
                        "citrons" = "citrons",
                        "citrus fruits" = "citrus fruits",
                        "cloves" = "cloves",
                        "coarse grains" = "coarse grains",
                        "coconuts" = "coconuts",
                        "cocoyam" = "cocoyam",
                        "collards" = "collards",
                        "common beans" = "common beans",
                        "cooking bananas" = "cooking bananas",
                        "cooking plantains" = "cooking plantains",
                        "corchorus olitorius" = "corchorus olitorius",
                        "coriander" = "coriander",
                        "cowpeas" = "cowpeas",
                        "cucumbers" = "cucumbers",
                        "cucurbit fruits" = "cucurbit fruits",
                        "cucurbit vegetables" = "cucurbit vegetables",
                        "cumin" = "cumin",
                        "damsons" = "damsons",
                        "dasheen" = "dasheen",
                        "dill" = "dill",
                        "dragon eye" = "dragon eye",
                        "dragon fruits" = "dragon fruits",
                        "drumsticks" = "drumsticks",
                        "durians" = "durians",
                        "edible fungi" = "edible fungi",
                        "eggplants" = "eggplants",
                        "endives" = "endives",
                        "fava beans" = "fava beans",
                        "feed cereals" = "feed cereals",
                        "fennel" = "fennel",
                        "field bean" = "field bean",
                        "field mustard" = "field mustard",
                        "field pea" = "field pea",
                        "figs" = "figs",
                        "filberts" = "filberts",
                        "fluted pumpkin" = "fluted pumpkin",
                        "foxtail millet" = "foxtail millet",
                        "gages" = "gages",
                        "garden chervil" = "garden chervil",
                        "garden pea" = "garden pea",
                        "garden rhubarb" = "garden rhubarb",
                        "garlic" = "garlic",
                        "gherkins" = "gherkins",
                        "ginger" = "ginger",
                        "golden gram" = "golden gram",
                        "grapefruits" = "grapefruits",
                        "green gram" = "green gram",
                        "green peppers" = "green peppers",
                        "green vegetables" = "green vegetables",
                        "greengages" = "greengages",
                        "groundnuts" = "groundnuts",
                        "guavas" = "guavas",
                        "haricot beans" = "haricot beans",
                        "hazelnuts" = "hazelnuts",
                        "hip rose" = "hip rose",
                        "hordeum vulgare" = "hordeum vulgare",
                        "horse bean" = "horse bean",
                        "horse gram" = "horse gram",
                        "horseradish" = "horseradish",
                        "hot peppers" = "hot peppers",
                        "hyssop" = "hyssop",
                        "indian colza" = "indian colza",
                        "indian rape" = "indian rape",
                        "inflorescence vegetables" = "inflorescence vegetables",
                        "irish potato" = "irish potato",
                        "jabuticaba" = "jabuticaba",
                        "jack fruit" = "jack fruit",
                        "juniper" = "juniper",
                        "kaki" = "kaki",
                        "kales" = "kales",
                        "kidney beans" = "kidney beans",
                        "kiwifruits" = "kiwifruits",
                        "kohlrabi" = "kohlrabi",
                        "kola nuts" = "kola nuts",
                        "kulthi beans" = "kulthi beans",
                        "lady fingers" = "lady fingers",
                        "leaf celery" = "leaf celery",
                        "leafy vegetables" = "leafy vegetables",
                        "leeks" = "leeks",
                        "lemons" = "lemons",
                        "lentils" = "lentils",
                        "lettuces" = "lettuces",
                        "limes" = "limes",
                        "litchis" = "litchis",
                        "locust beans" = "locust beans",
                        "longans" = "longans",
                        "loquats" = "loquats",
                        "lucuma" = "lucuma",
                        "lychees" = "lychees",
                        "macadamia nuts" = "macadamia nuts",
                        "mace" = "mace",
                        "madras gram" = "madras gram",
                        "maize" = "maize",
                        "mandarins" = "mandarins",
                        "mangaba" = "mangaba",
                        "mangifera indica" = "mangifera indica",
                        "mangoes" = "mangoes",
                        "mangosteen" = "mangosteen",
                        "manioc" = "manioc",
                        "melons" = "melons",
                        "millets" = "millets",
                        "mint" = "mint",
                        "mung beans" = "mung beans",
                        "murici" = "murici",
                        "mushroom logs" = "mushroom logs",
                        "mushrooms" = "mushrooms",
                        "mustard seed" = "mustard seed",
                        "navy beans" = "navy beans",
                        "nectarines" = "nectarines",
                        "nutmegs" = "nutmegs",
                        "oats" = "oats",
                        "okras" = "okras",
                        "olives" = "olives",
                        "onions" = "onions",
                        "oranges" = "oranges",
                        "oregano" = "oregano",
                        "palm hearts" = "palm hearts",
                        "papayas" = "papayas",
                        "paprikas" = "paprikas",
                        "parsley" = "parsley",
                        "parsnips" = "parsnips",
                        "passion fruits" = "passion fruits",
                        "pawpaw" = "pawpaw",
                        "pea beans" = "pea beans",
                        "peaches" = "peaches",
                        "peanuts" = "peanuts",
                        "pears" = "pears",
                        "peas" = "peas",
                        "pecans" = "pecans",
                        "pepper" = "pepper",
                        "persian cumin" = "persian cumin",
                        "persimmon" = "persimmon",
                        "pimiento" = "pimiento",
                        "pineapples" = "pineapples",
                        "pinto beans" = "pinto beans",
                        "pistachios" = "pistachios",
                        "pitaya" = "pitaya",
                        "plantains" = "plantains",
                        "plums" = "plums",
                        "pole beans" = "pole beans",
                        "pome fruits" = "pome fruits",
                        "pomegranates" = "pomegranates",
                        "potatoes" = "potatoes",
                        "pumpkins" = "pumpkins",
                        "queensland nut" = "queensland nut",
                        "quinces" = "quinces",
                        "radishes" = "radishes",
                        "rambutans" = "rambutans",
                        "red beet" = "red beet",
                        "red peppers" = "red peppers",
                        "rhubarb" = "rhubarb",
                        "rice" = "rice",
                        "roman chamomile" = "roman chamomile",
                        "root vegetables" = "root vegetables",
                        "rose hips" = "rose hips",
                        "rosemary" = "rosemary",
                        "runner beans" = "runner beans",
                        "rutabagas" = "rutabagas",
                        "rye" = "rye",
                        "saffron" = "saffron",
                        "safou" = "safou",
                        "sage" = "sage",
                        "salsify" = "salsify",
                        "savory" = "savory",
                        "shallots" = "shallots",
                        "shea nuts" = "shea nuts",
                        "sitao" = "sitao",
                        "snap beans" = "snap beans",
                        "sorghum grain" = "sorghum grain",
                        "sour cherry" = "sour cherry",
                        "southernpea" = "southernpea",
                        "soybeans" = "soybeans",
                        "spinach" = "spinach",
                        "spinach beet" = "spinach beet",
                        "sprouted beans" = "sprouted beans",
                        "squashes" = "squashes",
                        "stalk celery" = "stalk celery",
                        "star fruit" = "star fruit",
                        "stem vegetables" = "stem vegetables",
                        "stone fruits" = "stone fruits",
                        "strawberry pear" = "strawberry pear",
                        "string beans" = "string beans",
                        "subtropical fruits" = "subtropical fruits",
                        "swedes" = "swedes",
                        "swedish turnip" = "swedish turnip",
                        "sweet almonds" = "sweet almonds",
                        "sweet bay" = "sweet bay",
                        "sweet corn" = "sweet corn",
                        "sweet peppers" = "sweet peppers",
                        "sweet potatoes" = "sweet potatoes",
                        "sweet sorghum" = "sweet sorghum",
                        "swiss chard" = "swiss chard",
                        "taioba" = "taioba",
                        "taro" = "taro",
                        "tarragon" = "tarragon",
                        "teff" = "teff",
                        "temperate fruits" = "temperate fruits",
                        "thyme" = "thyme",
                        "tick beans" = "tick beans",
                        "tinospora crispa" = "tinospora crispa",
                        "tomatoes" = "tomatoes",
                        "triticales" = "triticales",
                        "tuber" = "tuber",
                        "turmeric" = "turmeric",
                        "turnip rooted celery" = "turnip rooted celery",
                        "turnips" = "turnips",
                        "urd" = "urd",
                        "vanilla" = "vanilla",
                        "vitis vinifera" = "vitis vinifera",
                        "walnuts" = "walnuts",
                        "water cress" = "water cress",
                        "watercress" = "watercress",
                        "watermelons" = "watermelons",
                        "wax beans" = "wax beans",
                        "wheat" = "wheat",
                        "white pepper" = "white pepper",
                        "wine grape" = "wine grape",
                        "winter wheat" = "winter wheat",
                        "yams" = "yams",
                        "yard long beans" = "yard long beans",
                        "yuca" = "yuca",
                        "zucchini" = "zucchini")),
          width=3
        ),

        # Show a plot of the generated distribution
        mainPanel(
          plotlyOutput("choropleth"),
          width=9
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  rv <- reactiveValues()
  
  observeEvent(input$crop, {
    if(input$crop=='all' && input$category=='all'){
      rv$df <- df
      data <- df %>% 
        group_by(code, country) %>% 
        summarise(value = sum(value))
      data$crop <- 'all'
      data$category <- 'all'
      data <- data[, c('crop', 'category', 'country', 'code', 'value')]
      rv$data <- subset(data, value!=0)
    } else if(input$crop!='all'){
      updateSelectInput(session, "category", selected = 'all')
      
      rv$df <- df
      data <- subset(rv$df, crop == input$crop)
      data <- data %>% 
        group_by(code, country) %>% 
        summarise(value = sum(value))
      data$crop <- input$crop
      data$category <- 'all'
      data <- data[, c('crop', 'category', 'country', 'code', 'value')]
      rv$data <- subset(data, value!=0)
    } else if(input$category!='all'){
      updateSelectInput(session, "crop", selected = 'all')
      
      rv$df <- df
      data <- subset(rv$df, category == input$category)
      data <- data %>% 
        group_by(code, country) %>% 
        summarise(value = sum(value))
      data$category <- input$category
      data$crop <- 'all'
      data <- data[, c('crop', 'category', 'country', 'code', 'value')]
      rv$data <- subset(data, value!=0)
    }
  })
  
  observeEvent(input$category, {
    if(input$crop=='all' && input$category=='all'){
      rv$df <- df
      data <- df %>% 
        group_by(code, country) %>% 
        summarise(value = sum(value))
      data$crop <- 'all'
      data$category <- 'all'
      data <- data[, c('crop', 'category', 'country', 'code', 'value')]
      rv$data <- subset(data, value!=0)
    } else if(input$category!='all'){
      updateSelectInput(session, "crop", selected = 'all')
      
      rv$df <- df
      data <- subset(rv$df, category == input$category)
      data <- data %>% 
        group_by(code, country) %>% 
        summarise(value = sum(value))
      data$category <- input$category
      data$crop <- 'all'
      data <- data[, c('crop', 'category', 'country', 'code', 'value')]
      rv$data <- subset(data, value!=0)
    } else if(input$crop!='all'){
      updateSelectInput(session, "category", selected = 'all')
      
      rv$df <- df
      data <- subset(rv$df, crop == input$crop)
      data <- data %>% 
        group_by(code, country) %>% 
        summarise(value = sum(value))
      data$crop <- input$crop
      data$category <- 'all'
      data <- data[, c('crop', 'category', 'country', 'code', 'value')]
      rv$data <- subset(data, value!=0)
    } 
  })

  # generate choropleth
  output$choropleth <- renderPlotly({
    
    # light grey boundaries
    l <- list(color = toRGB("grey"), width = 0.5)
    
    # specify map projection/options
    g <- list(
      showframe = FALSE,
      showcoastlines = TRUE,
      projection = list(type = 'Mercator')
    )
    print('success')
    
    colours <- rev(c('#3b771e', '#f0faeb'))
    
    fig <- plot_geo(rv$data)
    fig <- fig %>% add_trace(
      z = ~value, color = ~value, colors = colours,
      text = ~country, locations = ~code, marker = list(line = l)
    )
    fig <- fig %>% colorbar(title = 'Records')
    fig <- fig %>% layout(
      geo = g
    )
    
    fig
    
  })
  
}

# Run the application 
shinyApp(ui = ui, server = server)
