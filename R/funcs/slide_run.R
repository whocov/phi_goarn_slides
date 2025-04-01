


slide_run <- function(sig,
                      # sig.detail = NULL,
                      # sig.olympic = NULL,
                      prod = NULL,
                      prod2 = NULL,
                      pres = read_pptx(here::here("data", "template", "slide_template.pptx")),
                      eios_num = 0,
                      inbox_num = 0,
                      signals_num = 0) {
  
  # -----------------------------------------------------------------------------
  # Filter triaged signals
  # sig2 <- triaged_signal_clean(sig)
  # sig2 <- signal_filter_date(sig2, date)
  # 
  # # Filter triaged signals
  # sig <- proc_file_dl(sig)
  # sig <- signal_filter_date(sig, date)
  
  # -----------------------------------------------------------------------------
  
  pres <-  read_pptx(here::here("data", "template", "slide_template.pptx"))
  print('working')
  
  pres <- slide_title(pres, sig)
  print('working1')
  
  # slide 1 -----------------------------------------------------------------
  # overview of number of signals
  pres <- pres %>% 
    # add intro slide
    slide_intro(sig, eios_num, inbox_num, signals_num)
  print('working2')
  
  
  # slide 4 -----------------------------------------
  pres <- pres %>%
    slide_signals(sig)
  
  print('working4')
  # Slide per signal
  if(!is.null(sig)){
    for(i in 1:nrow(sig)){
      pres <- pres %>%
        add_slide(layout = "Title and Content Custom", master = "WHE") %>%
        ph_with(value = sig$title[i], location = ph_location_type(type = "title")) %>% 
        ph_with(value = placeholder.final, location = ph_location_right())
    }
  }
  print('working5')
  
  if (!is.null(prod)) {
    pres <- pres %>%
      # add intro slide
      slide_products(prod, prod2)
  }
  
  return(pres)
  
}

