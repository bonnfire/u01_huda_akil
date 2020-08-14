




## using this for sample_metadata table in genotyping
huda_df <- flipAPI::DownloadXLSX("https://www.dropbox.com/s/6z8mtsgvy4phncw/Akil_HRLR_F1_F2_PhenotypeData.xlsx?dl=0", sheet = 1) %>% 
   as.data.frame() %>% 
   clean_names() %>% 
   mutate_all(as.character) %>% 
   mutate(project_name = "u01_huda_akil",
          sex = mgsub::mgsub(sex, c("Male", "Female"), c("M", "F"))) %>%   
   rename("rfid" = "rat_number") %>% 
   select(project_name, rfid, sex) 

# original code below
# setwd("/home/apurva/Desktop/Dropbox (Palmer Lab)/Palmer Lab/Apurva Chitre/Akil_SD")
#list all files
# library(openxlsx)
# raw=read_excel("./behavioral_data/new/Akil_HRLR_F1_F2_PhenotypeData.xlsx",col_names = T)
# raw <- flipAPI::DownloadXLSX("https://www.dropbox.com/s/6z8mtsgvy4phncw/Akil_HRLR_F1_F2_PhenotypeData.xlsx?dl=0", sheet = 1) 
# raw<-as.data.frame(raw)
# #I have compiled the PND28 (actually PND17 and PND27) and adult phenotype locomotor activity, EPM, and open field data in one of the attached files:  Akil_HLRL_F1_F2_PhenotypeData.xlsx. 
# 
# colnames(raw)<-tolower(colnames(raw))
# colnames(raw)<-gsub("[[:space:]]","_",colnames(raw))
# colnames(raw)<-gsub("\\(","",colnames(raw))
# colnames(raw)<-gsub("\\)","",colnames(raw))
# 
# raw$gdnatopalmerlab<-tolower(raw$gdnatopalmerlab)
# 
# colnames(raw)[2]<-"ID"
# 
# 
# 
#dna samples sent to palmer lab
# dna_sent<-raw[which(raw$gdnatopalmerlab=="yes"),]
# 
# 
# 
# #out of 629, check how many have behavioral data
# 
# 
# 
# #Aidan Horvath, from Shelly’s lab, has compiled the ST/GT data which is located in the other 4 files.  
# #You will have to match that data by the Rat #s. The two files that contain “Akil” in the titles contain data from all the rats that were tested for ST/GT.  
# #The two files that contain “Flagel” in the titles contain a more complete set of the data, except that not all the animals are included since he had difficulty finding the data for all the rats. 
# 
# 
# #DNA actually sent to us
# 
# # set2<-read_excel("./hannah_files/AkilLab_gDNA_1st48F2s_20180404 set2.xlsx",col_names = F)
# set2 <- flipAPI::DownloadXLSX("https://www.dropbox.com/s/u0m6oypn4ks2zvz/AkilLab_gDNA_1st48F2s_20180404%20set2.xlsx?dl=0", want.col.names = F)
# 
# set2<-set2[-c(1:3),]
# colnames(set2)<-set2[1,]
# set2<-set2[-1,]
# 
# colnames(set2)[1]<-"ID"
# 
# 
# 
# # set3<-read_excel("./hannah_files/AkilLab_gDNA_F1F2crossSamples_072518 set3.xlsx",col_names = F)
# 
# set3 <- flipAPI::DownloadXLSX("https://www.dropbox.com/s/g7rgw8j977gin77/AkilLab_gDNA_F1F2crossSamples_072518%20set3.xlsx?dl=0")
# colnames(set3)
# 
# set3<-set3[-c(1:5),]
# set3_list<-list()
# temp_df<-data.frame()
# colnames(set3)<-paste0("col_",seq(from=1,to=ncol(set3)))
# 
# 
# for(i in 1:nrow(set3)){
#  if(tolower(set3$col_1[i])=="box"){
#    header_index=i
#    
#  }else{
#    temp_df<-rbind(set3[i,],temp_df)
#    
#  } 
#   
# }
# 
# 
# colnames(temp_df)<-set3[header_index,]
# 
# 
# #581+48
# 
# 
# write.xlsx(temp_df,"AkilLab_gDNA_F1F2crossSamples_072518_formatted.xlsx")
# 
# 
# rm(list=ls())
# 
# 

