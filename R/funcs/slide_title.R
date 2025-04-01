
slide_title <- function(pres, data) {
  
  as_of_date <- as_date(Sys.Date() + 1)
  
  h1 <-glue::glue("Public Health Intelligence (acute events) GOARN Presentation")

  
  h2 <- format(as_of_date, "%d %B %Y")
  
  
  
  pres <- pres %>% 
    add_slide(layout = "Title Layout", master = "WHE") %>% 
    ph_with(value = h1, location = ph_location_type(type = "title")) %>% 
    ph_with(value = h2, location = ph_location_type(type = "body", id = 1))
  
  move_slide(pres, index = 7, to = 1)
  
  pres <- on_slide(pres, 7)

  pres
}