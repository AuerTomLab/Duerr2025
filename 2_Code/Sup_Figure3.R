#-----------------------------#
# Supplementary Figure 3  ----
#
#-----------------------------#


## Front Matter ----
### Load Packages & Resources ----
source("2_Code/0_Project_Initialization.R")


#------------------------------  Description  ---------------------------------#
# 
# 
# 
#------------------------------------------------------------------------------#

## Panel A - Dataset Generation Workflow Overview ----










## Panel B - Registration Steps - Whole Dataset ----

# Blue are the VFB neurons bridged to IS2
# Grey brain surface is the IS2 brain space
# Red is our dataset in different registration steps


### Original / Unregistered Neurons in DsecF ----
loc_DsecALPNs_unregistered <- file.path("./1_Data/5_Dataset_our/0_Neurons_Original/5_Dsec_ALPNs_all/")
loc_DsecALPNs_unregistered_scaled <- file.path("./1_Data/5_Dataset_our/0_Neurons_Original/5_Dsec_ALPNs_all_scaled/")

nl_DsecALPNs_unregistered <- read.neurons(loc_DsecALPNs_unregistered)


filenames = dir(path = loc_DsecALPNs_unregistered, pattern="*.swc")
for (i in filenames)
{
  final_name <- i
  i <- paste(loc_DsecALPNs_unregistered, i, sep = "")
  
  # get Trace
  trace <- read.neuron(i)
  
  # scale Trace
  trace_scaled <- scale(trace, center = FALSE, scale = c(2.16796,2.16796,1))
  
  output_file <-  paste(loc_DsecALPNs_unregistered_scaled, final_name, sep = "")
  write.neuron(trace_scaled, file = output_file, dir = loc_DsecALPNs_unregistered_scaled, format="swc", ext = ".swc")    
}

nl_DsecALPNs_unregistered_scaled <- read.neurons(loc_DsecALPNs_unregistered_scaled)

clear3d()
open3d()


#plot3d(IS2_surf, alpha = alpha_brain, col="grey")
#plot3d(nl_Dmel_ALPNs_IS2_allR, lwd = lwd, soma = soma, col = colfunc_grey)
plot3d(DsecF_surf, alpha = alpha_brain, col="grey")
plot3d(nl_DsecALPNs_unregistered_scaled, lwd = lwd, soma = soma, col = colfunc_red)
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_B_Dsec_Unregistered_frontal.png", fmt="png", height = height_frontal, width = width_frontal)
# nview3d("dorsal", 0, zoom = 0.45)
# snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_B_Dsec_Unregistered_dorsal.png", fmt="png", height = height_dorsal, width = width_dorsal)
# 
# # Generate Sub-Panel
# Frontal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_B_Dsec_Unregistered_frontal.png")
# Frontal <- rasterGrob(Frontal)
# 
# Dorsal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_B_Dsec_Unregistered_dorsal.png")
# Dorsal <- rasterGrob(Dorsal)
# 
# pdf("./3_Figures/Sup_Figure3/Sup_Figure3_B_Dsec_Unregistered_inDsecF_v1.pdf", width = 1, height = 1.2258)
# layout <- rbind(c(1),c(2))
# grid.arrange(arrangeGrob(Frontal, Dorsal,
#                          heights = (c(0.668, 0.355)),
#                          layout_matrix = layout))
# dev.off()
# while (rgl.cur() > 0) {close3d()}




### DsecF (warp) ----
loc_Dsec_ALPNs_DsecF <- file.path("./1_Data/5_Dataset_our/3.3_Dsec_ALPNs_DsecF_all/")
nl_Dsec_ALPNs_DsecF <- read.neurons(loc_Dsec_ALPNs_DsecF)



open3d()
plot3d(DsecF_surf, alpha = alpha_brain, col="grey")
plot3d(nl_Dsec_ALPNs_DsecF, lwd = lwd, soma = soma, col = colfunc_red)
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_B_DsecF_warp_frontal.png", fmt="png", height = height_frontal, width = width_frontal)
# nview3d("dorsal", 0, zoom = 0.365)
# snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_B_dorsal.png", fmt="png", height = height_dorsal, width = width_dorsal)
# 
# # Generate Sub-Panel
# Frontal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_B_frontal.png")
# Frontal <- rasterGrob(Frontal_R)
# 
# Dorsal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_B_dorsal.png")
# Dorsal <- rasterGrob(Dorsal_R)
# 
# pdf("./3_Figures/Sup_Figure3/Sup_Figure3_B_Dsec_ALPNs_DsecF_v1.pdf", width = 1, height = 1.2258)
# layout <- rbind(c(1),c(2))
# grid.arrange(arrangeGrob(Frontal_R, Dorsal_R,
#                          heights = (c(0.668, 0.355)),
#                          layout_matrix = layout))
# dev.off()
# while (rgl.cur() > 0) {close3d()}




### DsecI (warp) ----
loc_Dsec_ALPNs_DsecF <- file.path("./1_Data/5_Dataset_our/3.3_Dsec_ALPNs_DsecF_all/")
nl_Dsec_ALPNs_DsecF <- read.neurons(loc_Dsec_ALPNs_DsecF)
nl_Dsec_ALPNs_DsecI <- xform(nl_Dsec_ALPNs_DsecF, DsecFtoDsecI, transformtype = "warp", FallBackToAffine = TRUE)


open3d()
plot3d(DsecI, alpha = alpha_brain, col="red")
plot3d(nl_Dsec_ALPNs_DsecI, lwd = lwd, soma = soma, col = colfunc_red)
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_B_DsecI_frontal.png", fmt="png", height = height_frontal, width = width_frontal)
# nview3d("dorsal", 0, zoom = 0.365)
# snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_B_DsecI_dorsal.png", fmt="png", height = height_dorsal, width = width_dorsal)
# 
# # Generate Sub-Panel
# Frontal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_B_frontal.png")
# Frontal <- rasterGrob(Frontal_R)
# 
# Dorsal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_B_dorsal.png")
# Dorsal <- rasterGrob(Dorsal_R)
# 
# pdf("./3_Figures/Sup_Figure3/Sup_Figure3_B_Dsec_ALPNs_DsecI_v1.pdf", width = 1, height = 1.2258)
# layout <- rbind(c(1),c(2))
# grid.arrange(arrangeGrob(Frontal_R, Dorsal_R,
#                          heights = (c(0.668, 0.355)),
#                          layout_matrix = layout))
# dev.off()
# while (rgl.cur() > 0) {close3d()}





### IS2 & IS2 (affine + mirror) ----
# 1 EM neuron / AL Glomeulus [for clarity]

#loc_Dmel_ALPNs_IS2_allR <- file.path("./1_Data/6_Dataset_other/01.8_Dmel_ALPN_em_VFB_FBbt_00067123_RH_all_IS2_uniglomerular_n457")
loc_Dsec_ALPNs_DsecI_allR <- file.path("./1_Data/5_Dataset_our/3.4_Dsec_ALPNs_DsecI_allR_renamed/")

#nl_Dmel_ALPNs_IS2_allR <- read.neurons(loc_Dmel_ALPNs_IS2_allR)
nl_Dsec_ALPNs_DsecI_allR <- read.neurons(loc_Dsec_ALPNs_DsecI_allR)

loc_Dmel_ALPNs_EM_IS2_examples <- file.path("./1_Data/6_Dataset_other/15_Dmel_em_IS2_1Neuron_1Glom/")
nl_Dmel_ALPNs_EM_IS2_examples <- read.neurons(loc_Dmel_ALPNs_EM_IS2_examples)
open3d()
plot3d(nl_Dmel_ALPNs_EM_IS2_examples, lwd = lwd, soma = soma, col = colfunc_lightblue)
# Select neurons which are likely not correctly rooted using nlscan()
# list_Dmel_ALPNs_EM_IS2_examples_NoSoma <- nlscan(nl_Dmel_ALPNs_EM_IS2_examples, lwd = lwd, soma = soma)
# saveRDS(list_Dmel_ALPNs_EM_IS2_examples_NoSoma, file = "./1_Data/6_Dataset_other/01.8_list_WholeDataset_Dmel_EM_All_adPNs_lPNs_AN_NoSoma.rds")
list_Dmel_ALPNs_EM_IS2_examples_NoSoma <- readRDS("./1_Data/6_Dataset_other/01.8_list_WholeDataset_Dmel_EM_All_adPNs_lPNs_AN_NoSoma.rds")
# n=46 possibly incorrectly annotated /not existing somata
nl_Dmel_ALPNs_EM_IS2_examples_NoSoma <- nl_Dmel_ALPNs_EM_IS2_examples[list_Dmel_ALPNs_EM_IS2_examples_NoSoma]

list_Dmel_ALPNs_EM_IS2_examples_WithSoma <- setdiff(names(nl_Dmel_ALPNs_EM_IS2_examples), list_Dmel_ALPNs_EM_IS2_examples_NoSoma)
nl_Dmel_ALPNs_EM_IS2_examples_WithSoma <- nl_Dmel_ALPNs_EM_IS2_examples[list_Dmel_ALPNs_EM_IS2_examples_WithSoma]



clear3d()
open3d()
plot3d(IS2, alpha = alpha_brain, col="cyan")
plot3d(nl_Dmel_ALPNs_EM_IS2_examples_WithSoma, lwd = lwd, soma = soma, col = colfunc_blue)
plot3d(nl_Dmel_ALPNs_EM_IS2_examples_NoSoma, lwd = lwd, col = colfunc_blue)
plot3d(nl_Dsec_ALPNs_IS2_allR_CMTKrigid, lwd = lwd, soma = soma, col = colfunc_red)
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_B_Reg_Comparison_IS2-rigid_IS2_frontal.png", fmt="png", height = height_frontal, width = width_frontal)
# nview3d("dorsal", 0, zoom = 0.5)
# snapshot3d("./3_Figures/Sup_Figure3/Figure_d_Reg_Comparison_IS2-rigid_IS2_dorsal.png", fmt="png", height = 900, width = width_dorsal)
# 
# # Generate Sub-Panel
# Frontal <- image_read("./3_Figures/Sup_Figure3/Figure_d_Reg_Comparison_IS2-rigid_IS2_frontal.png")
# Frontal <- rasterGrob(Frontal)
# 
# Dorsal <- image_read("./3_Figures/Sup_Figure3/Figure_d_Reg_Comparison_IS2-rigid_IS2_dorsal.png")
# Dorsal <- rasterGrob(Dorsal)
# 
# pdf("./3_Figures/Sup_Figure3/Sup_Figure3_B_Dsec_ALPNs_IS2-rigid_IS2_v1.pdf", width = 1, height = 1.2258)
# layout <- rbind(c(1),c(2))
# grid.arrange(arrangeGrob(Frontal, Dorsal,
#                          heights = (c(0.668, 0.355)),
#                          layout_matrix = layout))
# dev.off()
# while (rgl.cur() > 0) {close3d()}



### IS2 & IS2 (warp + mirror) ----
# 1 EM neuron / AL Glomeulus [for clarity]


# loc_Dmel_ALPNs_IS2_allR <- file.path("./1_Data/6_Dataset_other/01.8_Dmel_ALPN_em_VFB_FBbt_00067123_RH_all_IS2_uniglomerular_n457")
loc_Dsec_ALPNs_IS2_allR <- file.path("./1_Data/5_Dataset_our/3.5_Dsec_ALPNS_IS2_allR/")

# nl_Dmel_ALPNs_IS2_allR <- read.neurons(loc_Dmel_ALPNs_IS2_allR)
nl_Dsec_ALPNs_IS2_allR <- read.neurons(loc_Dsec_ALPNs_IS2_allR)

close3d()
open3d()
plot3d(IS2, alpha = alpha_brain, col="cyan")
plot3d(nl_Dmel_ALPNs_EM_IS2_examples_WithSoma, lwd = lwd, soma = soma, col = colfunc_blue)
plot3d(nl_Dmel_ALPNs_EM_IS2_examples_NoSoma, lwd = lwd, col = colfunc_blue)
plot3d(nl_Dsec_ALPNs_IS2_allR, lwd = lwd, soma = soma, col = colfunc_red)
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_B_Reg_Comparison_IS2_IS2_frontal.png", fmt="png", height = height_frontal, width = width_frontal)
nview3d("dorsal", 0, zoom = 0.5)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_B_Reg_Comparison_IS2_IS2_dorsal.png", fmt="png", height = 900, width = width_dorsal)

# Generate Sub-Panel
Frontal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_B_Reg_Comparison_IS2_IS2_frontal.png")
Frontal <- rasterGrob(Frontal)

Dorsal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_B_Reg_Comparison_IS2_IS2_dorsal.png")
Dorsal <- rasterGrob(Dorsal)

pdf("./3_Figures/Sup_Figure3/Sup_Figure3_B_Dsec_ALPNs_IS2-warp_IS2_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1),c(2))
grid.arrange(arrangeGrob(Frontal, Dorsal,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}













## Panel C - Pre- & Post-Registration of Neurons ----


loc_DsecFtoDsecI_warp <- file.path("./1_Data/3_Registration/02_Bridging_Registrations/Reg_DsecF>DsecI/Registration/warp/IS2_DsecI_01_warp_m0g80c8e1e-1x26r4.list")
loc_DsecItoIS2_rigid <- file.path("./1_Data/3_Registration/02_Bridging_Registrations/Reg_DsecI>IS2_rigid/Registration/warp/IS2_DsecI_01_warp_m0g80c8e1e-1x26r4.list")
loc_DsecItoIS2_warp <- file.path("./1_Data/3_Registration/02_Bridging_Registrations/Reg_DsecI>IS2/Registration/warp/IS2_DsecI_01_warp_m0g80c8e1e-1x26r4.list")

nl_Dsec_ALPNs_DsecI_allR <- read.neurons(loc_Dsec_ALPNs_DsecI_allR)

nl_Dsec_ALPNs_IS2_allR_CMTKrigid <- xform(nl_Dsec_ALPNs_DsecI_allR, loc_DsecItoIS2_rigid)
nl_Dsec_ALPNs_IS2_allR_CMTKwarp <- xform(nl_Dsec_ALPNs_DsecI_allR, loc_DsecItoIS2_warp)
# nl_Dsec_ALPNs_IS2_allR_NATwarp <- xform_brain(nl_Dsec_ALPNs_DsecI_allR, sample = IS2, reference = DsecI) # scales the traces up


#### Original / Unregistered Neurons ----
loc_Dsec_preReg_VM5d <- file.path("./1_Data/5_Dataset_our/3.1_Dsec_ALPNs_preReg/")
loc_Dsec_preReg_VM5d_scaled <- file.path("./1_Data/5_Dataset_our/3.1_Dsec_ALPNs_preReg_scaled/")
nl_Dsec_preReg_VM5d <- read.neurons(loc_Dsec_preReg_VM5d, pattern = "*.swc", neuronnames = NULL)


filenames = dir(path = loc_Dsec_preReg_VM5d, pattern="*.swc")
for (i in filenames)
{
  final_name <- i
  i <- paste(loc_Dsec_preReg_VM5d, i, sep = "")
  
  # get Trace
  trace <- read.neuron(i)
  
  # scale Tracey
  trace_scaled <- scale(trace, center = FALSE, scale = c(2.16796,2.16796,1))
  
  output_file <-  paste(loc_Dsec_preReg_VM5d_scaled, final_name, sep = "")
  write.neuron(trace_scaled, file = output_file, dir = loc_Dsec_preReg_VM5d_scaled, format="swc", ext = ".swc")    
  
}

nl_Dsec_preReg_VM5d_scaled <- read.neurons(loc_Dsec_preReg_VM5d_scaled, pattern = "*.swc", neuronnames = NULL)


##### All Neurons ----
clear3d()
open3d()
plot3d(nl_Dsec_preReg_VM5d_scaled, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(DsecF_surf, alpha = alpha_brain, col="grey")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_preReg_scaled_VM5d_inDsecF_anterior_v1.png", fmt="png", height = height_frontal, width = width_frontal)
# nview3d("dorsal", 0, zoom = 0.4)
# snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_preReg_scaled_VM5d_inDsecF_dorsal_v1.png", fmt="png", height = height_dorsal, width = width_dorsal)

# # Generate Sub-Panel
# Frontal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_preReg_scaled_VM5d_inDsecF_anterior_v1.png")
# Frontal <- rasterGrob(Frontal)
# 
# Dorsal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_preReg_scaled_VM5d_inDsecF_dorsal_v1.png")
# Dorsal <- rasterGrob(Dorsal)
# 
# pdf("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_preReg_scaled_VM5d_inDsecF_v1.pdf", width = 1, height = 1.2258)
# layout <- rbind(c(1),c(2))
# grid.arrange(arrangeGrob(Frontal, Dorsal,
#                          heights = (c(0.668, 0.355)),
#                          layout_matrix = layout))
# dev.off()
# while (rgl.cur() > 0) {rgl.close()}
# nlscan(nl_Dsec_preReg_VM5d_scaled)


##### Individual Examples ----
# We selected a good, middle and "bad" quality example of pre-registration neurons
nlscan()

open3d()
plot3d(nl_Dsec_preReg_VM5d_scaled[1], lwd = lwd, soma = soma, col = "red2")
plot3d(DsecF_surf, alpha = alpha_brain, col="grey")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_preReg_scaled_VM5d_inIS2_anterior_N1_v1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_preReg_VM5d_scaled[7], lwd = lwd, soma = soma, col = "red2")
plot3d(DsecF_surf, alpha = alpha_brain, col="grey")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_preReg_scaled_VM5d_inIS2_anterior_N2_v1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_preReg_VM5d_scaled[4], lwd = lwd, soma = soma, col = "red2")
plot3d(DsecF_surf, alpha = alpha_brain, col="grey")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_preReg_scaled_VM5d_inIS2_anterior_N3_v1.png", fmt="png", height = height_frontal, width = width_frontal)
while (rgl.cur() > 0) {rgl.close()}





#### DsecF (warp) ----
# To register each original trace to DsecF we used the individual registration files generated using the CMTK Fiji plugin

# registered in "2_Dataset_Our_v2"
loc_Dsec_DsecF_VM5d <- file.path("./1_Data/5_Dataset_our/3.3_Dsec_ALPNs_DsecF_VM5d/")
nl_Dsec_DsecF_VM5d <- read.neurons(loc_Dsec_DsecF_VM5d, pattern = "*.swc", neuronnames = NULL)


##### All Neurons ----
clear3d()
open3d()
plot3d(nl_Dsec_DsecF_VM5d, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(DsecF_surf, alpha = alpha_brain, col="grey")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecF_VM5d_inDsecF_anterior_v1.png", fmt="png", height = height_frontal, width = width_frontal)
# nview3d("dorsal", 0, zoom = 0.4)
# snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecF_VM5d_inDsecF_dorsal_v1.png", fmt="png", height = height_dorsal, width = width_dorsal)

# # Generate Sub-Panel
# Frontal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecF_VM5d_inDsecF_anterior_v1.png")
# Frontal <- rasterGrob(Frontal)
# 
# Dorsal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecF_VM5d_inDsecF_dorsal_v1.png")
# Dorsal <- rasterGrob(Dorsal)
# 
# pdf("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecF_VM5d_inDsecF_v1.pdf", width = 1, height = 1.2258)
# layout <- rbind(c(1),c(2))
# grid.arrange(arrangeGrob(Frontal, Dorsal,
#                          heights = (c(0.668, 0.355)),
#                          layout_matrix = layout))
# dev.off()
# while (rgl.cur() > 0) {rgl.close()}



##### Individual Examples ----
open3d()
plot3d(nl_Dsec_DsecF_VM5d[1], lwd = lwd, soma = soma, col = "red2")
plot3d(DsecF_surf, alpha = alpha_brain, col="grey")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecF_VM5d_inDsecF_anterior_N1_v1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_DsecF_VM5d[7], lwd = lwd, soma = soma, col = "red2")
plot3d(DsecF_surf, alpha = alpha_brain, col="grey")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecF_VM5d_inDsecF_anterior_N2_v1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_DsecF_VM5d[4], lwd = lwd, soma = soma, col = "red2")
plot3d(DsecF_surf, alpha = alpha_brain, col="grey")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecF_VM5d_inDsecF_anterior_N3_v1.png", fmt="png", height = height_frontal, width = width_frontal)

while (rgl.cur() > 0) {rgl.close()}



#### DsecI (warp) ----
# registered in "2_Dataset_Our_v2"
loc_Dsec_DsecF_VM5d <- file.path("./1_Data/5_Dataset_our/3.3_Dsec_ALPNs_DsecF_VM5d/")
nl_Dsec_DsecF_VM5d <- read.neurons(loc_Dsec_DsecF_VM5d, pattern = "*.swc", neuronnames = NULL)
nl_Dsec_DsecI_VM5d <- xform(nl_Dsec_DsecF_VM5d, DsecFtoDsecI, transformtype = "warp", FallBackToAffine = TRUE)

##### All Neurons ----
clear3d()
open3d()
plot3d(nl_Dsec_DsecF_VM5d, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(DsecI.surf, alpha = alpha_brain, col="red")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecI_VM5d_inDsecI_anterior_v1.png", fmt="png", height = height_frontal, width = width_frontal)
nview3d("dorsal", 0, zoom = 0.4)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecI_VM5d_inDsecI_dorsal_v1.png", fmt="png", height = height_dorsal, width = width_dorsal)

# # Generate Sub-Panel
# Frontal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecI_VM5d_inDsecI_anterior_v1.png")
# Frontal <- rasterGrob(Frontal)
# 
# Dorsal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecI_VM5d_inDsecI_dorsal_v1.png")
# Dorsal <- rasterGrob(Dorsal)
# 
# pdf("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecF_VM5d_inDsecI_v1.pdf", width = 1, height = 1.2258)
# layout <- rbind(c(1),c(2))
# grid.arrange(arrangeGrob(Frontal, Dorsal,
#                          heights = (c(0.668, 0.355)),
#                          layout_matrix = layout))
# dev.off()
# while (rgl.cur() > 0) {rgl.close()}



##### Individual Examples ----
open3d()
plot3d(nl_Dsec_DsecI_VM5d[1], lwd = lwd, soma = soma, col = "red2")
plot3d(DsecI.surf, alpha = alpha_brain, col="red")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecI_VM5d_inDsecI_anterior_N1_v1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_DsecI_VM5d[7], lwd = lwd, soma = soma, col = "red2")
plot3d(DsecI.surf, alpha = alpha_brain, col="red")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecI_VM5d_inDsecI_anterior_N2_v1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_DsecI_VM5d[4], lwd = lwd, soma = soma, col = "red2")
plot3d(DsecI.surf, alpha = alpha_brain, col="red")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_DsecI_VM5d_inDsecI_anterior_N3_v1.png", fmt="png", height = height_frontal, width = width_frontal)

while (rgl.cur() > 0) {rgl.close()}



#### IS2 (warp) ----

loc_Dsec_DsecF_VM5d <- file.path("./1_Data/5_Dataset_our/3.3_Dsec_ALPNs_DsecF_VM5d/")
nl_Dsec_DsecF_VM5d <- read.neurons(loc_Dsec_DsecF_VM5d, pattern = "*.swc", neuronnames = NULL)
nl_Dsec_DsecI_VM5d <- xform(nl_Dsec_DsecF_VM5d, DsecFtoDsecI, transformtype = "warp", FallBackToAffine = TRUE)
nl_Dsec_IS2_VM5d <- xform_brain(nl_Dsec_DsecI_VM5d, sample = DsecI, reference = IS2)


##### All Neurons ----
clear3d()
open3d()
plot3d(nl_Dsec_IS2_VM5d, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(IS2.surf, alpha = alpha_brain, col="cyan")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_VM5d_inIS2_anterior_v1.png", fmt="png", height = height_frontal, width = width_frontal)
nview3d("dorsal", 0, zoom = 0.5)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_VM5d_inIS2_dorsal_v2.png", fmt="png", height = height_dorsal, width = width_dorsal)

# # Generate Sub-Panel
# Frontal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_VM5d_inIS2_anterior_v1.png")
# Frontal <- rasterGrob(Frontal)
# 
# Dorsal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_VM5d_inIS2_dorsal_v2.png")
# Dorsal <- rasterGrob(Dorsal)
# 
# pdf("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_VM5d_inDsecI_v2.pdf", width = 1, height = 1.2258)
# layout <- rbind(c(1),c(2))
# grid.arrange(arrangeGrob(Frontal, Dorsal,
#                          heights = (c(0.668, 0.355)),
#                          layout_matrix = layout))
# dev.off()
# while (rgl.cur() > 0) {rgl.close()}




##### Individual Examples ----
open3d()
plot3d(nl_Dsec_IS2_VM5d[1], lwd = lwd, soma = soma, col = "red2")
plot3d(IS2.surf, alpha = alpha_brain, col="cyan")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_VM5d_inIS2_anterior_N1_v2.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_VM5d[7], lwd = lwd, soma = soma, col = "red2")
plot3d(IS2.surf, alpha = alpha_brain, col="cyan")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_VM5d_inIS2_anterior_N2_v2.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_VM5d[4], lwd = lwd, soma = soma, col = "red2")
plot3d(IS2.surf, alpha = alpha_brain, col="cyan")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_VM5d_inIS2_anterior_N3_v2.png", fmt="png", height = height_frontal, width = width_frontal)

while (rgl.cur() > 0) {rgl.close()}



#### IS2 (warp+ mirror) ----
loc_Dsec_DsecF_VM5d <- file.path("./1_Data/5_Dataset_our/3.3_Dsec_ALPNs_DsecF_VM5d/")
nl_Dsec_DsecF_VM5d <- read.neurons(loc_Dsec_DsecF_VM5d, pattern = "*.swc", neuronnames = NULL)
nl_Dsec_DsecI_VM5d <- xform(nl_Dsec_DsecF_VM5d, DsecFtoDsecI, transformtype = "warp", FallBackToAffine = TRUE)
nl_Dsec_IS2_VM5d <- xform_brain(nl_Dsec_DsecI_VM5d, sample = DsecI, reference = IS2)
nl_Dsec_IS2_mir_VM5d <- mirror_brain(nl_Dsec_IS2_VM5d[c(1,2,3,5,6,7,8)], IS2, .progress='text')
nl_Dsec_IS2_mir_VM5d <- c(nl_Dsec_IS2_mir_VM5d, nl_Dsec_IS2_VM5d[4])


##### All Neurons ----
open3d()
plot3d(nl_Dsec_IS2_mir_VM5d, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(IS2.surf, alpha = alpha_brain, col="cyan")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_mir_VM5d_anterior_v1.png", fmt="png", height = height_frontal, width = width_frontal)
nview3d("dorsal", 0, zoom = 0.5)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_mir_VM5d_dorsal_v1.png", fmt="png", height = height_dorsal, width = width_dorsal)

# # Generate Sub-Panel
# Frontal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_VM5d_inIS2_anterior_v1.png")
# Frontal <- rasterGrob(Frontal)
# 
# Dorsal <- image_read("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_VM5d_inIS2_dorsal_v2.png")
# Dorsal <- rasterGrob(Dorsal)
# 
# pdf("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_VM5d_inDsecI_v2.pdf", width = 1, height = 1.2258)
# layout <- rbind(c(1),c(2))
# grid.arrange(arrangeGrob(Frontal, Dorsal,
#                          heights = (c(0.668, 0.355)),
#                          layout_matrix = layout))
# dev.off()
# while (rgl.cur() > 0) {rgl.close()}


##### Individual Examples ----
open3d()
plot3d(nl_Dsec_IS2_mir_VM5d[1], lwd = lwd, soma = soma, col = "red2")
plot3d(IS2.surf, alpha = alpha_brain, col="cyan")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_mir_VM5d_inIS2_anterior_N1_v2.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_mir_VM5d[6], lwd = lwd, soma = soma, col = "red2")
plot3d(IS2.surf, alpha = alpha_brain, col="cyan")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_mir_VM5d_inIS2_anterior_N2_v2.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_mir_VM5d[8], lwd = lwd, soma = soma, col = "red2")
plot3d(IS2.surf, alpha = alpha_brain, col="cyan")
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_IS2_mir_VM5d_inIS2_anterior_N3_v2.png", fmt="png", height = height_frontal, width = width_frontal)

while (rgl.cur() > 0) {rgl.close()}










## Panel D - Pruning & NBLASTing of VM5d & DL2v ----

# To be able to prune the neurons manually in Neutube I had to change radius values in FAFB neurons (-0.001 to 1) and Dmel Conf neurons (NA to 1).
# This was necessary as it was not possible to select very small or not existing nodes in order to delete them using Neutube.

### Pruning & NBLAST - VM5d----

#### No Pruning ----
loc_Dsec_IS2_VM5d <- file.path("./1_Data/6_Dataset_other/08_Dsec_IS2_VM5d")
loc_Dmel_em_IS2_VM5d <- file.path("./1_Data/6_Dataset_other/08_Dmel_em_IS2_VM5d")
loc_Dmel_conf_IS2_VM5d <- file.path("./1_Data/6_Dataset_other/08_Dmel_conf_IS2_VM5d")

nl_Dsec_IS2_VM5d <- read.neurons(loc_Dsec_IS2_VM5d, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_em_IS2_VM5d <- read.neurons(loc_Dmel_em_IS2_VM5d, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_conf_IS2_VM5d <- read.neurons(loc_Dmel_conf_IS2_VM5d, pattern = "*.swc", neuronnames = NULL)

nl_Dsec_Dmel_IS2_VM5d <- c(nl_Dsec_IS2_VM5d, nl_Dmel_em_IS2_VM5d, nl_Dmel_conf_IS2_VM5d)




nlscan(nl_Dmel_conf_IS2_VM5d, lwd = lwd, soma = soma)


# open3d()
# plot3d(nl_Dmel_em_IS2_VM5d, lwd = lwd, soma = soma, col = colfunc_darkblue)
# clear3d()
# Select neurons which are likely not correctly rooted using nlscan()
# list_Dmel_em_IS2_VM5d_NoSoma <- nlscan(nl_Dmel_em_IS2_VM5d, lwd = lwd, soma = soma)
# saveRDS(list_Dmel_em_IS2_VM5d_NoSoma, file = "./1_Data/6_Dataset_other/08_list_Dmel_em_IS2_VM5d_NoSoma.rds")
list_Dmel_em_IS2_VM5d_NoSoma <- readRDS("./1_Data/6_Dataset_other/08_list_Dmel_em_IS2_VM5d_NoSoma.rds")
# n=5 possibly incorrectly annotated /not existing somata
nl_Dmel_em_IS2_VM5d_NoSoma <- nl_Dmel_em_IS2_VM5d[list_Dmel_em_IS2_VM5d_NoSoma]

# create neuron lists of neurons with soma
list_Dmel_em_IS2_VM5d_WithSoma <- setdiff(names(nl_Dmel_em_IS2_VM5d), list_Dmel_em_IS2_VM5d_NoSoma)
nl_Dmel_em_IS2_VM5d_WithSoma <- nl_Dmel_em_IS2_VM5d[list_Dmel_em_IS2_VM5d_WithSoma]


# open3d()
# plot3d(nl_Dmel_conf_IS2_VM5d_pruned1, lwd = lwd, soma = soma, col = colfunc_darkblue)
# clear3d()
# Select neurons which are likely not correctly rooted using nlscan()
# list_Dmel_conf_IS2_VM5d_NoSoma <- nlscan(nl_Dmel_conf_IS2_VM5d, lwd = lwd, soma = soma)
# saveRDS(list_Dmel_conf_IS2_VM5d_NoSoma, file = "./1_Data/6_Dataset_other/08_list_Dmel_conf_IS2_VM5d_NoSoma.rds")
list_Dmel_conf_IS2_VM5d_NoSoma <- readRDS("./1_Data/6_Dataset_other/08_list_Dmel_conf_IS2_VM5d_NoSoma.rds")
# n=2 possibly incorrectly annotated /not existing somata
nl_Dmel_conf_IS2_VM5d_NoSoma <- nl_Dmel_conf_IS2_VM5d[list_Dmel_conf_IS2_VM5d_NoSoma]

# create neuron lists of neurons with soma
list_Dmel_conf_IS2_VM5d_WithSoma <- setdiff(names(nl_Dmel_conf_IS2_VM5d), list_Dmel_conf_IS2_VM5d_NoSoma)
nl_Dmel_conf_IS2_VM5d_WithSoma <- nl_Dmel_conf_IS2_VM5d[list_Dmel_conf_IS2_VM5d_WithSoma]






##### Overview ----
open3d()
plot3d(nl_Dsec_IS2_VM5d, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_em_IS2_VM5d_WithSoma, lwd = lwd, soma = soma, col = colfunc_darkblue)
plot3d(nl_Dmel_em_IS2_VM5d_NoSoma, lwd = lwd, col = colfunc_darkblue)
plot3d(nl_Dmel_conf_IS2_VM5d_WithSoma, lwd = lwd, soma = soma, col = colfunc_lightblue)
plot3d(nl_Dmel_conf_IS2_VM5d_NoSoma, lwd = lwd, col = colfunc_lightblue)
nview3d("frontal", 0, zoom = 0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_VM5d_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_VM5d, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_em_IS2_VM5d_WithSoma, lwd = lwd, soma = soma, col = colfunc_darkblue)
plot3d(nl_Dmel_em_IS2_VM5d_NoSoma, lwd = lwd, col = colfunc_darkblue)
nview3d("frontal", 0, zoom = 0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_em_VM5d_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_VM5d, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_conf_IS2_VM5d_WithSoma, lwd = lwd, soma = soma, col = colfunc_lightblue)
plot3d(nl_Dmel_conf_IS2_VM5d_NoSoma, lwd = lwd, col = colfunc_lightblue)
nview3d("frontal", 0, zoom = 0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_conf_VM5d_anterior.png", fmt="png", height = height_frontal, width = width_frontal)



##### NBLAST ----

###### Analysis ----
dots_Dsec_Dmel_IS2_VM5d <- dotprops(nl_Dsec_Dmel_IS2_VM5d, OmitFailures = NA)
scores_Dsec_Dmel_IS2_VM5d <- nblast_allbyall(dots_Dsec_Dmel_IS2_VM5d)
hc_Dsec_Dmel_IS2_VM5d <- nhclust(scoremat=scores_Dsec_Dmel_IS2_VM5d)
h = 0.5
color_Dsec_Dmel_IS2_VM5d <- colour_clusters(hc_Dsec_Dmel_IS2_VM5d, h=h, groupLabels=F)

###### Dendrogram ----
pdf("./3_Figures/Sup_Figure3/Sup_Figure3_D_NBLAST_Dsec_Dmel_IS2_VM5d_v1.pdf", 
    width=22, height=10)
# PDF export: x= 0,2 inch per entry; y= 15inch
par(mar = c(15,3,5,1))
par(mgp = c(1.5, 0.5, 0))
plot(color_Dsec_Dmel_IS2_VM5d,
     main = "Dsec_Dmel_VM5d_IS2",
     ylab = "NBLAST Score")
abline(h=h, lty=2, col="grey")
rect <- rect.hclust(hc_Dsec_Dmel_IS2_VM5d, h=h, border = "grey")
beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
y_clus <- weighted.mean(rev(hc_Dsec_Dmel_IS2_VM5d$height)+0.1)
text(x=beg_clus, y=y_clus, col="black", font=2)
dev.off()

open3d()
plot3d(hc_Dsec_Dmel_IS2_VM5d, h=h, db=nl_Dsec_Dmel_IS2_VM5d, lwd=3, soma=3, groups=1, col= "red")
plot3d(hc_Dsec_Dmel_IS2_VM5d, h=h, db=nl_Dsec_Dmel_IS2_VM5d, lwd=3, soma=3, groups=c(6:7), col= "purple")
nview3d("frontal", 0, zoom = 1)




#### Pruning 1 ----
# no glomerulus, with soma,  with tract,   with MB,  with LH

loc_Dsec_IS2_VM5d_pruned1 <- file.path("./1_Data/6_Dataset_other/08_Dsec_IS2_VM5d_pruned1")
loc_Dmel_em_IS2_VM5d_pruned1 <- file.path("./1_Data/6_Dataset_other/08_Dmel_em_IS2_VM5d_pruned1")
loc_Dmel_conf_IS2_VM5d_pruned1 <- file.path("./1_Data/6_Dataset_other/08_Dmel_conf_IS2_VM5d_pruned1")

nl_Dsec_IS2_VM5d_pruned1 <- read.neurons(loc_Dsec_IS2_VM5d_pruned1, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_em_IS2_VM5d_pruned1 <- read.neurons(loc_Dmel_em_IS2_VM5d_pruned1, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_conf_IS2_VM5d_pruned1 <- read.neurons(loc_Dmel_conf_IS2_VM5d_pruned1, pattern = "*.swc", neuronnames = NULL)

nl_Dsec_Dmel_IS2_VM5d_pruned1 <- c(nl_Dsec_IS2_VM5d_pruned1, nl_Dmel_em_IS2_VM5d_pruned1, nl_Dmel_conf_IS2_VM5d_pruned1)



# open3d()
# plot3d(nl_Dmel_em_IS2_VM5d_pruned1, lwd = lwd, soma = soma, col = colfunc_darkblue)
# clear3d()
# Select neurons which are likely not correctly rooted using nlscan()
# list_Dmel_em_IS2_VM5d_pruned1_NoSoma <- nlscan(nl_Dmel_em_IS2_VM5d_pruned1, lwd = lwd, soma = soma)
# saveRDS(list_Dmel_em_IS2_VM5d_pruned1_NoSoma, file = "./1_Data/6_Dataset_other/08_list_Dmel_em_IS2_VM5d_pruned1_NoSoma.rds")
list_Dmel_em_IS2_VM5d_pruned1_NoSoma <- readRDS("./1_Data/6_Dataset_other/08_list_Dmel_em_IS2_VM5d_pruned1_NoSoma.rds")
# n=5 possibly incorrectly annotated /not existing somata
nl_Dmel_em_IS2_VM5d_pruned1_NoSoma <- nl_Dmel_em_IS2_VM5d_pruned1[list_Dmel_em_IS2_VM5d_pruned1_NoSoma]

# create neuron lists of neurons with soma
list_Dmel_em_IS2_VM5d_pruned1_WithSoma <- setdiff(names(nl_Dmel_em_IS2_VM5d_pruned1), list_Dmel_em_IS2_VM5d_pruned1_NoSoma)
nl_Dmel_em_IS2_VM5d_pruned1_WithSoma <- nl_Dmel_em_IS2_VM5d_pruned1[list_Dmel_em_IS2_VM5d_pruned1_WithSoma]




# open3d()
# plot3d(nl_Dmel_conf_IS2_VM5d_pruned1, lwd = lwd, soma = soma, col = colfunc_darkblue)
# clear3d()
# Select neurons which are likely not correctly rooted using nlscan()
# list_Dmel_conf_IS2_VM5d_pruned1_NoSoma <- nlscan(nl_Dmel_conf_IS2_VM5d_pruned1, lwd = lwd, soma = soma)
# saveRDS(list_Dmel_conf_IS2_VM5d_pruned1_NoSoma, file = "./1_Data/6_Dataset_other/08_list_Dmel_conf_IS2_VM5d_pruned1_NoSoma.rds")
list_Dmel_conf_IS2_VM5d_pruned1_NoSoma <- readRDS("./1_Data/6_Dataset_other/08_list_Dmel_conf_IS2_VM5d_pruned1_NoSoma.rds")
# n=2 possibly incorrectly annotated /not existing somata
nl_Dmel_conf_IS2_VM5d_pruned1_NoSoma <- nl_Dmel_conf_IS2_VM5d_pruned1[list_Dmel_conf_IS2_VM5d_pruned1_NoSoma]

# create neuron lists of neurons with soma
list_Dmel_conf_IS2_VM5d_pruned1_WithSoma <- setdiff(names(nl_Dmel_conf_IS2_VM5d_pruned1), list_Dmel_conf_IS2_VM5d_pruned1_NoSoma)
nl_Dmel_conf_IS2_VM5d_pruned1_WithSoma <- nl_Dmel_conf_IS2_VM5d_pruned1[list_Dmel_conf_IS2_VM5d_pruned1_WithSoma]


##### Overview ----
open3d()
plot3d(nl_Dsec_IS2_VM5d_pruned1, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_em_IS2_VM5d_pruned1_WithSoma, lwd = lwd, soma = soma, col = colfunc_darkblue)
plot3d(nl_Dmel_em_IS2_VM5d_pruned1_NoSoma, lwd = lwd, col = colfunc_darkblue) # soma not plotted
plot3d(nl_Dmel_conf_IS2_VM5d_pruned1_WithSoma, lwd = lwd, soma = soma, col = colfunc_lightblue)
plot3d(nl_Dmel_conf_IS2_VM5d_pruned1_NoSoma, lwd = lwd, col = colfunc_lightblue) # soma not plotted
nview3d("frontal", 0, zoom = 0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_VM5d_pruned1_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_VM5d_pruned1, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_em_IS2_VM5d_pruned1_WithSoma, lwd = lwd, soma = soma, col = colfunc_darkblue)
plot3d(nl_Dmel_em_IS2_VM5d_pruned1_NoSoma, lwd = lwd, col = colfunc_darkblue) # soma not plotted
nview3d("frontal", 0, zoom = 0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_em_VM5d_pruned1_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_VM5d_pruned1, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_conf_IS2_VM5d_pruned1_WithSoma, lwd = lwd, soma = soma, col = colfunc_lightblue)
plot3d(nl_Dmel_conf_IS2_VM5d_pruned1_NoSoma, lwd = lwd, col = colfunc_lightblue) # soma not plotted
nview3d("frontal", 0, zoom = 0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_conf_VM5d_pruned1_anterior.png", fmt="png", height = height_frontal, width = width_frontal)


##### NBLAST ----

###### Analysis ----
dots_Dsec_Dmel_IS2_VM5d_pruned1 <- dotprops(nl_Dsec_Dmel_IS2_VM5d_pruned1, OmitFailures = NA)
scores_Dsec_Dmel_IS2_VM5d_pruned1 <- nblast_allbyall(dots_Dsec_Dmel_IS2_VM5d_pruned1)
hc_Dsec_Dmel_IS2_VM5d_pruned1 <- nhclust(scoremat=scores_Dsec_Dmel_IS2_VM5d_pruned1)
h = 0.75
color_Dsec_Dmel_IS2_VM5d_pruned1 <- colour_clusters(hc_Dsec_Dmel_IS2_VM5d_pruned1, h=h, groupLabels=F)

###### Dendrogram ----
pdf("./3_Figures/Sup_Figure3/Sup_Figure3_D_NBLAST_Dsec_Dmel_IS2_VM5d_pruned1_v2.pdf", 
    width=22, height=10)
# PDF export: x= 0,2 inch per entry; y= 15inch
par(mar = c(15,3,5,1))
par(mgp = c(1.5, 0.5, 0))
plot(color_Dsec_Dmel_IS2_VM5d_pruned1,
     main = "Dsec_Dmel_IS2_VM5d_pruned1",
     ylab = "NBLAST Score")
abline(h=h, lty=2, col="grey")
rect <- rect.hclust(hc_Dsec_Dmel_IS2_VM5d_pruned1, h=h, border = "grey")
beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
y_clus <- weighted.mean(rev(hc_Dsec_Dmel_IS2_VM5d_pruned1$height)+0.1)
text(x=beg_clus, y=y_clus, col="black", font=2)
dev.off()

open3d()
plot3d(hc_Dsec_Dmel_IS2_VM5d_pruned1, h=h, db=nl_Dsec_Dmel_IS2_VM5d_pruned1, lwd=3, soma=3, groups=1, col= "red")
plot3d(hc_Dsec_Dmel_IS2_VM5d_pruned1, h=h, db=nl_Dsec_Dmel_IS2_VM5d_pruned1, lwd=3, soma=3, groups=c(6:7), col= "purple")
nview3d("frontal", 0, zoom = 1)



#### Pruning 3 ----
# no glomerulus,   no soma,    no tract,   with MB,  with LH

loc_Dsec_IS2_VM5d_pruned3 <- file.path("./1_Data/6_Dataset_other/08_Dsec_IS2_VM5d_pruned3")
loc_Dmel_em_IS2_VM5d_pruned3 <- file.path("./1_Data/6_Dataset_other/08_Dmel_em_IS2_VM5d_pruned3")
loc_Dmel_conf_IS2_VM5d_pruned3 <- file.path("./1_Data/6_Dataset_other/08_Dmel_conf_IS2_VM5d_pruned3")

nl_Dsec_IS2_VM5d_pruned3 <- read.neurons(loc_Dsec_IS2_VM5d_pruned3, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_em_IS2_VM5d_pruned3 <- read.neurons(loc_Dmel_em_IS2_VM5d_pruned3, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_conf_IS2_VM5d_pruned3 <- read.neurons(loc_Dmel_conf_IS2_VM5d_pruned3, pattern = "*.swc", neuronnames = NULL)

nl_Dsec_Dmel_IS2_VM5d_pruned3 <- c(nl_Dsec_IS2_VM5d_pruned1, nl_Dmel_em_IS2_VM5d_pruned3, nl_Dmel_conf_IS2_VM5d_pruned1)

##### Overview ----
open3d()
plot3d(nl_Dsec_IS2_VM5d_pruned3, lwd = lwd, col = colfunc_red)
plot3d(nl_Dmel_em_IS2_VM5d_pruned3, lwd = lwd, col = colfunc_darkblue)
plot3d(nl_Dmel_conf_IS2_VM5d_pruned3, lwd = lwd, col = colfunc_lightblue)
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_VM5d_pruned3_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_VM5d_pruned3, lwd = lwd, col = colfunc_red)
plot3d(nl_Dmel_em_IS2_VM5d_pruned3, lwd = lwd, col = colfunc_darkblue)
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_em_VM5d_pruned3_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_VM5d_pruned3, lwd = lwd, col = colfunc_red)
plot3d(nl_Dmel_conf_IS2_VM5d_pruned3, lwd = lwd, col = colfunc_lightblue)
nview3d("frontal", 0, zoom = 0.75)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_conf_VM5d_pruned3_anterior.png", fmt="png", height = height_frontal, width = width_frontal)


##### NBLAST ----

###### Analysis ----
dots_Dsec_Dmel_IS2_VM5d_pruned3 <- dotprops(nl_Dsec_Dmel_IS2_VM5d_pruned3, OmitFailures = NA)
scores_Dsec_Dmel_IS2_VM5d_pruned3 <- nblast_allbyall(dots_Dsec_Dmel_IS2_VM5d_pruned3)
hc_Dsec_Dmel_IS2_VM5d_pruned3 <- nhclust(scoremat=scores_Dsec_Dmel_IS2_VM5d_pruned3)
h = 0.75
color_Dsec_Dmel_IS2_VM5d_pruned3 <- colour_clusters(hc_Dsec_Dmel_IS2_VM5d_pruned3, h=h, groupLabels=F)

###### Dendrogram ----
pdf("./3_Figures/Sup_Figure3/Sup_Figure3_D_NBLAST_Dsec_Dmel_IS2_VM5d_pruned3_v1.pdf", 
    width=22, height=10)
# PDF export: x= 0,2 inch per entry; y= 15inch
par(mar = c(15,3,5,1))
par(mgp = c(1.5, 0.5, 0))
plot(color_Dsec_Dmel_IS2_VM5d_pruned3,
     main = "Dsec_Dmel_IS2_VM5d_pruned3",
     ylab = "NBLAST Score")
abline(h=h, lty=2, col="grey")
rect <- rect.hclust(hc_Dsec_Dmel_IS2_VM5d_pruned3, h=h, border = "grey")
beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
y_clus <- weighted.mean(rev(hc_Dsec_Dmel_IS2_VM5d_pruned3$height)+0.1)
text(x=beg_clus, y=y_clus, col="black", font=2)
dev.off()

open3d()
plot3d(hc_Dsec_Dmel_IS2_VM5d_pruned3, h=h, db=nl_Dsec_Dmel_IS2_VM5d_pruned3, lwd=3, soma=3, groups=1, col= "red")
plot3d(hc_Dsec_Dmel_IS2_VM5d_pruned3, h=h, db=nl_Dsec_Dmel_IS2_VM5d_pruned3, lwd=3, soma=3, groups=c(6:7), col= "purple")
nview3d("frontal", 0, zoom = 1)




### Pruning & NBLAST - DL2v ----

#### No Pruning ----
loc_Dsec_IS2_DL2v <- file.path("./1_Data/6_Dataset_other/11_Dsec_IS2_DL2v")
loc_Dmel_em_IS2_DL2v <- file.path("./1_Data/6_Dataset_other/11_Dmel_em_IS2_DL2v")
loc_Dmel_conf_IS2_DL2v <- file.path("./1_Data/6_Dataset_other/11_Dmel_conf_IS2_DL2v")

nl_Dsec_IS2_DL2v <- read.neurons(loc_Dsec_IS2_DL2v, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_IS2_em_DL2v <- read.neurons(loc_Dmel_em_IS2_DL2v, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_IS2_conf_DL2v <- read.neurons(loc_Dmel_conf_IS2_DL2v, pattern = "*.swc", neuronnames = NULL)

nl_Dsec_Dmel_IS2_DL2v <- c(nl_Dsec_IS2_DL2v, nl_Dmel_IS2_em_DL2v, nl_Dmel_IS2_conf_DL2v)

##### Overview ----
open3d()
plot3d(nl_Dsec_IS2_DL2v, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_IS2_em_DL2v, lwd = lwd, soma = soma, col = colfunc_darkblue)
plot3d(nl_Dmel_IS2_conf_DL2v, lwd = lwd, soma = soma, col = colfunc_lightblue)
nview3d("frontal", 0, zoom = 0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_DL2v_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_DL2v, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_IS2_em_DL2v, lwd = lwd, soma = soma, col = colfunc_darkblue)
nview3d("frontal", 0, zoom = 0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_em_DL2v_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_DL2v, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_IS2_conf_DL2v, lwd = lwd, soma = soma, col = colfunc_lightblue)
nview3d("frontal", 0, zoom = 0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_conf_DL2v_anterior.png", fmt="png", height = height_frontal, width = width_frontal)



##### NBLAST ----

###### Analysis ----
dots_Dsec_Dmel_IS2_DL2v <- dotprops(nl_Dsec_Dmel_IS2_DL2v, OmitFailures = NA)
scores_Dsec_Dmel_IS2_DL2v <- nblast_allbyall(dots_Dsec_Dmel_IS2_DL2v)
hc_Dsec_Dmel_IS2_DL2v <- nhclust(scoremat=scores_Dsec_Dmel_IS2_DL2v)
h = 0.75
color_Dsec_Dmel_IS2_DL2v <- colour_clusters(hc_Dsec_Dmel_IS2_DL2v, h=h, groupLabels=F)

###### Dendrogram ----
pdf("./3_Figures/Sup_Figure3/Sup_Figure3_D_NBLAST_Dsec_Dmel_IS2_DL2v_v1.pdf", 
    width=22, height=10)
# PDF export: x= 0,2 inch per entry; y= 15inch
par(mar = c(15,3,5,1))
par(mgp = c(1.5, 0.5, 0))
plot(color_Dsec_Dmel_IS2_DL2v,
     main = "Dsec_Dmel_DL2v_IS2",
     ylab = "NBLAST Score")
abline(h=h, lty=2, col="grey")
rect <- rect.hclust(hc_Dsec_Dmel_IS2_DL2v, h=h, border = "grey")
beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
y_clus <- weighted.mean(rev(hc_Dsec_Dmel_IS2_DL2v$height)+0.1)
text(x=beg_clus, y=y_clus, col="black", font=2)
dev.off()




#### Pruning 1 ----
# no glomerulus, with soma,  with tract,   with MB,  with LH

loc_Dsec_IS2_DL2v_pruned1 <- file.path("./1_Data/6_Dataset_other/11_Dsec_IS2_DL2v_pruned1")
loc_Dmel_em_IS2_DL2v_pruned1 <- file.path("./1_Data/6_Dataset_other/11_Dmel_em_IS2_DL2v_pruned1")
loc_Dmel_conf_IS2_DL2v_pruned1 <- file.path("./1_Data/6_Dataset_other/11_Dmel_conf_IS2_DL2v_pruned1")

nl_Dsec_IS2_DL2v_pruned1 <- read.neurons(loc_Dsec_IS2_DL2v_pruned1, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_IS2_em_DL2v_pruned1 <- read.neurons(loc_Dmel_em_IS2_DL2v_pruned1, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_IS2_conf_DL2v_pruned1 <- read.neurons(loc_Dmel_conf_IS2_DL2v_pruned1, pattern = "*.swc", neuronnames = NULL)

nl_Dsec_Dmel_IS2_DL2v_pruned1 <- c(nl_Dsec_IS2_DL2v_pruned1, nl_Dmel_IS2_em_DL2v_pruned1, nl_Dmel_IS2_conf_DL2v_pruned1)

##### Overview ----
open3d()
plot3d(nl_Dsec_IS2_DL2v_pruned1, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_IS2_em_DL2v_pruned1, lwd = lwd, soma = soma, col = colfunc_darkblue)
plot3d(nl_Dmel_IS2_conf_DL2v_pruned1, lwd = lwd, soma = soma, col = colfunc_lightblue)
nview3d("frontal", 0, zoom =  0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_DL2v_pruned1_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_DL2v_pruned1, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_IS2_em_DL2v_pruned1, lwd = lwd, soma = soma, col = colfunc_darkblue)
nview3d("frontal", 0, zoom =  0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_em_DL2v_pruned1_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_DL2v_pruned1, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_IS2_conf_DL2v_pruned1, lwd = lwd, soma = soma, col = colfunc_lightblue)
nview3d("frontal", 0, zoom =  0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_conf_DL2v_pruned1_anterior.png", fmt="png", height = height_frontal, width = width_frontal)



##### NBLAST ----

###### Analysis ----
dots_Dsec_Dmel_IS2_DL2v_pruned1 <- dotprops(nl_Dsec_Dmel_IS2_DL2v_pruned1, OmitFailures = NA)
scores_Dsec_Dmel_IS2_DL2v_pruned1 <- nblast_allbyall(dots_Dsec_Dmel_IS2_DL2v_pruned1)
hc_Dsec_Dmel_IS2_DL2v_pruned1 <- nhclust(scoremat=scores_Dsec_Dmel_IS2_DL2v_pruned1)
h = 0.75
color_Dsec_Dmel_IS2_DL2v_pruned1 <- colour_clusters(hc_Dsec_Dmel_IS2_DL2v_pruned1, h=h, groupLabels=F)

###### Dendrogram ----
pdf("./3_Figures/Sup_Figure3/Sup_Figure3_D_NBLAST_Dsec_Dmel_IS2_DL2v_pruned1_v1.pdf", 
    width=22, height=10)
# PDF export: x= 0,2 inch per entry; y= 15inch
par(mar = c(15,3,5,1))
par(mgp = c(1.5, 0.5, 0))
plot(color_Dsec_Dmel_IS2_DL2v_pruned1,
     main = "Dsec_Dmel_IS2_DL2v_pruned1",
     ylab = "NBLAST Score")
abline(h=h, lty=2, col="grey")
rect <- rect.hclust(hc_Dsec_Dmel_IS2_DL2v_pruned1, h=h, border = "grey")
beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
y_clus <- weighted.mean(rev(hc_Dsec_Dmel_IS2_DL2v_pruned1$height)+0.1)
text(x=beg_clus, y=y_clus, col="black", font=2)
dev.off()



#### Pruning 3 ----
# no glomerulus,   no soma,    no tract,   with MB,  with LH

loc_Dsec_IS2_DL2v_pruned3 <- file.path("./1_Data/6_Dataset_other/11_Dsec_IS2_DL2v_pruned3")
loc_Dmel_em_IS2_DL2v_pruned3 <- file.path("./1_Data/6_Dataset_other/11_Dmel_em_IS2_DL2v_pruned3")
loc_Dmel_conf_IS2_DL2v_pruned3 <- file.path("./1_Data/6_Dataset_other/11_Dmel_conf_IS2_DL2v_pruned3")

nl_Dsec_IS2_DL2v_pruned3 <- read.neurons(loc_Dsec_IS2_DL2v_pruned3, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_IS2_em_DL2v_pruned3 <- read.neurons(loc_Dmel_em_IS2_DL2v_pruned3, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_IS2_conf_DL2v_pruned3 <- read.neurons(loc_Dmel_conf_IS2_DL2v_pruned3, pattern = "*.swc", neuronnames = NULL)

nl_Dsec_Dmel_IS2_DL2v_pruned3 <- c(nl_Dsec_IS2_DL2v_pruned3, nl_Dmel_IS2_em_DL2v_pruned3, nl_Dmel_IS2_conf_DL2v_pruned3)

##### Overview ----
open3d()
plot3d(nl_Dsec_IS2_DL2v_pruned3, lwd = lwd, col = colfunc_red)  # no soma plotted
plot3d(nl_Dmel_IS2_em_DL2v_pruned3, lwd = lwd, col = colfunc_darkblue)  # no soma plotted
plot3d(nl_Dmel_IS2_conf_DL2v_pruned3, lwd = lwd, col = colfunc_lightblue)  # no soma plotted
nview3d("frontal", 0, zoom = 0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_DL2v_pruned3_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(nl_Dsec_IS2_DL2v_pruned3, lwd = lwd, col = colfunc_red)  # no soma plotted
plot3d(nl_Dmel_IS2_em_DL2v_pruned3, lwd = lwd, col = colfunc_darkblue)  # no soma plotted
nview3d("frontal", 0, zoom = 0.65)
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_C_Dsec_Dmel_em_DL2v_pruned3_anterior.png", fmt="png", height = height_frontal, width = width_frontal)

clear3d()
open3d()
plot3d(nl_Dsec_IS2_DL2v_pruned3, lwd = lwd, col = colfunc_red)  # no soma plotted
plot3d(nl_Dmel_IS2_conf_DL2v_pruned3, lwd = lwd, col = colfunc_lightblue)  # no soma plotted
nview3d("frontal", 0, zoom = 0.75) # somehow 0.65 does not give the wanted results
snapshot3d("./3_Figures/Sup_Figure3/Sup_Figure3_D_Dsec_Dmel_conf_DL2v_pruned3_anterior.png", fmt="png", height = height_frontal, width = width_frontal)


##### NBLAST ----

###### Analysis ----
dots_Dsec_Dmel_IS2_DL2v_pruned3 <- dotprops(nl_Dsec_Dmel_IS2_DL2v_pruned3, OmitFailures = NA)
scores_Dsec_Dmel_IS2_DL2v_pruned3 <- nblast_allbyall(dots_Dsec_Dmel_IS2_DL2v_pruned3)
hc_Dsec_Dmel_IS2_DL2v_pruned3 <- nhclust(scoremat=scores_Dsec_Dmel_IS2_DL2v_pruned3)
h = 0.75
color_Dsec_Dmel_IS2_DL2v_pruned3 <- colour_clusters(hc_Dsec_Dmel_IS2_DL2v_pruned3, h=h, groupLabels=F)

###### Dendrogram ----
pdf("./3_Figures/Sup_Figure3/Sup_Figure3_D_NBLAST_Dsec_Dmel_IS2_DL2v_pruned3_v1.pdf", 
    width=22, height=10)
# PDF export: x= 0,2 inch per entry; y= 15inch
par(mar = c(15,3,5,1))
par(mgp = c(1.5, 0.5, 0))
plot(color_Dsec_Dmel_IS2_DL2v_pruned3,
     main = "Dsec_Dmel_IS2_DL2v_pruned3",
     ylab = "NBLAST Score")
abline(h=h, lty=2, col="grey")
rect <- rect.hclust(hc_Dsec_Dmel_IS2_DL2v_pruned3, h=h, border = "grey")
beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
y_clus <- weighted.mean(rev(hc_Dsec_Dmel_IS2_DL2v_pruned3$height)+0.1)
text(x=beg_clus, y=y_clus, col="black", font=2)
dev.off()


while (rgl.cur() > 0) {rgl.close()}

