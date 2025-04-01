This app produces the slides for the GOARN presentation that is produced weekly.

It follows the same structure as the morning slides app: https://github.com/whocov/phi_morning_slides


### **Inputs (all Excel files):**
- Signal App list
- Product tracker
- Tracker reports (optional)


### **Output:**
- Slide deck with the slides - the slides are produced using the R package officer().



### **Notes on infrastructure:**
- This is a Shiny App using the framework with `ui.R` and `server.R`. There is a script called `global.R` where all the scripts are sourced.
- The main code is in `R/funcs`. This includes:
  - Scripts to read and clean the input files
  - `slide_run.R` - script that compiles
  - Note: the slides are added to a slide template that already includes some slides (some of which are hidden). The template is in `data/template/slide_template.pptx`
- Some data is retrieved directly using the EMS API. The script for this is `R/funcs/ems_signals.R`
- The app has only the test version that is currently being used: https://worldhealthorg.shinyapps.io/phi_goarn_slides_test/
- Addiotnal changes are expected namely to add maps to slides


