# Global parameters
pacman::p_load(shiny, shinyjs,
               DT, janitor,
               readxl, tidyverse,
               flextable, lubridate,
               officer, glue, 
               gt
               # ghql, AzureAuth, jsonlite
               )


funcs <- list.files(here::here("R", "funcs"), pattern = ".R$", full.names = TRUE)

walk(funcs, source)


# set the number of eios articles scanned 
eios_val <- 1318

# set the number of outbreak inbox emails scanned
inbox_val <- 124

# set the number of signals assessed
signals_val <- 0

# Weekday
weekday <- weekdays(Sys.Date())

# Placeholder text for slide
placeholders <- list(
  list(
    'text' = glue::glue('Brief summary: '),
    'style' = entry_style <- fp_text(font.size = 14, font.family = "Segoe Condensed", bold = TRUE)
  ),
  list(
    'text' = glue::glue('Disease/condition: '),
    'style' = entry_style <- fp_text(font.size = 14, font.family = "Segoe Condensed", bold = TRUE)
  ),
  list(
    'text' = glue::glue('Number of cases: '),
    'style' = entry_style <- fp_text(font.size = 14, font.family = "Segoe Condensed", bold = TRUE)
  ),
  list(
    'text' = glue::glue('Number of deaths: '),
    'style' = entry_style <- fp_text(font.size = 14, font.family = "Segoe Condensed", bold = TRUE)
  ),
  list(
    'text' = glue::glue('CFR: '),
    'style' = entry_style <- fp_text(font.size = 14, font.family = "Segoe Condensed", bold = TRUE)
  ),
  list(
    'text' = glue::glue('Contacts: '),
    'style' = entry_style <- fp_text(font.size = 14, font.family = "Segoe Condensed", bold = TRUE)
  ),
  list(
    'text' = glue::glue('Zoonotic exposure: '),
    'style' = entry_style <- fp_text(font.size = 14, font.family = "Segoe Condensed", bold = TRUE)
  ),
  list(
    'text' = glue::glue('Location: '),
    'style' = entry_style <- fp_text(font.size = 14, font.family = "Segoe Condensed", bold = TRUE)
  )
)

placeholder.text <-
  map_chr(placeholders, ~pluck(.x, "text"))

placeholder.style <- map(placeholders, ~pluck(.x, "style"))

bps.levels <- rep(1, times = length(placeholder.text))

placeholder.final <- unordered_list(
  level_list = bps.levels,
  str_list = placeholder.text,
  style = placeholder.style
)