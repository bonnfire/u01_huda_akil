## extract akil DNA
# first 384 gDNA samples of X__ 
akil_gdna <- openxlsx::read.xlsx("~/Dropbox (Palmer Lab)/Palmer Lab/Bonnie Lin/U01/Huda_Akil_SD/AkilLab_gDNA_SDO37to422_ToPalmerLab20201130.xlsx")
names(akil_gdna) <- make_clean_names(akil_gdna[3,] %>% unlist() %>% as.character)
akil_gdna_df <- akil_gdna[-c(1:3), ] %>% 
  distinct() %>% 
  subset(box != "Box") %>% 
  mutate(project_name = "u01_huda_akil_sd") # 385 observations, one dupe for two dna extractions XX need to resolve