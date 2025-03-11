#-----------------------------------#
# Library - Datasets & Locations ----
#-----------------------------------#


#------------------------------  Description  ---------------------------------#
# Here we summarize all datasets generated in the project.
# We define storage locations to easily access the data
# 
#------------------------------------------------------------------------------#


## Locations - Figures ----
loc_Figure1        <- file.path("./3_Figures/Figure1/")
loc_Figure2        <- file.path("./3_Figures/Figure2/")
loc_Figure3        <- file.path("./3_Figures/Figure3/")
loc_Figure4        <- file.path("./3_Figures/Figure4/")
loc_Figure5        <- file.path("./3_Figures/Figure5/")
loc_Sup_Figure1    <- file.path("./3_Figures/Sup_Figure1/")
loc_Sup_Figure2    <- file.path("./3_Figures/Sup_Figure2/")
loc_Sup_Figure3    <- file.path("./3_Figures/Sup_Figure3/")
loc_Sup_Figure4    <- file.path("./3_Figures/Sup_Figure4/")
loc_Sup_Figure5    <- file.path("./3_Figures/Sup_Figure5/")





## Locations - Brain Registration Files ----
# Self made CMTK brigding registration files 
DsecFtoDsecI <- file.path("./1_Data/3_Registration/02_Bridging_Registrations/Reg_DsecF>DsecI/Registration/warp/DsecI_DsecF_01_warp_m0g80c8e1e-1x26r4.list")
DsecItoDsecF <- file.path("./1_Data/3_Registration/02_Bridging_Registrations/Reg_DsecI>DsecF/Registration/warp/DsecF_DsecI_01_warp_m0g80c8e1e-1x26r4.list")
#DsecFtoIS2 <- file.path("./03_Brain Registration/01_CMTK_Registration/01_Bridging_Registrations/Reg_DsecF>IS2/IS2_DsecF_01_warp_m0g80c8e1e-1x26r4.list")





## Locations & Datasets - Neurons ----

loc_Dsec_ALPNs_Benedikt               <- file.path("./1_Data/5_Dataset_our/0_Neurons_Original/1_Dsec_ALPNs_Benedikt/")
loc_Dsec_ALPNs_Justine                <- file.path("./1_Data/5_Dataset_our/0_Neurons_Original/2_Dsec_ALPNs_Justine/")
loc_Dsec_ALPNs_Thomas                 <- file.path("./1_Data/5_Dataset_our/0_Neurons_Original/3_Dsec_ALPNs_Thomas/")
loc_Dmel_ALPNs_Benedikt               <- file.path("./1_Data/5_Dataset_our/0_Neurons_Original/4_Dmel_ALPNs_Benedikt/")



## Analysis Locations ----

### Dsec ----
# ALPNs split into left and right Hemisphere [not corrected for microscope mirroring!!!]
loc_Dsec_ALPNs_DsecF_L                <- file.path("./1_Data/5_Dataset_our/3.3_Dsec_ALPNs_DsecF_L/")
loc_Dsec_ALPNs_DsecF_R                <- file.path("./1_Data/5_Dataset_our/3.3_Dsec_ALPNs_DsecF_R/")

# ALPNs not R/L-corrected
loc_Dsec_ALPNs_DsecF_not_RL_corrected <- file.path("./1_Data/5_Dataset_our//")

# ALPNs R/L-corrected
loc_Dsec_ALPNs_DsecF_all              <- file.path("./1_Data/5_Dataset_our/3.3_Dsec_ALPNs_DsecF_all/")
loc_Dsec_ALPNs_DsecI_all              <- file.path("./1_Data/5_Dataset_our/3.4_Dsec_ALPNs_DsecI_all/")
loc_Dsec_ALPNs_IS2_all                <- file.path("./1_Data/5_Dataset_our/3.5_Dsec_ALPNS_IS2_all/")
loc_Dsec_ALPNs_DsecF_all_renamed      <- file.path("./1_Data/5_Dataset_our/3.3_Dsec_ALPNs_DsecF_all_renamed/")
loc_Dsec_ALPNs_DsecI_all_renamed      <- file.path("./1_Data/5_Dataset_our/3.4_Dsec_ALPNs_DsecI_all_renamed/")
loc_Dsec_ALPNs_IS2_all_renamed        <- file.path("./1_Data/5_Dataset_our/3.5_Dsec_ALPNS_IS2_all_renamed/")

# ALPNs R/L-corrected all on the right hemisphere
loc_Dsec_ALPNs_DsecF_allR             <- file.path("./1_Data/5_Dataset_our/3.3_Dsec_ALPNs_DsecF_allR/")
loc_Dsec_ALPNs_DsecI_allR             <- file.path("./1_Data/5_Dataset_our/3.4_Dsec_ALPNs_DsecI_allR/")
loc_Dsec_ALPNs_IS2_allR               <- file.path("./1_Data/5_Dataset_our/3.5_Dsec_ALPNs_IS2_allR/")

# ALPNs renamed
loc_Dsec_ALPNs_DsecI_allR_renamed     <- file.path("./1_Data/5_Dataset_our/3.4_Dsec_ALPNs_DsecI_allR_renamed/")
loc_Dsec_ALPNs_DsecI_allR_renamed_long<- file.path("./1_Data/5_Dataset_our/3.4_Dsec_ALPNs_DsecI_allR_renamed_long/")

### Dmel ----
loc_Dmel_ALPNs_IS2_L                  <- file.path("./1_Data/5_Dataset_our/2.3_Dmel_ALPNs_IS2_L/")
loc_Dmel_ALPNs_IS2_R                  <- file.path("./1_Data/5_Dataset_our/2.3_Dmel_ALPNs_IS2_R/")
loc_Dmel_ALPNs_IS2_all                <- file.path("./1_Data/5_Dataset_our/2.3_Dmel_ALPNs_IS2_all/")
loc_Dmel_ALPNs_IS2_all_renamed        <- file.path("./1_Data/5_Dataset_our/2.3_Dmel_ALPNs_IS2_all_renamed/")
loc_Dmel_ALPNs_IS2_allR               <- file.path("./1_Data/5_Dataset_our/2.3_Dmel_ALPNs_IS2_allR/")
loc_Dmel_ALPNs_IS2_allR_renamed       <- file.path("./1_Data/5_Dataset_our/2.3_Dmel_ALPNs_IS2_allR_renamed/")







nl_Dmel_ALPNs_IS2_allR    <- read.neurons(loc_Dmel_ALPNs_IS2_allR, pattern = "*.swc", neuronnames = NULL)
## All adPN& lPN Neuronlists ----
nl_ALPN_all_adPNs_lPNs <- read.neurons("./1_Data/6_Dataset_other/07_All_adPNs_lPNs_DsecLM_DmelLM&EM_uni&multi_annotated&notannotated_NBLAST")






# 
# 
# # Locations for Figures ----
# 
# 
# 
# nl_Dsec_ALPNs_DsecI_allR              <- read.neurons(loc_Dsec_ALPNs_DsecI_allR_renamed, pattern = "*.swc", neuronnames = NULL) # renamed neurons, most commonly used dataset in this manuscript
# nl_Dsec_ALPNs_DsecI_allR_long         <- read.neurons(loc_Dsec_ALPNs_DsecI_allR_renamed_long, pattern = "*.swc", neuronnames = NULL) # additional details
# 
# 
# 
# ### Dmel & Dsec adPNs & lPNs ----
# nl_ALPN_all_adPNs_lPNs <- read.neurons("./1_Data/6_Dataset_other/07_All_adPNs_lPNs_DsecLM_DmelLM&EM_uni&multi_annotated&notannotated_NBLAST")
# 
# # nl_Dsec_ALPNs_DsecI_allR              <- read.neurons(loc_Dsec_ALPNs_DsecI_allR, pattern = "*.swc", neuronnames = NULL) # got replaced by "nl_Dsec_ALPNs_DsecI_allR_renamed"
# nl_Dsec_ALPNs_DsecF_allR <- read.neurons(loc_Dsec_ALPNs_DsecF_allR, pattern = "*.swc", neuronnames = NULL)
# 
# # to be Added
# loc_Dsec_ALPNs_DsecI_alluPNs
# nl_Dsec_ALPNs_DsecI_alluPNs
# 
# loc_Dsec_ALPNs_DsecI_mPNs
# nl_Dsec_ALPNs_DsecI_mPNs
# 
# nl_Dsec_ALPNs_DsecI_allR_long # 2.B
# 
# nl_Dmel_ALPNs_IS2_allR <- read.neurons(loc_Dmel_ALPNs_IS2_allR, pattern = "*.swc", neuronnames = NULL)
# 
# 
# 











### Used datasets ----
# 
# 
# # 2A
# loc_Dsec_ALPNs_DsecI_allR <- file.path("./1_Data/5_Dataset_our/3.4_Dsec_ALPNs_DsecI_allR_renamed/")
# nl_Dsec_ALPNs_DsecI_allR <- read.neurons(loc_Dsec_ALPNs_DsecI_allR, pattern = "*.swc", neuronnames = NULL)
# 
# loc_Dsec_ALPNs_DsecI_alluPNs <- file.path("./1_Data/5_Dataset_our/3.4_Dsec_ALPNs_DsecI_allR_uPNs_upPNs")
# nl_Dsec_ALPNs_DsecI_alluPNs <- read.neurons(loc_Dsec_ALPNs_DsecI_alluPNs, pattern = "*.swc", neuronnames = NULL)
# 
# loc_Dsec_ALPNs_DsecI_mPNs <- file.path("./1_Data/5_Dataset_our/3.4_Dsec_ALPNs_DsecI_allR_mPNs")
# nl_Dsec_ALPNs_DsecI_mPNs <- read.neurons(loc_Dsec_ALPNs_DsecI_mPNs, pattern = "*.swc", neuronnames = NULL)
# 
# 
# 
# # 2B
# loc_Dsec_ALPNs_DsecI_allR_long <- file.path("./1_Data/5_Dataset_our/3.4_Dsec_ALPNs_DsecI_allR_renamed_long")
# nl_Dsec_ALPNs_DsecI_allR_long<- read.neurons(loc_Dsec_ALPNs_DsecI_allR_long, pattern = "*.swc", neuronnames = NULL)
# 
# 
# 
# 
# # 3C
# nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN
# # 01.4_list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_NoSoma.rds
# 
# nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA
# # 01.4_list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_NoSoma.rds
# 
# nl_WholeDataset_Dmel_EM_All_adPNs_uni
# # 01.8_list_WholeDataset_Dmel_EM_All_adPNs_uni_NoSoma.rds
# 
# nl_WholeDataset_Dmel_EM_All_lPNs_uni
# # 01.8_list_WholeDataset_Dmel_EM_All_lPNs_uni_NoSoma.rds
# 
# nl_WholeDataset_Dmel_EM_All_adPNs_multi
# # 01.8_list_WholeDataset_Dmel_EM_All_adPNs_multi_NoSoma.rds
# 
# nl_WholeDataset_Dmel_EM_All_lPNs_multi
# # 01.8_list_WholeDataset_Dmel_EM_All_lPNs_multi_NoSoma.rds
# 
# 
# # 3D
# #nl_Dmel_Conf_ALPNs_IS2_allR_mlPN2
# nl_Dmel_LM_ALPNs_IS2_allR_mlPN2
# nl_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN2
# nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN2
# # nl_Dmel_Conf_ALPNs_IS2_allR_mlPN3
# nl_Dmel_LM_ALPNs_IS2_allR_mlPN3
# nl_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN3
# nl_Dmel_FAFB_IS2_madPN2_pruned3_dense
# nl_Dmel_FlyEM_IS2_madPN2_pruned3_denseX1
# nl_Dsec_IS2_madPN2_pruned3_denseX2
# nl_Dsec_IS2_madPN2_pruned1
# nl_Dmel_IS2_madPN2_pruned1
# nl_Dsec_IS2_madPN2_pruned3
# nl_Dmel_IS2_madPN2_pruned3
# 
# 
# # 3F
# nl_Dsec_IS2_madPN2
# nl_Dmel_IS2_madPN2
# 
# 
# # 4A
# nl_Dsec_ALPNs_DsecI_allR
# nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2v
# nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2v
# nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2v
# 
# 
# # 4B
# nl_DL2v_Dsec_DsecI
# 
# 
# # 4C
# nl_Dmel_EM_FlyEM_ALPNs_IS2_R_DM2
# nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2
# 
# 
# # 4D
# nl_Dmel_Conf_other_ALPNs_IS2_allR_VM5d
# glom_Dsec_AL_RH_DsecI
# nl_Dmel_EM_FlyEM_ALPNs_IS2_RH_VM5d
# nl_Dmel_EM_FAFB_ALPNs_IS2_RH_VM5d
# glom_Dsec_AL_RH_IS2
# nl_VM5d_Dsec_DsecI
# nl_VM5d_Dsec_Dmel_IS2
# 
# 
# # 4E
# br_SCL_DsecI
# br_SLP_DsecI
# tract_Dsec_AL_L_DsecI_lowres
# nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2
# nl_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d
# 
# 
# # 4F
# nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_DM6
# nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VM3
# nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VC4
# nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VM7d
# nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VM7v
# 
# nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_DM6
# nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM2
# nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM3
# nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VC4
# nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM7d
# nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM7v
# 
# nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_DM6
# nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM2
# nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM3
# nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VC4
# nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM7d
# nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM7v
# 
# nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d
# nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d
# 
# 
# nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DM6
# nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DM6
# 
# nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM3
# nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM3
# 
# nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM2
# nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM2
# 
# 
# # 5B
# nl_Dsec_ALPN_VM5d_example_woMB
# nl_Dmel_ALPN_VM5d_example_woMB
# 
# 
# # 5D
# glom_Dmel_IS2_AL_L_VM5d # ??? MIB
# 
# 
# # 6E
# nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2
# nl_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d
# 
# 
# # S2B
# nl_Dsec_ALPNs_DsecI_uPNs
# nl_Dsec_ALPNs_DsecI_upPNs
# 
# 
# # S3B
# nl_DsecALPNs_unregistered
# nl_DsecALPNs_unregistered_scaled
# nl_Dsec_ALPNs_DsecF
# nl_Dsec_ALPNs_DsecI_allR
# nl_Dmel_ALPNs_EM_IS2_examples
# nl_Dsec_ALPNs_IS2_allR
# 
# 
# # S3C
# nl_Dsec_preReg_VM5d
# nl_Dsec_preReg_VM5d_scaled
# nl_Dsec_DsecF_VM5d
# 
# 
# # S3D
# nl_Dsec_IS2_VM5d
# nl_Dmel_em_IS2_VM5d
# nl_Dmel_conf_IS2_VM5d
# # 08_list_Dsec_Dmel_IS2_VM5d_NoSoma.rds
# # 08_list_Dmel_conf_IS2_VM5d_NoSoma.rds
# 
# nl_Dsec_IS2_VM5d_pruned1
# nl_Dmel_em_IS2_VM5d_pruned1
# nl_Dmel_conf_IS2_VM5d_pruned1
# # 08_list_Dmel_em_IS2_VM5d_pruned1_NoSoma.rds
# # 08_list_Dmel_conf_IS2_VM5d_pruned1_NoSoma.rds
# 
# nl_Dsec_IS2_VM5d_pruned3
# nl_Dmel_em_IS2_VM5d_pruned3
# nl_Dmel_conf_IS2_VM5d_pruned3
# nl_Dsec_IS2_DL2v
# nl_Dmel_IS2_em_DL2v
# nl_Dmel_IS2_conf_DL2v
# nl_Dsec_IS2_DL2v_pruned1
# nl_Dmel_IS2_em_DL2v_pruned1
# nl_Dmel_IS2_conf_DL2v_pruned1
# nl_Dsec_IS2_DL2v_pruned3
# nl_Dmel_IS2_em_DL2v_pruned3
# nl_Dmel_IS2_conf_DL2v_pruned3
# 
# 
# # S4A
# nl_Dmel_EM_FlyEM_ALPNs_IS2_allRH_mlPN1
# nl_ALPN_all_adPNs_lPNs
# 
# 
# # S4B
# nl_Dmel_EM_FAFB_ALPNs_IS2_allR_madPN1
# nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_madPN1
# 
# 
# # S4C
# nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d
# nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d
# nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VA2
# nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VA2
# nl_Dmel_Conf_other_ALPNs_IS2_allR_VC3l
# nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VC3l
# nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VC3l
# nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2d
# nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2d
# nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2d
# nl_Dmel_Conf_other_ALPNs_IS2_allR_DA1
# nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DA1
# nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DA1
# nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VL2a
# nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VL2a
# nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DC1
# nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DC1
# 
# 
# # S6A
# nl_Dsec_ALPNs_DsecI_VM5d
# 
# 
# 
# 
# 



























## Locations & Datasets - Surfaces ----

### Glomeruli Surfaces ----

#### DsecF  ----
# In Amira Segmentation view:
# Masking on the left brain hemisphere in DsecF-registered brains
# Smooth Segmentation: 5px, 3d volume
# In Amira Project view:
# Generate Surface (compactify: 2,4), smooth = 5
# export as HXSurface ascii (*.surf)
glom_Dsec_AL_L_DsecF_lowres <- read.hxsurf("./1_Data/4_Brain_Area_Annotations/04_Dsec_Glomeruli/Dsec_Glomi_v2_comp4.surf")
glom_Dsec_AL_L_DsecF_highres <- read.hxsurf("./1_Data/4_Brain_Area_Annotations/04_Dsec_Glomeruli/Dsec_Glomi_v2_comp2.surf")

#### DsecI ----
glom_Dsec_AL_L_DsecI_lowres <- xform(glom_Dsec_AL_L_DsecF_lowres, DsecFtoDsecI)
glom_Dsec_AL_L_DsecI_highres <- xform(glom_Dsec_AL_L_DsecF_highres, DsecFtoDsecI)

#### IS2 ----
glom_Dsec_AL_L_IS2_lowres <- xform_brain(glom_Dsec_AL_L_DsecI_lowres, sample = DsecI, reference = IS2)
glom_Dsec_AL_L_IS2_highres <- xform_brain(glom_Dsec_AL_L_DsecI_highres, sample = DsecI, reference = IS2)










#### IS2 Glomeruli Surfaces - Amira ----
# In Amira Segmentation view
# Smooth Segmentation: 5px, 3d volume
# Remove islands: <15
# In Amira Project view:
# Generate Surface (compactify: 1,2,4), smooth = 5
# export as HXSurface ascii (*.surf)
glom_Dmel_AL_L_IS2_highres <- read.hxsurf("./1_Data/4_Brain_Area_Annotations/05_Dmel_Glomeruli/Dmel_Glomeruli_comp2.surf")
xyscaled <- scale(glom_Dmel_AL_L_IS2_highres$Vertices, center = FALSE, scale = c(2.44,2.44, 1,1))
glom_Dmel_AL_L_IS2_highres$Vertices <- data.frame(xyscaled)
glom_Dmel_AL_L_IS2_lowres <- read.hxsurf("./1_Data/4_Brain_Area_Annotations/05_Dmel_Glomeruli/Dmel_Glomeruli_comp4.surf")
xyscaled <- scale(glom_Dmel_AL_L_IS2_lowres$Vertices, center = FALSE, scale = c(2.44,2.44, 1,1))
glom_Dmel_AL_L_IS2_lowres$Vertices <- data.frame(xyscaled)
glom_Dmel_AL_L_IS2_lowres <- mirror_brain(glom_Dmel_AL_L_IS2_lowres, IS2, .progress='text')










### Brain Surfaces ----

#### DsecF ----
# In Amira Segmentation view:
# Masking DsecF.tif; intensities 11000-max
# Smooth Segmentation: 5px, 3d volume
# Shrink once
# In Amira Project view:
# Generate Surface (compactify: 0,4,6,8), smooth = 7
# export as HXSurface ascii (*.surf)
DsecF_surf <- read.hxsurf("./1_Data/4_Brain_Area_Annotations/01_Dsec_DsecF/DsecF_comp6.surf")
xyscaled <- scale(DsecF_surf$Vertices, center = FALSE, scale = c(2.16796,2.16796, 1,1))
DsecF_surf$Vertices <- data.frame(xyscaled)
# clear3d()
# plot3d(DsecF_surf)



#### DsecI----
# In Amira Segmentation view:
# Masking DsecF.tif; intensities 11000-max
# Smooth Segmentation: 5px, 3d volume
# Shrink once
# In Amira Project view:
# Generate Surface (compactify: 0,4,6,8), smooth = 7
# export as HXSurface ascii (*.surf)
DsecI_surf <- read.hxsurf("./1_Data/4_Brain_Area_Annotations/02_Dsec_DsecI/DsecI_comp6.surf")
xyscaled <- scale(DsecI_surf$Vertices, center = FALSE, scale = c(2.16796,2.16796, 1,1))
DsecI_surf$Vertices <- data.frame(xyscaled)
# clear3d()
# plot3d(DsecI_surf)



#### IS2 ----
# In Amira Project view:
# Correct z-Drop: automatic
# In Amira Segmentation view
# Masking DsecF.tif; intensities 10000-max
# Smooth Segmentation: 5px, 3d volume
# Remove islands: <15
# In Amira Project view:
# Generate Surface (compactify: 0,4,6,8), smooth = 9
# export as HXSurface ascii (*.surf)
# Comment: Due to its uneven z-intensity we used the surface only usable to show glomeruli positions better the the default natverse IS2 surface
IS2_surf <- read.hxsurf("./1_Data/4_Brain_Area_Annotations/03_Dmel_IS2/IS2_comp6.surf")
xyscaled <- scale(IS2_surf$Vertices, center = FALSE, scale = c(2.44,2.44, 1,1))
IS2_surf$Vertices <- data.frame(xyscaled)
# clear3d()
# plot3d(IS2_surf)










### Neuronal Tract Surfaces ----

#### DsecF ----
# In Amira Segmentation view:
# Masking on the left brain hemisphere in DsecF-registered brains
# Smooth Segmentation: 5px, 3d volume
# In Amira Project view:
# Generate Surface (compactify: 1,2), smooth = 5
# export as HXSurface ascii (*.surf)
tract_Dsec_AL_L_DsecF_lowres <- read.hxsurf("./1_Data/4_Brain_Area_Annotations/06_Dsec_Tracts/DsecF_Tracts_comp2.surf")
xyscaled <- scale(tract_Dsec_AL_L_DsecF_lowres$Vertices, center = FALSE, scale = c(2.16,2.16, 1,1))
tract_Dsec_AL_L_DsecF_lowres$Vertices <- data.frame(xyscaled)

tract_Dsec_AL_L_DsecF_highres <- read.hxsurf("./1_Data/4_Brain_Area_Annotations/06_Dsec_Tracts/DsecF_Tracts_comp1.surf")
xyscaled <- scale(tract_Dsec_AL_L_DsecF_highres$Vertices, center = FALSE, scale = c(2.16,2.16, 1,1))
tract_Dsec_AL_L_DsecF_highres$Vertices <- data.frame(xyscaled)



#### DsecI ----
tract_Dsec_AL_L_DsecI_lowres <- xform(tract_Dsec_AL_L_DsecF_lowres, DsecFtoDsecI)
tract_Dsec_AL_L_DsecI_highres <- xform(tract_Dsec_AL_L_DsecF_highres, DsecFtoDsecI)



#### IS2 ----
tract_Dsec_AL_L_IS2_lowres <- xform_brain(tract_Dsec_AL_L_DsecI_lowres, sample = DsecI, reference = IS2)
tract_Dsec_AL_L_IS2_highres <- xform_brain(tract_Dsec_AL_L_DsecI_highres, sample = DsecI, reference = IS2)










### Brain Regions (VFB) ----

#### VFB_00102162 - Superior Lateral Protocerebrum on JRC2018Unisex adult brain ----
br_SLP_JRC2018U <- readOBJ("./1_Data/4_Brain_Area_Annotations/07_VFB_Brain_Areas/VFB_00102162_SLP_on_JRC2018Unisex_adult_brain.obj") %>%
  xyzmatrix() %>%
  ashape3d(alpha = 10, pert = TRUE) %>%
  as.mesh3d() %>%
  as.hxsurf()

br_SLP_DsecI <- xform_brain(br_SLP_JRC2018U, reference = "DsecI", sample = "JRC2018U")
br_SLP_IS2 <- xform_brain(br_SLP_JRC2018U, reference = "IS2", sample = "JRC2018U")
#open3d()
# plot3d(br_SLP_DsecI, col = col_glom_2, alpha = 0.04)
# plot3d(DsecI, alpha = 0.1)



#### VFB_00102176 - Superior Clamp ----
br_SCL_JRC2018U <- readOBJ("./1_Data/4_Brain_Area_Annotations/07_VFB_Brain_Areas/VFB_00102176_SCL_on_JRC2018Unisex_adult_brain.obj") %>%
  xyzmatrix() %>%
  ashape3d(alpha = 10, pert = TRUE) %>%
  as.mesh3d() %>%
  as.hxsurf()

br_SCL_DsecI <- xform_brain(br_SCL_JRC2018U, reference = "DsecI", sample = "JRC2018U")
br_SCL_IS2 <- xform_brain(br_SCL_JRC2018U, reference = "IS2", sample = "JRC2018U")







