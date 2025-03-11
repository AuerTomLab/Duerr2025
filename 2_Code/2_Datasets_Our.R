#---------------------------------#
# Datasets - Dürr et al. 2025 ----
#---------------------------------#


## Front Matter ----
### Load Packages & Resources ----
source("2_Code/1_Libraries.R")


#------------------------------  Description  ---------------------------------#

## Registration
# We registered our ALPNs to the DsecF template brain [reference] 


## Left Right Confocal Mirroring
# We generated the images using the ZEISS 710 LSM.
# We noted that images were mirrored by the light path and thereby "left" and "right" in "real-life" are shown mirrored on the images aquired.
# Meaning, when looking anterior onto the image: The left side of the image is corresponding to the left hemisphere of the actual fly brain.
# Therefore we corrected for this issue when setting the file names of the traces.
# "R"/"RH" and "L"/"LH" stands for the real "left" and "right", not the orientation in the image itself. (in figures depicting the lateral horn we also used "LH", this will be updated)
# We mirrored "R"-neurons (left in the image), using the IS2 template space, to the right hemisphere, combined them with the "L"-neurons and exported them; see "Mirror & Bridging Registration"
# (3.3_Dsec_ALPNs_DsecF_all, is not yet left-right corrected!)

## Abbreviations
# [loc]   - location
# [nl]    - neuron list
# [Dsec]  - Drosophila sechellia
# [Dmel]  - Drosophila melanogaster
# [reg]   - registered to DsecF/DsecI in D.sechellia; registered to IS2 in D.melanogaster
# [Ns]    - Neurons
# [ALPNs] - Antennal Lobe Projection Neurons
# [R]     - Right Hemisphere
# [L]     - Left Hemisphere



#------------------------------------------------------------------------------#


## Register, Sort and Export Traces ----

### Dsec ALPNs - Traces by Thomas Auer ----
#### Loop through traces in the folder

filenames = dir(path = loc_Dsec_ALPNs_Thomas, pattern="*.swc")
for (i in filenames)
{
  final_name <- i
  i <- paste(loc_Dsec_ALPNs_Thomas, i, sep = "")
  
  # get Trace
  trace <- read.neuron(i)
  
  # get Trace name; Tom image labels
  name <- str_extract(i,"TA_[[:digit:]]+_[[:digit:]]+")
  
  # get Registration File
  reg_file <- list.files("./1_Data/3_Registration/03_CMTK_Registration_Dsec/1_HQ_Registrations/1.3_HQ_Registrations/warp/", name)
  reg_file <- paste("./1_Data/3_Registration/03_CMTK_Registration_Dsec/1_HQ_Registrations/1.3_HQ_Registrations/warp/", reg_file, sep = "")
  
  # scale Tracey
  trace_scaled <- scale(trace, center = FALSE, scale = c(2.16796,2.16796,1))
  
  # register Trace
  trace_reg = xform(trace_scaled, reg_file, transformtype = "warp", FallBackToAffine = TRUE)
  # output formatted file
  output_file <-  paste(loc_Dsec_ALPNs_DsecF_all, final_name, sep = "")
  write.neuron(trace_reg, file = output_file, dir = loc_Dsec_ALPNs_DsecF_all, format="swc", ext = ".swc")    
  
  # Sort for left and right hemisphere
  if (grepl("RH",final_name, fixed = TRUE)){
    output_file_R <-  paste(loc_Dsec_ALPNs_DsecF_R, final_name, sep = "")
    write.neuron(trace_reg, file = output_file_R, dir = loc_Dsec_ALPNs_DsecF_R, format="swc", ext = ".swc")
  }
  else{
    output_file_L <-  paste(loc_Dsec_ALPNs_DsecF_L, final_name, sep = "")
    write.neuron(trace_reg, file = output_file_L, dir = loc_Dsec_ALPNs_DsecF_L, format="swc", ext = ".swc")
  }
}


### Dsec ALPNs - Traces by Benedikt Dürr ----
#### Loop through traces in the folder

filenames = dir(path = loc_Dsec_ALPNs_Benedikt, pattern="*.swc")
for (i in filenames)
{
  final_name <- i
  i <- paste(loc_Dsec_ALPNs_Benedikt, i, sep = "")
  
  # get Trace
  trace <- read.neuron(i)
  
  # get Trace name; Benedikt image labels
  name <- str_extract(i,"BD_M[[:digit:]]+")
  
  # get Registration File
  reg_file <- list.files("./1_Data/3_Registration/03_CMTK_Registration_Dsec/1_HQ_Registrations/1.3_HQ_Registrations/warp/", name)
  reg_file <- paste("./1_Data/3_Registration/03_CMTK_Registration_Dsec/1_HQ_Registrations/1.3_HQ_Registrations/warp/", reg_file, sep = "")
  
  # scale Trace
  trace_scaled <- scale(trace, center = FALSE, scale = c(2.16796,2.16796,1))
  
  # register Trace
  trace_reg = xform(trace_scaled, reg_file, transformtype = "warp", FallBackToAffine = TRUE)
  
  # output formatted file
  output_file <-  paste(loc_Dsec_ALPNs_DsecF_all, final_name, sep = "")
  write.neuron(trace_reg, file = output_file, dir = loc_Dsec_ALPNs_DsecF_all, format="swc", ext = ".swc")    
  
  # Sort for left and right hemisphere
  if (grepl("RH",final_name, fixed = TRUE)){
    output_file_R <-  paste(loc_Dsec_ALPNs_DsecF_R, final_name, sep = "")
    write.neuron(trace_reg, file = output_file_R, dir = loc_Dsec_ALPNs_DsecF_R, format="swc", ext = ".swc")
  }
  else{
    output_file_L <-  paste(loc_Dsec_ALPNs_DsecF_L, final_name, sep = "")
    write.neuron(trace_reg, file = output_file_L, dir = loc_Dsec_ALPNs_DsecF_L, format="swc", ext = ".swc")
  }
}


### Dsec ALPNs - Traces by Justine Pascual ----
#### Loop through the files in the folder

filenames = dir(path = loc_Dsec_ALPNs_Justine, pattern="*.swc")
for (i in filenames)
{
  final_name <- i
  i <- paste(loc_Dsec_ALPNs_Justine, i, sep = "")
  
  # get Trace
  trace <- read.neuron(i)
  
  # get Trace name; Justine image labels
  name <- str_extract(i,"JP_[[:digit:]]+_[[:digit:]]+")
  
  # get Registration File
  reg_file <- list.files("./1_Data/3_Registration/03_CMTK_Registration_Dsec/1_HQ_Registrations/1.3_HQ_Registrations/warp/", name)
  reg_file <- paste("./1_Data/3_Registration/03_CMTK_Registration_Dsec/1_HQ_Registrations/1.3_HQ_Registrations/warp/", reg_file, sep = "")
  
  # scale Trace
  trace_scaled <- scale(trace, center = FALSE, scale = c(2.16796,2.16796,1))
  
  # register Trace
  trace_reg = xform(trace_scaled, reg_file, transformtype = "warp", FallBackToAffine = TRUE)
  
  # output formatted file
  output_file <-  paste(loc_Dsec_ALPNs_DsecF_all, final_name, sep = "")
  write.neuron(trace_reg, file = output_file, dir = loc_Dsec_ALPNs_DsecF_all, format="swc", ext = ".swc")    
  
  # Sort for left and right hemisphere
  if (grepl("RH",final_name, fixed = TRUE)){
    output_file_R <-  paste(loc_Dsec_ALPNs_DsecF_R, final_name, sep = "")
    write.neuron(trace_reg, file = output_file_R, dir = loc_Dsec_ALPNs_DsecF_R, format="swc", ext = ".swc")
    }
  else{
    output_file_L <-  paste(loc_Dsec_ALPNs_DsecF_L, final_name, sep = "")
    write.neuron(trace_reg, file = output_file_L, dir = loc_Dsec_ALPNs_DsecF_L, format="swc", ext = ".swc")
    }
}



# Check Dsec Traces
# 
# Dsec_ALPNs_DsecF <- read.neurons(loc_Dsec_ALPNs_DsecF_all)
# open3d()
# clear3d()
# plot3d(DsecI, alpha = 0.1)
# plot3d(Dsec_ALPNs_DsecF, col = colfunc_red, lwd =3, soma=3)
# nview3d("frontal",0)
# 
# nlscan(Dsec_ALPNs_DsecF,lwd=3, soma=3)



### Dmel ALPNs - Traces by Benedikt Dürr ----
#### Loop through traces in the folder

filenames = dir(path = loc_Dmel_ALPNs_Benedikt, pattern="*.swc")
for (i in filenames)
{
  final_name <- i
  i <- paste(loc_Dmel_ALPNs_Benedikt, i, sep = "")
  
  # get Trace
  trace <- read.neuron(i)
  
  # get Trace name; Benedikt image labels
  name <- str_extract(i,"BD_M[[:digit:]]+")
  
  # get Registration File
  reg_file <- list.files("./1_Data/3_Registration/03_CMTK_Registration_Dmel/1_HQ_Registrations/warp", name)
  reg_file <- paste("./1_Data/3_Registration/03_CMTK_Registration_Dmel/1_HQ_Registrations/warp/", reg_file, sep = "")
  
  # scale Trace
  trace_scaled <- scale(trace, center = FALSE, scale = c(2.16796,2.16796,1))
  
  # register Trace
  trace_reg = xform(trace_scaled, reg_file, transformtype = "warp", FallBackToAffine = TRUE)
  
  # output formatted file
  output_file <-  paste(loc_Dmel_ALPNs_IS2_all, final_name, sep = "")
  write.neuron(trace_reg, file = output_file, dir = loc_Dmel_ALPNs_IS2_all, format="swc", ext = "_reg.swc")    
  
  # Sort for left and right hemisphere
  if (grepl("R",final_name, fixed = TRUE)){
    output_file_R <-  paste(loc_Dmel_ALPNs_IS2_R, final_name, sep = "")
    write.neuron(trace_reg, file = output_file_R, dir = loc_Dmel_ALPNs_IS2_R, format="swc", ext = "_reg.swc")
  }
  else{
    output_file_L <-  paste(loc_Dmel_ALPNs_IS2_L, final_name, sep = "")
    write.neuron(trace_reg, file = output_file_L, dir = loc_Dmel_ALPNs_IS2_L, format="swc", ext = "_reg.swc")
  }
}



# Check Dmel Traces
# 
# Dmel_ALPNs_IS2 <- read.neurons(loc_Dmel_ALPNs_IS2_all)
# open3d()
# clear3d()
# plot3d(IS2, alpha = 0.1)
# plot3d(Dmel_ALPNs_IS2, col = colfunc_red, lwd =3, soma=3)
# nview3d("frontal",0)
# 
# nlscan(Dmel_ALPNs_IS2,lwd=3, soma=3)



## Bridging & Mirror Registration ----
# For analysis traces were mirrored to the right (R) Hemisphere in the IS2 brain space


### Dsec ALPNs - Bridging & Mirror Registration ----

### Loading registered neuron traces
nl_Dsec_ALPNs_DsecF_R <- read.neurons(loc_Dsec_ALPNs_DsecF_R, pattern = "*.swc", neuronnames = NULL)
nl_Dsec_ALPNs_DsecF_L <- read.neurons(loc_Dsec_ALPNs_DsecF_L, pattern = "*.swc", neuronnames = NULL)


### Bridging Traces from DsecF to DsecI
nl_Dsec_ALPNs_DsecI_R <- xform(nl_Dsec_ALPNs_DsecF_R, DsecFtoDsecI, transformtype = "warp", FallBackToAffine = TRUE)
nl_Dsec_ALPNs_DsecI_L <- xform(nl_Dsec_ALPNs_DsecF_L, DsecFtoDsecI, transformtype = "warp", FallBackToAffine = TRUE)


### Bridging Traces from DsecI to IS2
nl_Dsec_ALPNs_IS2_R <- xform_brain(nl_Dsec_ALPNs_DsecI_R, sample = DsecI, reference = IS2)
nl_Dsec_ALPNs_IS2_L <- xform_brain(nl_Dsec_ALPNs_DsecI_L, sample = DsecI, reference = IS2)

### Mirror Traces in IS2 [!correcting for the confocal left right mirroring]
nl_Dsec_ALPNs_IS2_R_mir <- mirror_brain(nl_Dsec_ALPNs_IS2_R, IS2, .progress='text')
nl_Dsec_ALPNs_IS2_L_mir <- mirror_brain(nl_Dsec_ALPNs_IS2_L, IS2, .progress='text')

### Bridging mirrored Traced back to DsecI
nl_Dsec_ALPNs_DsecI_R_mir <- xform_brain(nl_Dsec_ALPNs_IS2_R_mir, sample = IS2, reference = DsecI)
nl_Dsec_ALPNs_DsecI_L_mir <- xform_brain(nl_Dsec_ALPNs_IS2_L_mir, sample = IS2, reference = DsecI)

### Bridging DsecI traces back to DsecF
nl_Dsec_ALPNs_DsecF_R_mir <- xform(nl_Dsec_ALPNs_DsecI_R_mir, DsecFtoDsecI)
nl_Dsec_ALPNs_DsecF_L_mir <- xform(nl_Dsec_ALPNs_DsecI_L_mir, DsecFtoDsecI)

### Export DsecF Dataset
nl_Dsec_ALPNs_DsecF_all   <- c(nl_Dsec_ALPNs_DsecF_R_mir, nl_Dsec_ALPNs_DsecF_L_mir, recursive = FALSE)
# write.neurons(nl_Dsec_ALPNs_DsecF_all, dir = loc_Dsec_ALPNs_DsecF_all, format="swc")

### Export DsecI Dataset
nl_Dsec_ALPNs_DsecI_all   <- c(nl_Dsec_ALPNs_DsecI_R_mir, nl_Dsec_ALPNs_DsecI_L_mir, recursive = FALSE)
# write.neurons(nl_Dsec_ALPNs_DsecI_all, dir = loc_Dsec_ALPNs_DsecI_all, format="swc")

### Export IS2 Dataset
nl_Dsec_ALPNs_IS2_all   <- c(nl_Dsec_ALPNs_IS2_R_mir, nl_Dsec_ALPNs_IS2_L_mir, recursive = FALSE)
# write.neurons(nl_Dsec_ALPNs_IS2_all, dir = loc_Dsec_ALPNs_IS2_all, format="swc")



### Dsec ALPNs - Combine ALPNS on the right (R) Hemisphere for analysis ----
nl_Dsec_ALPNs_IS2_allR <- c(nl_Dsec_ALPNs_IS2_R_mir, nl_Dsec_ALPNs_IS2_L, recursive = FALSE)
nl_Dsec_ALPNs_DsecI_allR <- c(nl_Dsec_ALPNs_DsecI_R_mir, nl_Dsec_ALPNs_DsecI_L, recursive = FALSE)
nl_Dsec_ALPNs_DsecF_allR <- c(nl_Dsec_ALPNs_DsecF_R_mir, nl_Dsec_ALPNs_DsecF_L, recursive = FALSE)

### Export processed traces
write.neurons(nl_Dsec_ALPNs_IS2_allR, dir = loc_Dsec_ALPNs_IS2_allR, format="swc")
write.neurons(nl_Dsec_ALPNs_DsecI_allR, dir = loc_Dsec_ALPNs_DsecI_allR, format="swc")
write.neurons(nl_Dsec_ALPNs_DsecF_allR, dir = loc_Dsec_ALPNs_DsecF_allR, format="swc")





### Dmel ALPNs - Bridging & Mirror Registration ----

### Loading registered neuron traces
nl_Dmel_ALPNs_IS2_R <- read.neurons(loc_Dmel_ALPNs_IS2_R, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_ALPNs_IS2_L <- read.neurons(loc_Dmel_ALPNs_IS2_L, pattern = "*.swc", neuronnames = NULL)

### Mirror Traces in IS2 [!correcting for the confocal left right mirroring]
nl_Dmel_ALPNs_IS2_R_mir <- mirror_brain(nl_Dmel_ALPNs_IS2_R, IS2, .progress='text')
nl_Dmel_ALPNs_IS2_L_mir <- mirror_brain(nl_Dmel_ALPNs_IS2_L, IS2, .progress='text')

### Export IS2 Dataset
nl_Dmel_ALPNs_IS2_all   <- c(nl_Dmel_ALPNs_IS2_R_mir, nl_Dmel_ALPNs_IS2_L_mir, recursive = FALSE)
write.neurons(nl_Dmel_ALPNs_IS2_all, dir = loc_Dmel_ALPNs_IS2_all, format="swc")

### Dmel ALPNs - Combine ALPNS on the right (R) Hemisphere for analysis ----
nl_Dmel_ALPNs_IS2_allR <- c(nl_Dmel_ALPNs_IS2_R_mir, nl_Dmel_ALPNs_IS2_L, recursive = FALSE)

### Export processed traces
write.neurons(nl_Dmel_ALPNs_IS2_allR, dir = loc_Dmel_ALPNs_IS2_allR, format="swc")



### Read Traces

#nl_Dsec_all_IS2_RH <- read.neurons("./1_Data/5_Dataset_our/04_PN_Traces_Dsec_reg_IS2_RH_all/")
clear3d()
plot3d(nl_Dsec_ALPNs_DsecF_all, soma=3, lwd= 3, color = "green") 
plot3d(nl_Dsec_ALPNs_DsecF_all$BD_M171_LH_PN1_u_l_DM2, soma=3, lwd= 3, color = "red") 
plot3d(DsecI)

plot3d(nl_Dsec_ALPNs_IS2_allRH$BD_M144_LH_PN1_u_l_DM2, soma=3, lwd= 3, color = "green") 
plot3d(nl_Dsec_ALPNs_IS2_allRH, soma=3, lwd= 3, color = "blue")
nlscan(nl_Dsec_all_IS2_RH, soma=3, lwd =3)
plot3d(IS2)
nlscan(nl_Dsec_ALPNs_IS2_allRH, soma=3, lwd= 3)

plot3d(nl_Dsec_ALPNs_DsecI_allRH$BD_M091_RH_PN1_m_d, soma=3)




## Rename Traces ----
### Dsec ALPNs - Rename Traces DsecI - on both brain hemispheres ----
nl_Dsec_ALPNs_DsecI_all <- read.neurons(loc_Dsec_ALPNs_DsecI_all, pattern = "*.swc", neuronnames = NULL)

Sub_Table_4 <- read.csv("./4_Tables/Sup_Table_4/2024_07_07_Sup_Table_4_v5.csv", header = TRUE, sep = ";")

for (i in nl_Dsec_ALPNs_DsecI_all){
  # read name from nl
  neuron_name       <- paste(i$NeuronName, sep = "")
  print(neuron_name)
  # find name in csv and select attributes
  neuron_spec       <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "Species"]
  neuron_id         <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "ID"]
  neuron_hemisphere <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "Hemisphere"]
  neuron_type       <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "PN.Type"]
  neuron_branchtype <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "Branching.Type"]
  neuron_glom       <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "Glomerulus.Innervation"]
  neuron_glom_all   <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "Additional.Innervation"]
  # make new name
  new_neuron_name       <- paste(neuron_spec, neuron_id, neuron_hemisphere, neuron_type, neuron_branchtype, neuron_glom, sep = "_")
  # new_neuron_name_long  <- paste(neuron_spec, neuron_id, neuron_hemisphere, neuron_type, neuron_branchtype, neuron_glom_all, neuron_glom, sep = "_")
  
  # print neuron with new name
  export_file <- paste("./1_Data/5_Dataset_our_v2/3.4_Dsec_ALPNs_DsecI_all_LeftRightcorrected_renamed/", new_neuron_name, sep = "")
  #export_file <- paste("./1_Data/5_Dataset_our_v2/3.4_Dsec_ALPNs_DsecI_all_LeftRightcorrected_renamed/", new_neuron_name_long, sep = "")
  write.neuron(i, file = export_file, format="swc")
}



### Dsec Rename Traces DsecI - on the right brain hemisphere ----
nl_Dsec_ALPNs_DsecI_allR <- read.neurons("./1_Data/5_Dataset_our_v2/3.4_Dsec_ALPNs_DsecI_allR", pattern = "*.swc", neuronnames = NULL)

Sub_Table_4 <- read.csv("./4_Tables/Sup_Table_4/2024_07_07_Sup_Table_4_v5.csv", header = TRUE, sep = ";")

for (i in nl_Dsec_ALPNs_DsecI_allR){
  # read name from nl
  neuron_name       <- paste(i$NeuronName, sep = "")
  print(neuron_name)
  # find name in csv and select attributes
  neuron_spec       <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "Species"]
  neuron_id         <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "ID"]
  neuron_type       <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "PN.Type"]
  neuron_branchtype <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "Branching.Type"]
  neuron_glom       <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "Glomerulus.Innervation"]
  neuron_glom_all   <- Sub_Table_4[grep(neuron_name, Sub_Table_4$Trace.Identifier), "Additional.Innervation"]
  # make new name
  new_neuron_name       <- paste(neuron_spec, neuron_id, neuron_type, neuron_branchtype, neuron_glom, sep = "_")
  # new_neuron_name_long  <- paste(neuron_spec, neuron_id, neuron_type, neuron_branchtype, neuron_glom_all, neuron_glom, sep = "_")
  
  # print neuron with new name
  export_file <- paste("./1_Data/5_Dataset_our_v2/3.4_Dsec_ALPNs_DsecI_allR_renamed/", new_neuron_name, sep = "")
  #export_file <- paste("./1_Data/5_Dataset_our_v2/3.4_Dsec_ALPNs_DsecI_allR_renamed_long/", new_neuron_name_long, sep = "")
  write.neuron(i, file = export_file, format="swc")
}




  neuron_TraceID    <- paste(Sub_Table_4[grepl(Sub_Table_4$Neuron.Name == "VM5d")])
  neuron_pup        <-
  neuron_pupID      <-
  neuron_spec       <-
  neuron_type       <-
  neuron_branch     <-
  neuron_glom       <- Sub_Table_4[grep(neuron_nlID, Sub_Table_4$Trace.Identifier), "Neuron.Name"]
  neuron_otherglom  <-
  neuron_driver     <-
  neuron_pup        <-
  neuron_glom       <- nl_Dsec_ALPNs_DsecF_all[grep(neuron_name, rownames(nl_Dsec_ALPNs_DsecF_all)), ]
  
  neuron_ShortName  <- paste(i$NeuronName, sep = "")
  neuron_FullName   <- paste(i$NeuronName, sep = "")
  
  print(neuron_name)   
  print(neuron_glom)








for (i in nl_Dsec_ALPNs_DsecF_all){
  neuron_name <- paste(i$NeuronName, sep = "")
  
  for (j in nl_Dsec_ALPNs_DsecF_all){
    nl_Dsec_ALPNs_DsecF_all[grep(neuron_name, rownames(nl_Dsec_ALPNs_DsecF_all)), ]
    # meta_data <- paste(j$term$core$label, sep = "")
    meta_data <- paste(j$term$core$label, sep = "")
    
    #print(j)
    #print(meta_data)
    if (neuron_name == meta_data){
      k=1
      while (k <= length(j$parents)) {
        neuron_glomerulus <- j$parents[[k]]$symbol
        if (grepl("PN", neuron_glomerulus)){
          break
        }
        else {
          k <- k + 1
        }
      }
      if (!grepl("PN", neuron_glomerulus)){
        neuron_glomerulus <- "NA"
      }
      
      print(neuron_glomerulus)    
      neuron_VFBid <- j$term$core$short_form
      neuron_label <- j$term$core$label
      
      new_file_name <- paste(neuron_VFBid, neuron_label, neuron_glomerulus, sep = "_")
      export_file <- paste(loc_, new_file_name, sep = "")
      write.neuron(i, file = export_file, format="swc")
    }
  }
}

VFB_Dmel_ALPNs_conf_renamed_swc <- read.neurons("./1_Data/01_PN Dataset - other/01.2_Dmel_ALPN_conf_VFB_FBbt_00067123_renamed_n806/")
VFB_Dmel_ALPNs_conf_renamed_swc # n=806

















## Dmel ALPN all ----
#### Mirror & Bridging Registration ----
nl_Dmel_RH_IS2 <- read.neurons("./1_Data/5_Dataset_our/03_ALPNs_Dmel_IS2_RH", pattern = "*.swc", neuronnames = NULL)
nl_Dmel_LH_IS2 <- read.neurons("./1_Data/5_Dataset_our/03_ALPNs_Dmel_IS2_LH", pattern = "*.swc", neuronnames = NULL)

### Check
nl_Dmel_PNs_IS2 <- c(nl_Dmel_RH_IS2, nl_Dmel_LH_IS2)
clear3d()
plot3d(nl_Dmel_all_IS2_RH, 
       lwd = 4,
       soma= 4)
plot3d(IS2, aplha = 0.1)

### Mirroring LH to RH in IS2
#nl_Dmel_LH_IS2_mir <- mirror_brain(nl_Dmel_LH_IS2, IS2, .progress='text')
#nl_Dmel_LH_DsecI_mir <- xform_brain(nl_Dmel_LH_IS2_mir, sample = IS2, reference = DsecI)

### Combine RH & LH nls
#nl_Dmel_all_IS2_RH <- c(nl_Dmel_RH_IS2, nl_Dmel_LH_IS2_mir, recursive = FALSE)
#nl_Dmel_all_DsecI_RH <- c(nl_Dmel_RH_DsecI, nl_Dmel_LH_DsecI_mir, recursive = FALSE)

### Mirroring RH to LH in IS2
nl_Dmel_RH_IS2_mir <- mirror_brain(nl_Dmel_RH_IS2, IS2, .progress='text')
#nl_Dmel_RH_DsecI_mir <- xform_brain(nl_Dmel_RH_IS2_mir, sample = IS2, reference = DsecI)

### Combine RH & LH nls
nl_Dmel_all_IS2_RH <- c(nl_Dmel_LH_IS2, nl_Dmel_RH_IS2_mir, recursive = FALSE)
#nl_Dmel_all_DsecI_LH <- c(nl_Dmel_LH_DsecI, nl_Dmel_RH_DsecI_mir, recursive = FALSE)

### Export
write.neurons(nl_Dmel_all_IS2_RH, dir = loc_Dmel_ALPNs_IS2_allRH, format="swc")



### Dsec Other Neurons ----







## Logo Github ----
nl_Dsec_ALPNs_DsecF_all_renamed <- read.neurons("./1_Data/5_Dataset_our_v2/3.3_Dsec_ALPNs_DsecF_all_renamed", pattern = "*.swc", neuronnames = NULL)
plot3d(DsecI.surf, alpha= alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPNs_DsecF_all_renamed, soma=soma, lwd=lwd, col = colfunc_red)
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Logo_Github_Dsec_Dataset_Overview_ALPNs_n133_anterior.png", fmt="png", height = height_frontal, width = width_frontal)



