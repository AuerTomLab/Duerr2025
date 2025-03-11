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





nl_Dsec_ALPNs_DsecI_allR              <- read.neurons(loc_Dsec_ALPNs_DsecI_allR_renamed, pattern = "*.swc", neuronnames = NULL) # renamed neurons, most commonly used dataset in this manuscript
nl_Dsec_ALPNs_DsecI_allR_long         <- read.neurons(loc_Dsec_ALPNs_DsecI_allR_renamed_long, pattern = "*.swc", neuronnames = NULL) # additional details
nl_Dmel_ALPNs_IS2_allR                <- read.neurons(loc_Dmel_ALPNs_IS2_allR, pattern = "*.swc", neuronnames = NULL)







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







