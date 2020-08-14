library(tidyverse)
library(janitor)

## EXTRACT DATA FOR THE DATABASE 
huda_akil_df <- flipAPI::DownloadXLSX("https://www.dropbox.com/s/6z8mtsgvy4phncw/Akil_HRLR_F1_F2_PhenotypeData.xlsx?dl=0", sheet = 1) %>% 
  as.data.frame() %>% 
  clean_names() %>% 
  mutate_all(as.character) %>% 
  mutate(project_name = "u01_huda_akil",
         sex = mgsub::mgsub(sex, c("Male", "Female"), c("M", "F"))) %>%   
  rename("rfid" = "rat_number") %>% 
  mutate_at(vars(matches("do[bd]")), openxlsx::convertToDate)

# using oksana's copy of data 08/14/2020
huda_akil_phenotypes_df <- flipAPI::DownloadXLSX("https://www.dropbox.com/s/htm0p31szmc2m7o/Akil_HRLR_F1_F2_PhenotypeData.xlsx?dl=0", sheet = 1) %>% # should have the rat_unique_id
  as.data.frame() %>% 
  clean_names() %>% 
  mutate_all(as.character) %>% 
  mutate(project_name = "u01_huda_akil",
         sex = mgsub::mgsub(sex, c("Male", "Female"), c("M", "F"))) %>%   
  rename("rfid" = "rat_number") %>% 
  mutate_at(vars(matches("do[bd]")), openxlsx::convertToDate) %>% 
  mutate_at(vars(matches("loco|epm|boli|distance|immobile|percent")), as.numeric) %>% 
  rename("gdna_to_palmerlab" = "g_dn_ato_palmer_lab")
# %>% 
  # mutate_at(vars(matches("")), as.factor)
huda_akil_phenotypes_df %>% summary
  
