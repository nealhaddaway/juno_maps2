library(tidyverse)
library(readxl)

data <- read_excel("inst/shiny-examples/juno_maps/www/Crop and Country data.xlsx")

data_sum <- data %>%
  pivot_longer(cols=-c(category, crops), names_to = "country", values_to = "value")

write.csv(data_sum, 'juno_maps_data_nocode.csv', row.names = FALSE)


