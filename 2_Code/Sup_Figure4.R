#-----------------------------#
# Supplementary Figure 4  ----
# Comparison Dsec Conf vs Dmel EM & Conf 
#-----------------------------#


## Front Matter ----
### Load Packages & Resources ----
source("2_Code/0_Project_Initialization.R")


#------------------------------  Description  ---------------------------------#
# 
# 
# 
#------------------------------------------------------------------------------#


## Panel A----

### mlPN1 - v8_cl1 ----

####  mlPN1 - Dsec Conf ----
# > see Sup_Figure2


#### mlPN1 - Dmel Conf ----
# Does not exist in the VFB Dataset


#### mlPN1 - Dmel EM ----

loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN1 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_mlPN1/")
nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN1 <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN1, pattern = "*.swc", neuronnames = NULL)

#nl_Dmel_EM_FlyEM_ALPNs_IS2_mlPN1_example_R <- neuronlist(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN1[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN1, lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_A_Dmel_EM_mlPN1_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN1, lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_A_Dmel_EM_mlPN1_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# # Cluster example
# open3d()
# plot3d(IS2, alpha = alpha_brain)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_mlPN1_example_R, lwd=lwd, soma=soma, col=colfunc_darkblue)
# nview3d("frontal", 0, zoom = zoom_frontal)
# snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_A_Dmel_EM_mlPN1_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)
# 
# open3d()
# plot3d(IS2, alpha = alpha_brain)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_mlPN1_example_R, lwd=lwd, soma=soma, col=colfunc_darkblue)
# nview3d("dorsal", 0, zoom = 0.46)
# snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_A_Dmel_EM_mlPN1_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_A_Dmel_EM_mlPN1_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "1574x1270+25+30")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_A_Dmel_EM_mlPN1_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "1224x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "1600x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)


pdf("./3_Figures/Sup_Figure4/Sup_Figure3_A_Dmel_EM_mlPN1_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1),c(2))
grid.arrange(arrangeGrob(Frontal_R_all, Dorsal_R_all,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}









## Panel B ----

### madPN1 - v8_cl5 ----
#### madPN1 - Dsec Conf ----
# > see Sup_Figure2


#### madPN1 - Dmel Conf ----

# seems not to be the same cell type

# nl_Dmel_Conf_ALPNs_IS2_allH_madPN1.1 <- neuronlist(nl_ALPN_all_adPNs_lPNs$`VFB_00006533_VGlut-F-300628_NA`,
#                                                           nl_ALPN_all_adPNs_lPNs$`VFB_00005765_VGlut-F-500852_NA`,
#                                                           nl_ALPN_all_adPNs_lPNs$`VFB_00007038_VGlut-F-700500_NA`,
#                                                           nl_ALPN_all_adPNs_lPNs$`VFB_00005752_VGlut-F-700567_NA`,
#                                                           nl_ALPN_all_adPNs_lPNs$`VFB_00012207_VGlut-F-600366_NA`,
#                                                           nl_ALPN_all_adPNs_lPNs$`VFB_00016056_VGlut-F-500085_NA`
#                                                           )
# 
# 
# nl_Dmel_Conf_ALPNs_IS2_allR_madPN1.2 <- neuronlist(nl_ALPN_all_adPNs_lPNs$`VFB_00005730_VGlut-F-700558_NA`,
#                                                         nl_ALPN_all_adPNs_lPNs$`VFB_00012225_VGlut-F-600379_NA`,
#                                                         nl_ALPN_all_adPNs_lPNs$`VFB_00015215_VGlut-F-500183_NA`
#                                                         )
#                                                         
#                                                       
# nl_Dmel_Conf_ALPNs_IS2_allR_madPN1.3 <- neuronlist(nl_ALPN_all_adPNs_lPNs$`VFB_00008452_VGlut-F-400662_NA`,
#                                                         nl_ALPN_all_adPNs_lPNs$`VFB_00015758_VGlut-F-500031_NA`,
#                                                         nl_ALPN_all_adPNs_lPNs$`VFB_00011857_VGlut-F-600253_NA`,
#                                                         nl_ALPN_all_adPNs_lPNs$`VFB_00012266_VGlut-F-500471_NA`,
#                                                         nl_ALPN_all_adPNs_lPNs$`VFB_00012775_VGlut-F-400434_NA`
#                                                         )
# 
# 
# clear3d()
# plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_madPN1.1, lwd=lwd, soma=soma, col=colfunc_green)
# plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_madPN1.2, lwd=lwd, soma=soma, col=colfunc_cyan)
# plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_madPN1.3, lwd=lwd, soma=soma, col=colfunc_purple)


#### madPN 1 - Dmel EM ----
nl_Dmel_EM_FAFB_ALPNs_IS2_allR_madPN1 <- neuronlist(nl_ALPN_all_adPNs_lPNs$M_adPNm6_R__FlyEM_HB_788940872_,
                                                           nl_ALPN_all_adPNs_lPNs$M_adPNm4_R__FlyEM_HB_1887872301_,
                                                           nl_ALPN_all_adPNs_lPNs$M_adPNm4_R__FlyEM_HB_1888213190_,
                                                           nl_ALPN_all_adPNs_lPNs$M_adPNm5_R__FlyEM_HB_762982753_,
                                                           nl_ALPN_all_adPNs_lPNs$M_adPNm5_R__FlyEM_HB_1916528384_,
                                                           nl_ALPN_all_adPNs_lPNs$M_adPNm5_R__FlyEM_HB_2040344064_
)


nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_madPN1  <- neuronlist(nl_ALPN_all_adPNs_lPNs$Multiglomerular_mALT_adPN_R1__FAFB_57258_,
                                                             nl_ALPN_all_adPNs_lPNs$Multiglomerular_mALT_adPN_R2__FAFB_57270_,
                                                             nl_ALPN_all_adPNs_lPNs$Multiglomerular_mALT_adPN_R3__FAFB_80008_,
                                                             nl_ALPN_all_adPNs_lPNs$Multiglomerular_mALT_adPN_R4__FAFB_57278_,
                                                             nl_ALPN_all_adPNs_lPNs$Multiglomerular_mALT_adPN_R7__FAFB_49026_,
                                                             nl_ALPN_all_adPNs_lPNs$Multiglomerular_mALT_adPN_R5__FAFB_57254_,
                                                             nl_ALPN_all_adPNs_lPNs$Multiglomerular_mALT_adPN_R6__FAFB_57266_
)


loc_Dmel_EM_FAFB_ALPNs_IS2_allR_madPN1 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_madPN1/")
nl_Dmel_EM_FAFB_ALPNs_IS2_allR_madPN1 <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_allR_madPN1, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_madPN1 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_madPN1/")
nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_madPN1 <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_madPN1, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_madPN1 <- c(nl_Dmel_EM_FAFB_ALPNs_IS2_allR_madPN1, nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_madPN1)



nl_Dmel_EM_FAFB_ALPNs_IS2_madPN1_example <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_madPN1[6])

# nl_Dmel_EM_FAFB_ALPNs_IS2_madPN_example_RH <- neuronlist(nl_Dmel_EM_FAFB_ALPNs_IS2_allR_madPN[3])
# nl_Dmel_EM_FlyEM_ALPNs_IS2_madPN_example_RH <- neuronlist(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_madPN[5])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_madPN1, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_allR_madPN, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_madPN, lwd=lwd, soma=soma, col=colfunc_blue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_B_Dmel_EM_madPN1_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_madPN1, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_allR_madPN, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_madPN, lwd=lwd, soma=soma, col=colfunc_blue)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_B_Dmel_EM_madPN1_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_madPN1_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_madPN_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_madPN_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl2)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_B_Dmel_EM_madPN1_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_madPN1_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_madPN_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_madPN_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl2)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_B_Dmel_EM_madPN1_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_B_Dmel_EM_madPN1_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_B_Dmel_EM_madPN1_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_B_Dmel_EM_madPN1_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_B_Dmel_EM_madPN1_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)


pdf("./3_Figures/Sup_Figure4/Sup_Figure3_B_Dmel_EM_madPN1_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}





## Panel C ----
### VM7d - v8_cl9 ----
#### VM7d - Dsec Conf ----
# > see Sup_Figure2


#### VM7d - Dmel Conf ----
# Does not exist


#### VM7d - Dmel EM ----

loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VM7d/")
nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d <- read.neurons(loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VM7d/")
nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d <- read.neurons(loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_VM7d <- c(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d,nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d)

nl_Dmel_EM_ALPNs_IS2_VM7d_example <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_VM7d[1])

# nl_Dmel_EM_FAFB_ALPNs_IS2_VM7d_example_RH <- neuronlist(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d[1])
# nl_Dmel_EM_FlyEM_ALPNs_IS2_VM7d_example_RH <- neuronlist(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d[1])


# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM7d, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d, lwd=lwd, soma=soma, col=colfunc_blue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VM7d_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM7d, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d, lwd=lwd, soma=soma, col=colfunc_blue)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VM7d_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_VM7d_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_VM7d_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_VM7d_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl2)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VM7d_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_VM7d_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_VM7d_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_VM7d_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl2)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VM7d_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VM7d_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VM7d_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VM7d_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VM7d_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VM7d_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}





### VA2 - v8_cl12,13 ----
#### VA2 - Dsec Conf ----
# > see Sup_Figure2


#### VA2 - Dmel Conf ----
# Does not exist


#### VA2 - Dmel EM ----
loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VA2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VA2/")
nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VA2 <- read.neurons(loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VA2, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VA2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VA2/")
nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VA2 <- read.neurons(loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VA2, pattern = "*.swc", neuronnames = NULL)


nl_Dmel_EM_ALPNs_IS2_allR_VA2 <- c(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VA2,nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VA2)

nl_Dmel_EM_ALPNs_IS2_allR_VA2_example <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_VA2[1])

# nl_Dmel_EM_FAFB_ALPNs_IS2_VA2_example_RH <- neuronlist(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VA2[1])
# nl_Dmel_EM_FlyEM_ALPNs_IS2_VA2_example_RH <- neuronlist(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VA2[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VA2, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VA2, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VA2, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VA2_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VA2, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VA2, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VA2, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VA2_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VA2_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_VA2_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_VA2_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl2)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VA2_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VA2_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_VA2_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_VA2_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl2)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VA2_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VA2_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VA2_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VA2_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VA2_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)


pdf("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VA2_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}





### VC3l - v8_cl6,7 ----
#### VC3l - Dsec Conf ----
# > see Sup_Figure2


#### VC3l - Dmel Conf ----
loc_Dmel_Conf_other_ALPNs_IS2_allR_VC3l <- file.path("./1_Data/6_Dataset_other/01.5.1_Dmel_ALPN_Conf_VFB_FBbt_00067123_annotated_RH_IS2_n288_VC3l/")
nl_Dmel_Conf_other_ALPNs_IS2_allR_VC3l <- read.neurons(loc_Dmel_Conf_other_ALPNs_IS2_allR_VC3l, pattern = "*.swc", neuronnames = NULL)
# Reroot LM soma if necessary
# nlscan(nl_Dmel_Conf_other_ALPNs_IS2_allR_VC3l, soma=soma)

nl_Dmel_Conf_other_ALPNs_IS2_VC3l_example <- neuronlist(nl_Dmel_Conf_other_ALPNs_IS2_allR_VC3l[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_VC3l, lwd=lwd, soma=soma, col=colfunc_lightblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_VC3l_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_VC3l, lwd=lwd, soma=soma, col=colfunc_lightblue)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_VC3l_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_VC3l_example, lwd=lwd, soma=soma, col=col_neuron_explLM)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_VC3l_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_VC3l_example, lwd=lwd, soma=soma, col=col_neuron_explLM)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_VC3l_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_VC3l_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_VC3l_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_VC3l_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_VC3l_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)


pdf("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_VC3l_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}




#### VC3l - Dmel EM ----

loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VC3l <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VC3l/")
nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VC3l <- read.neurons(loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VC3l, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VC3l <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VC3l/")
nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VC3l <- read.neurons(loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VC3l, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_VC3l <- c(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VC3l,nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VC3l)
# Reroot LM soma if necessary
# nlscan(nl_Dmel_EM_ALPNs_IS2_allR_VC3l, soma=soma)

nl_Dmel_EM_ALPNs_IS2_allR_VC3l_example <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_VC3l[1])

# nl_Dmel_EM_FAFB_ALPNs_IS2_VC3m_example <- neuronlist(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VC3m[1])
# nl_Dmel_EM_FlyEM_ALPNs_IS2_VC3m_example <- neuronlist(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VC3m[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VC3l, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VC3m, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VC3m, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VC3l_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VC3l, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VC3l, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VC3l, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VC3l_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VC3l_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_VC3l_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
#plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_DC1_example_RH, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VC3l_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VC3l_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_VC3l_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
#plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_DC1_example_RH, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VC3l_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VC3l_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VC3l_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VC3l_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VC3l_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_VC3l_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}







### DL2d - v8_cl15 ----
#### DL2d - Dsec Conf----
# see Sup_Figure2


#### DL2d - Dmel Conf ----
# n = 8
loc_Dmel_Conf_other_ALPNs_IS2_allR_DL2d <- file.path("./1_Data/6_Dataset_other/01.5.1_Dmel_ALPN_Conf_VFB_FBbt_00067123_annotated_RH_IS2_n288_DL2d/")
nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2d <- read.neurons(loc_Dmel_Conf_other_ALPNs_IS2_allR_DL2d, pattern = "*.swc", neuronnames = NULL)
# Reroot LM soma if necessary
#nlscan(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2v, soma=soma)

nl_Dmel_Conf_other_ALPNs_IS2_DL2d_example <- neuronlist(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2v[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
#plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2d, lwd=lwd, soma=soma, col=colfunc_lightblue)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2d[1:8], lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DL2d_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
#plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2d, lwd=lwd, soma=soma, col=colfunc_lightblue)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2d[1:8], lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DL2d_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_DL2d_example, lwd=lwd, soma=soma, col=col_neuron_explLM)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DL2d_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_DL2v_example, lwd=lwd, soma=soma, col=col_neuron_explLM)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DL2d_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DL2d_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DL2d_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DL2d_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DL2d_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)


pdf("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DL2d_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}


#### DL2d - Dmel EM ----
loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_DL2d/")
nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2d <- read.neurons(loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2d, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_DL2d/")
nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2d <- read.neurons(loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2d, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_DL2d <- c(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2d,nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2d)
# Reroot LM soma if necessary
# nlscan(nl_Dmel_EM_ALPNs_IS2_allR_DL2v, soma=soma)
# also removed a missguided neuron connection anterior of the AL.

nl_Dmel_EM_ALPNs_IS2_allR_DL2d_example <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_DL2d[1])
# nl_Dmel_EM_FAFB_ALPNs_IS2_DL2d_examplwe <- neuronlist(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2v[1])
# nl_Dmel_EM_FlyEM_ALPNs_IS2_DL2d_example <- neuronlist(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2v[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DL2d, lwd=lwd, soma=soma, col=colfunc_darkblue)
#plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2v, lwd=lwd, soma=soma, col=colfunc_red)
#plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2v, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DL2d_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DL2d, lwd=lwd, soma=soma, col=colfunc_darkblue)
#plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2v, lwd=lwd, soma=soma, col=colfunc_red)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DL2d_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DL2d_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
#plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_DL2v_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
#plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_DC1_example_RH, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DL2d_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DL2d_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_DL2v_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
#plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_DC1_example_RH, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DL2d_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DL2d_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DL2d_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DL2d_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DL2d_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)


pdf("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DL2d_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}







### DA1 - v8_cl17 ----
#### DA1 - Dsec Conf ---- 
# > see Sup_Figure2


#### DA1 - Dmel Conf ---- 
loc_Dmel_Conf_other_ALPNs_IS2_allR_DA1 <- file.path("./1_Data/6_Dataset_other/01.5.1_Dmel_ALPN_Conf_VFB_FBbt_00067123_annotated_RH_IS2_n288_DA1/")
nl_Dmel_Conf_other_ALPNs_IS2_allR_DA1 <- read.neurons(loc_Dmel_Conf_other_ALPNs_IS2_allR_DA1, pattern = "*.swc", neuronnames = NULL)

#nl_Dmel_Conf_other_ALPNs_IS2_DA1_example_RH <- neuronlist(nl_Dmel_Conf_other_ALPNs_IS2_allR_VM5d[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_DA1, lwd=lwd, soma=soma, col=col_neuron_clust)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DA1_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_DA1, lwd=lwd, soma=soma, col=colfunc_red)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DA1_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
#plot3d(nl_Dmel_Conf_other_ALPNs_IS2_VM5d_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0,  zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DA1_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
#plot3d(nl_Dmel_Conf_other_ALPNs_IS2_VM5d_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl)ll
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DA1_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DA1_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DA1_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DA1_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DA1_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)


pdf("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_Conf_DA1_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}


#### DA1 - Dmel EM ---- 
loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DA1 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_DA1/")
nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DA1 <- read.neurons(loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DA1, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DA1 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_DA1/")
nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DA1 <- read.neurons(loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DA1, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_DA1 <- c(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DA1,nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DA1)
# Reroot LM soma if necessary
#nlscan(nl_Dmel_EM_ALPNs_IS2_allR_DA1, soma=soma)

nl_Dmel_EM_ALPNs_IS2_allR_DA1_example_RH <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_DA1[1])
#nl_Dmel_EM_FlyEM_ALPNs_IS2_DA1_example_RH <- neuronlist(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DA1[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DA1, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DA1, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DA1, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DA1_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DA1, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DA1, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DA1, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DA1_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DA1_example_RH, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_DA1_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_DA1_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl2)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DA1_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DA1_example_RH, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_DA1_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_DA1_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl2)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DA1_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DA1_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DA1_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DA1_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DA1_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)


pdf("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DA1_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}





### VL2a - v8_cl18 ----
#### VL2a - Dsec Conf ----
# > see Sup_Figure2


#### VL2a - Dmel Conf ----
# Does not exist


#### VL2a - Dmel EM ----
loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VL2a <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VL2a/")
nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VL2a <- read.neurons(loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VL2a, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VL2a <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VL2a/")
nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VL2a <- read.neurons(loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VL2a, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_VL2a <- c(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VL2a,nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VL2a)

nl_Dmel_EM_ALPNs_IS2_VL2a_example <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_VL2a[1])


# nl_Dmel_EM_FAFB_ALPNs_IS2_VL2a_example_RH <- neuronlist(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VL2a[1])
# nl_Dmel_EM_FlyEM_ALPNs_IS2_VL2a_example_RH <- neuronlist(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VL2a[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VL2a, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VL2a, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VL2a, lwd=lwd, soma=soma, col=colfunc_blue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Dmel_EM_VL2a_frontal_all_v1.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VL2a, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VL2a, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VL2a, lwd=lwd, soma=soma, col=colfunc_blue)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Dmel_EM_VL2a_dorsal_all_v1.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_VL2a_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_VL2a_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_VL2a_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl2)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Dmel_EM_VL2a_frontal_example_v1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_VL2a_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_VL2a_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_VL2a_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl2)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Dmel_EM_VL2a_dorsal_example_v1.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Dmel_EM_VL2a_frontal_all_v1.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Sup_Figure4/Dmel_EM_VL2a_frontal_example_v1.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Dmel_EM_VL2a_dorsal_all_v1.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Sup_Figure4/Dmel_EM_VL2a_dorsal_example_v1.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)



pdf("./3_Figures/Sup_Figure4/Dmel_EM_VL2a_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}









### DC1 - v8_cl19,21 ----
#### DC1 - Dsec Conf ----
# see Sub_Figure2


#### DC1 - Dmel Conf ----
# Does not exist


#### DC1 - Dmel EM ---- 
loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DC1 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_DC1/")
nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DC1 <- read.neurons(loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DC1, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DC1 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_DC1/")
nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DC1 <- read.neurons(loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DC1, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_DA1 <- c(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DC1,nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DC1)
# Reroot LM soma if necessary
# nlscan(nl_Dmel_EM_ALPNs_IS2_allR_DA1, soma=soma)

nl_Dmel_EM_ALPNs_IS2_allR_DA1_example_RH <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_DA1[1])
#nl_Dmel_EM_FlyEM_ALPNs_IS2_DA1_example_RH <- neuronlist(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DA1[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DA1, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DC1, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DC1, lwd=lwd, soma=soma, col=colfunc_blue)
# plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DC1_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DA1, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DC1, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DC1, lwd=lwd, soma=soma, col=colfunc_blue)
# plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DC1_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DA1_example_RH, lwd=lwd, soma=soma, col=col_neuron_explEM)
#plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_DC1_example_RH, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DC1_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DA1_example_RH, lwd=lwd, soma=soma, col=col_neuron_explEM)
#plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_DC1_example_RH, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DC1_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DC1_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DC1_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DC1_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DC1_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)


pdf("./3_Figures/Sup_Figure4/Sup_Figure3_C_Dmel_EM_DC1_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}


