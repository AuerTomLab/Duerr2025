#--------------------------------------------#
# Figure 4  ----
# Morphological Comparison to Dmel a Dataset
#--------------------------------------------#


## Front Matter ----
### Load Packages & Resources ----
source("2_Code/0_Project_Initialization.R")


#------------------------------  Description  ---------------------------------#
# 
# 
# 
#------------------------------------------------------------------------------#



## Panel A - DL2v - Comparison Dsec vs Dmel ----
### Dsec - LM ----
nl_Dsec_ALPNs_DsecI_DL2v <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_88_adPN_up_DL2v,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_90_adPN_u_DL2v,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_60_adPN_up_DL2v,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_63_adPN_up_DL2v,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_78_adPN_up_DL2v,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_33_adPN_up_DL2v,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_68_adPN_up_DL2v
)

nl_Dsec_ALPN_DsecI_DL2v_example <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_90_adPN_u_DL2v)

# All Cluster ALPNS
open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPNs_DsecI_DL2v, lwd=lwd, soma=soma, col=col_neuron_clust)
plot3d(glom_Dsec_AL_L_DsecI_lowres, materials = "L_DL2v", color =col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dsec_Cl15_DL2v_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPNs_DsecI_DL2v, lwd=lwd, soma=soma, col=colfunc_red)
plot3d(glom_Dsec_AL_L_DsecI_lowres, materials = "L_DL2v", color =col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = zoom_dorsal)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dsec_Cl15_DL2v_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Cluster example
open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPN_DsecI_DL2v_example, lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(glom_Dsec_AL_L_DsecI_lowres, materials = "L_DL2v", color =col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dsec_Cl15_DL2v_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPN_DsecI_DL2v_example, lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(glom_Dsec_AL_L_DsecI_lowres, materials = "L_DL2v", color =col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = zoom_dorsal)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dsec_Cl15_DL2v_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure4/Figure4_A_Dsec_Cl15_DL2v_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "812x1300+0+0")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure4/Figure4_A_Dsec_Cl15_DL2v_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "812x1300+0+0")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure4/Figure4_A_Dsec_Cl15_DL2v_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "812x690+0+0")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure4/Figure4_A_Dsec_Cl15_DL2v_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "812x690+0+0")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Figure4/Figure4_A_Dsec_Cl15_DL2v_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}





### DL2v - Dmel Conf ----
# n = 8
loc_Dmel_Conf_other_ALPNs_IS2_allR_DL2v <- file.path("./1_Data/6_Dataset_other/01.5.1_Dmel_ALPN_Conf_VFB_FBbt_00067123_annotated_RH_IS2_n288_DL2v/")
nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2v <- read.neurons(loc_Dmel_Conf_other_ALPNs_IS2_allR_DL2v, pattern = "*.swc", neuronnames = NULL)
# Reroot LM soma if necessary
#nlscan(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2v, soma=soma)

nl_Dmel_Conf_other_ALPNs_IS2_DL2v_example <- neuronlist(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2v[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
#plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2v, lwd=lwd, soma=soma, col=colfunc_lightblue)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2v[1:8], lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dmel_Conf_DL2v_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
#plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2v, lwd=lwd, soma=soma, col=colfunc_lightblue)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_DL2v[1:8], lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dmel_Conf_DL2v_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_DL2v_example, lwd=lwd, soma=soma, col=col_neuron_explLM)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dmel_Conf_DL2v_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_DL2v_example, lwd=lwd, soma=soma, col=col_neuron_explLM)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dmel_Conf_DL2v_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure4/Figure4_A_Dmel_Conf_DL2v_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure4/Figure4_A_Dmel_Conf_DL2v_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure4/Figure4_A_Dmel_Conf_DL2v_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure4/Figure4_A_Dmel_Conf_DL2v_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)


pdf("./3_Figures/Figure4/Figure4_A_Dmel_Conf_DL2v_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}


### DL2v - Dmel EM ----
loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2v <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_DL2v/")
nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2v <- read.neurons(loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2v, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2v <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_DL2v/")
nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2v <- read.neurons(loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2v, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_DL2v <- c(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2v,nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2v)
# Reroot LM soma if necessary
# nlscan(nl_Dmel_EM_ALPNs_IS2_allR_DL2v, soma=soma)

nl_Dmel_EM_ALPNs_IS2_allR_DL2v_example <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_DL2v[1])
# nl_Dmel_EM_FAFB_ALPNs_IS2_DL2v_example_RH <- neuronlist(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2v[1])
# nl_Dmel_EM_FlyEM_ALPNs_IS2_DA1_example_RH <- neuronlist(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2v[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DL2v, lwd=lwd, soma=soma, col=colfunc_darkblue)
#plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2v, lwd=lwd, soma=soma, col=colfunc_red)
#plot3d(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DL2v, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dmel_EM_DL2v_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DL2v, lwd=lwd, soma=soma, col=colfunc_darkblue)
#plot3d(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DL2v, lwd=lwd, soma=soma, col=colfunc_red)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dmel_EM_DL2v_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DL2v_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
#plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_DL2v_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
#plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_DC1_example_RH, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dmel_EM_DL2v_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DL2v_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_DL2v_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl1)
#plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_DC1_example_RH, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_A_Dmel_EM_DL2v_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure4/Figure4_A_Dmel_EM_DL2v_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure4/Figure4_A_Dmel_EM_DL2v_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure4/Figure4_A_Dmel_EM_DL2v_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure4/Figure4_A_Dmel_EM_DL2v_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)


pdf("./3_Figures/Figure4/Figure4_A_Dmel_EM_DL2v_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}








## Panel B - DL2v - NBLAST ----
## NBLAST - Pruned3 -    no glomerulus,   no soma,    no tract,   with MB,  with LH
# paste transformed neurons into the folder ./1_Data/6_Dataset_other/11_Dmel_Dsec_DL2v_pruned3
nl_DL2v_Dsec_Dmel_IS2_p3 <- read.neurons("./1_Data/6_Dataset_other/11_Dmel_Dsec_IS2_DL2v_pruned3")
plot3d(nl_DL2v_Dsec_Dmel_IS2_p3, col=colfunc_red)

#### Analysis ----
dots_DL2v_Dsec_Dmel_IS2_p3 <- dotprops(nl_DL2v_Dsec_Dmel_IS2_p3, OmitFailures = NA)
scores_DL2v_Dsec_Dmel_IS2_p3 <- nblast_allbyall(dots_DL2v_Dsec_Dmel_IS2_p3)
hc_DL2v_Dsec_Dmel_IS2_p3 <- nhclust(scoremat=scores_DL2v_Dsec_Dmel_IS2_p3)
h = 0.75
color_DL2v_Dsec_Dmel_IS2_p3 <- colour_clusters(hc_DL2v_Dsec_Dmel_IS2_p3, h=h, groupLabels=F)

#### Dendrogram ----
pdf("./3_Figures/Figure4/Figure4_B_NBLAST_DL2v_Dsec_Dmel_IS2_pruned3_v1.pdf", 
    width=22, height=10)
# PDF export: x= 0,2 inch per entry; y= 15inch
par(mar = c(15,3,5,1))
par(mgp = c(1.5, 0.5, 0))
plot(color_DL2v_Dsec_Dmel_IS2_p3,
     main = "DL2v_Dsec_Dmel_IS2",
     ylab = "NBLAST Score")
abline(h=h, lty=2, col="grey")
rect <- rect.hclust(hc_DL2v_Dsec_Dmel_IS2_p3, h=h, border = "grey")
beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
y_clus <- weighted.mean(rev(hc_DL2v_Dsec_Dmel_IS2_p3$height)+0.1)
text(x=beg_clus, y=y_clus, col="black", font=2)
dev.off()













## Panel C - DM2 - Comparison Dsec vs Dmel ----
### Dsec - LM ----
# >> see Sup Fig 2

### Dmel - EM [n=6] ----

loc_Dmel_EM_FlyEM_ALPNs_IS2_R_DM2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_DM2")
nl_Dmel_EM_FlyEM_ALPNs_IS2_R_DM2 <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_R_DM2, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FAFB_ALPNs_IS2_R_DM2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_DM2/")
nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2 <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_R_DM2, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_DM2 <- c(nl_Dmel_EM_FlyEM_ALPNs_IS2_R_DM2,nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2)

nl_Dmel_EM_ALPNs_IS2_allR_DM2_example <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_DM2[1])

# nl_Dmel_EM_FlyEM_ALPNs_IS2_RH_DM2_example_R <- neuronlist(nl_Dmel_EM_FlyEM_ALPNs_IS2_R_DM2[1])
# nl_Dmel_EM_FAFB_ALPNs_IS2_RH_DM2_example_R <- neuronlist(nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DM2, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_R_DM2, lwd=lwd, soma=soma, col=col_neuron_clust)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_R_IS2, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_C_Dmel_EM_DM2_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DM2, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_R_DM2, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_IS2, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_C_Dmel_EM_DM2_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DM2_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_R_DM2_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2_example_RH, lwd=lwd, soma=soma, col="skyblue3")
#plot3d(glom_Dsec_AL_RH_IS2, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_C_Dmel_EM_DM2_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DM2_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_R_DM2_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2_example_RH, lwd=lwd, soma=soma, col="skyblue3")
#plot3d(glom_Dsec_AL_RH_IS2, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_C_Dmel_EM_DM2_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure4/Figure4_C_Dmel_EM_DM2_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure4/Figure4_C_Dmel_EM_DM2_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure4/Figure4_C_Dmel_EM_DM2_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure4/Figure4_C_Dmel_EM_DM2_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)



pdf("./3_Figures/Figure4/Figure4_C_Dmel_EM_DM2_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}









## Panel D - VM5d - Comparison Dsec vs Dmel ----
### Overview ----
#### Dsec - LM ----
# >> See Figure2


#### Dmel - LM - others [n=20]----
# Rerooting
## The swc files of the LM traces did not have a value for "radius" so I had to change it to "1"
## This was necessary to show and change the neuron's somata in neutube.
loc_Dmel_Conf_other_ALPNs_IS2_allR_VM5d <- file.path("./1_Data/6_Dataset_other/01.5.1_Dmel_ALPN_Conf_VFB_FBbt_00067123_annotated_RH_IS2_n288_VM5d/")
nl_Dmel_Conf_other_ALPNs_IS2_allR_VM5d <- read.neurons(loc_Dmel_Conf_other_ALPNs_IS2_allR_VM5d, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_Conf_other_ALPNs_IS2_VM5d_example_RH <- neuronlist(nl_Dmel_Conf_other_ALPNs_IS2_allR_VM5d[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_VM5d, lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_D_Dmel_Conf_VM5d_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_allR_VM5d, lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_D_Dmel_Conf_VM5d_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_VM5d_example_RH, lwd=lwd, soma=soma, col=col_neuron_explLM)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_D_Dmel_Conf_VM5d_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_other_ALPNs_IS2_VM5d_example_RH, lwd=lwd, soma=soma, col=col_neuron_explLM)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_D_Dmel_Conf_VM5d_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure4/Figure4_D_Dmel_Conf_VM5d_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure4/Figure4_D_Dmel_Conf_VM5d_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure4/Figure4_D_Dmel_Conf_VM5d_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure4/Figure4_D_Dmel_Conf_VM5d_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Figure4/Figure4_D_Dmel_Conf_VM5d_v3.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}






#### Dmel - EM [n=13] ----
loc_Dmel_EM_FlyEM_ALPNs_IS2_R_VM5d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VM5d")
nl_Dmel_EM_FlyEM_ALPNs_IS2_R_VM5d <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_R_VM5d, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FAFB_ALPNs_IS2_RH_VM5d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VM5d/")
nl_Dmel_EM_FAFB_ALPNs_IS2_RH_VM5d <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_VM5d <- c(nl_Dmel_EM_FlyEM_ALPNs_IS2_R_VM5d,nl_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d)

nl_Dmel_EM_FlyEM_ALPNs_IS2_R_VM5d_example <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_VM5d[3])
# nl_Dmel_EM_FlyEM_ALPNs_IS2_R_VM5d_example_RH <- neuronlist(nl_Dmel_EM_FlyEM_ALPNs_IS2_R_VM5d[2])
# nl_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d_example_RH <- neuronlist(nl_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5d, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_R_VM5d, lwd=lwd, soma=soma, col=col_neuron_clust)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d, lwd=lwd, soma=soma, col=colfunc_blue)
#plot3d(glom_Dsec_AL_RH_IS2, materials = "RH_VM5d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_D_Dmel_EM_VM5d_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5d, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_RH_VM5d, lwd=lwd, soma=soma, col=col_neuron_expl)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_RH_VM5d, lwd=lwd, soma=soma, col="skyblue3")
#plot3d(glom_Dsec_AL_RH_IS2, materials = "RH_VM5d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_D_Dmel_EM_VM5d_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_RH_VM5d_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_RH_VM5d_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_RH_VM5d_example_RH, lwd=lwd, soma=soma, col="skyblue3")
#plot3d(glom_Dsec_AL_RH_IS2, materials = "RH_VM5d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_D_Dmel_EM_VM5d_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_RH_VM5d_example, lwd=lwd, soma=soma, col=col_neuron_explEM)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_RH_VM5d_example_RH, lwd=lwd, soma=soma, col=col_neuron_expl)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_RH_VM5d_example_RH, lwd=lwd, soma=soma, col="skyblue3")
#plot3d(glom_Dsec_AL_RH_IS2, materials = "RH_VM5d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_D_Dmel_EM_VM5d_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure4/Figure4_D_Dmel_EM_VM5d_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure4/Figure4_D_Dmel_EM_VM5d_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure4/Figure4_D_Dmel_EM_VM5d_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure4/Figure4_D_Dmel_EM_VM5d_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Figure4/Figure4_D_Dmel_EM_VM5d_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}




### Detail - Lateral Horn ----
#### Dsec - LM ----
nl_Dsec_ALPNs_DsecI_VM5d <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_6_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_114_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_1_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_97_adPN_u_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_24_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_86_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_113_adPN_up_VM5d
                                       )


nl_Dsec_ALPNs_IS2_VM5d <- xform_brain(nl_Dsec_ALPNs_DsecI_VM5d, sample = DsecI, reference = IS2)
loc_Dsec_VM5d_IS2 <- file.path("./1_Data/5_Dataset_our/06_Figure4_Dsec_VM5d_IS2/")
#write.neurons(nl_Dsec_ALPNs_IS2_VM5d, dir = loc_Dsec_VM5d_IS2, format="swc")


#### Dmel - EM ----
loc_Dmel_EM_FlyEM_ALPNs_IS2_RH_VM5d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VM5d")
nl_Dmel_EM_FlyEM_ALPNs_IS2_RH_VM5d <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_RH_VM5d, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FAFB_ALPNs_IS2_RH_VM5d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VM5d/")
nl_Dmel_EM_FAFB_ALPNs_IS2_RH_VM5d <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_RH_VM5d, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_VM5d <- c(nl_Dmel_EM_FlyEM_ALPNs_IS2_RH_VM5d,nl_Dmel_EM_FAFB_ALPNs_IS2_RH_VM5d)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d[1], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5d[1], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_D_Dsec_Dmel_VM5d_LH_Example1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d[3], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5d[2], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_D_Dsec_Dmel_VM5d_LH_Example2.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d[7], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5d[3], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_D_Dsec_Dmel_VM5d_LH_Example3.png", fmt="png", height = height_frontal, width = width_frontal)

# Generate Sub-Panel
Frontal_L_Example1 <- image_read("./3_Figures/Figure4/Figure4_D_Dsec_Dmel_VM5d_LH_Example1.png")
Frontal_L_Example1 <- image_crop(Frontal_L_Example1, "550x300+60+150")
Frontal_L_Example1 <- image_flop(Frontal_L_Example1)
Frontal_L_Example1 <- rasterGrob(Frontal_L_Example1)

Frontal_L_Example2 <- image_read("./3_Figures/Figure4/Figure4_D_Dsec_Dmel_VM5d_LH_Example2.png")
Frontal_L_Example2 <- image_crop(Frontal_L_Example2, "550x300+60+150")
Frontal_L_Example2 <- image_flop(Frontal_L_Example2)
Frontal_L_Example2 <- rasterGrob(Frontal_L_Example2)

Frontal_L_Example3 <- image_read("./3_Figures/Figure4/Figure4_D_Dsec_Dmel_VM5d_LH_Example3.png")
Frontal_L_Example3 <- image_crop(Frontal_L_Example3, "550x300+60+150")
Frontal_L_Example3 <- image_flop(Frontal_L_Example3)
Frontal_L_Example3 <- rasterGrob(Frontal_L_Example3)

pdf("./3_Figures/Figure4/Figure4_D_Dsec_Dmel_VM5d_LH_AllExamples_v1.pdf", width = 1, height = 1.7)
layout <- rbind(c(1),c(2),c(3))
grid.arrange(arrangeGrob(Frontal_L_Example1, Frontal_L_Example2, Frontal_L_Example3,
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}


while (rgl.cur() > 0) {close()}


### NBLAST ----
nl_VM5d_Dsec_DsecI <- read.neurons("./1_Data/5_Dataset_our_v2/7_VM5d_DsecI")
nl_VM5d_Dsec_IS2 <- xform_brain(nl_VM5d_Dsec_DsecI, sample = DsecI, reference = IS2)
#write.neurons(nl_VM5d_Dsec_IS2, dir = "./1_Data/5_Dataset_our_v2/7_VM5d_IS2", format="swc")
nl_VM5d_Dsec_Dmel_IS2 <- read.neurons("./1_Data/6_Dataset_other/08_Dmel_Dsec_VM5d")
#plot3d(nl_VM5d_Dsec_Dmel_IS2)

#### Analysis ----
dots_VM5d_Dsec_Dmel_IS2 <- dotprops(nl_VM5d_Dsec_Dmel_IS2, OmitFailures = NA)
scores_VM5d_Dsec_Dmel_IS2 <- nblast_allbyall(dots_VM5d_Dsec_Dmel_IS2)
hc_VM5d_Dsec_Dmel_IS2 <- nhclust(scoremat=scores_VM5d_Dsec_Dmel_IS2)
h = 0.75
color_VM5d_Dsec_Dmel_IS2 <- colour_clusters(hc_VM5d_Dsec_Dmel_IS2, h=h, groupLabels=F)

#### Dendrogram ----
pdf(".//3_Figures/Figure4/Figure4_D_NBLAST_VM5d_Dsec_Dmel_IS2_v1.pdf", 
    width=22, height=10)
# PDF export: x= 0,2 inch per entry; y= 15inch
par(mar = c(15,3,5,1))
par(mgp = c(1.5, 0.5, 0))
plot(color_VM5d_Dsec_Dmel_IS2,
     main = "Dsec_Dmel_VM5d_IS2",
     ylab = "NBLAST Score")
abline(h=h, lty=2, col="grey")
rect <- rect.hclust(hc_VM5d_Dsec_Dmel_IS2, h=h, border = "grey")
beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
y_clus <- weighted.mean(rev(hc_VM5d_Dsec_Dmel_IS2$height)+0.1)
text(x=beg_clus, y=y_clus, col="black", font=2)
dev.off()









## Panel E - VM5d & DM2 branching comparison in Dsec & Dmel [In Progress] ----
### Dsec - LM ----
# 2x DM2
nl_Dsec_ALPNs_DsecI_DM2_x2 <- neuronlist(#nl_Dsec_ALPNs_DsecI_allR$Dsec_109_lPN_u_DM2,
                                      nl_Dsec_ALPNs_DsecI_allR$Dsec_115_lPN_u_DM2,
                                      nl_Dsec_ALPNs_DsecI_allR$Dsec_126_lPN_u_DM2
                                      )

# 4x VM5ds
nl_Dsec_ALPNs_DsecI_VM5d_x4 <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_6_adPN_up_VM5d,
                                       #nl_Dsec_ALPNs_DsecI_allR$Dsec_114_adPN_up_VM5d,
                                       #nl_Dsec_ALPNs_DsecI_allR$Dsec_1_adPN_up_VM5d,
                                       #nl_Dsec_ALPNs_DsecI_allR$Dsec_97_adPN_u_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_24_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_86_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_113_adPN_up_VM5d)


open3d()
plot3d(DsecI_surf, alpha = 0.03, color ="grey")
#plot3d(br_SCL_DsecI, col = "lightblue1", alpha = 0.3)
#plot3d(br_SLP_DsecI, col = col_glom_2, alpha = 0.05)
#plot3d(tract_Dsec_AL_L_DsecI_lowres, material = "Superior_Latero-dorsal_Tract", col="blue", alpha= 0.3)
plot3d(nl_Dsec_ALPNs_DsecI_VM5d_x4, soma =soma, lwd=lwd, col = colfunc_red2)
plot3d(nl_Dsec_ALPNs_DsecI_DM2_x2, soma =soma, lwd=lwd, col = colfunc_yellow)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_E_Dsec_VM5d_DM2_frontal_all_v1.png", fmt="png", height = height_frontal, width = width_frontal)
while (rgl.cur() > 0) {close3d()}

open3d()
plot3d(DsecI_surf, alpha = 0.03, color ="grey")
#plot3d(br_SCL_DsecI, col = "lightskyblue3", alpha = 0.3)
#plot3d(br_SLP_DsecI, col = col_glom_2, alpha = 0.05)
#plot3d(tract_Dsec_AL_L_DsecI_lowres, material = "Superior_Latero-dorsal_Tract", col="blue", alpha= 0.3)
plot3d(nl_Dsec_ALPNs_DsecI_VM5d_x4, soma =soma, lwd=lwd, col = colfunc_red2)
plot3d(nl_Dsec_ALPNs_DsecI_DM2_x2, soma =soma, lwd=lwd, col = colfunc_yellow)
nview3d("dorsal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_E_Dsec_VM5d_DM2_dorsal_v1.png", fmt="png", height = height_frontal, width = width_frontal)
while (rgl.cur() > 0) {close3d()}



### Dmel - FAFB ----
#IS2 has to be transformed
# 2x DM2
loc_Dmel_EM_FAFB_ALPNs_IS2_R_DM2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_DM2/")
nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2 <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_R_DM2, pattern = "*.swc", neuronnames = NULL)

# 4x VM5d
loc_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VM5d/")
nl_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d, pattern = "*.swc", neuronnames = NULL)


open3d()
plot3d(IS2, alpha = 0.03, color ="grey")
#plot3d(br_SCL_DsecI, col = "lightblue1", alpha = 0.3)
#plot3d(br_SLP_DsecI, col = col_glom_2, alpha = 0.05)
#plot3d(tract_Dsec_AL_L_DsecI_lowres, material = "Superior_Latero-dorsal_Tract", col="blue", alpha= 0.3)
plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d[1:4], soma =soma, lwd=lwd, col = colfunc_darkblue)
plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2[1:2], soma =soma, lwd=lwd, col = colfunc_cyan)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_E_Dmel_VM5d_DM2_frontal_v1.png", fmt="png", height = height_frontal, width = width_frontal)
while (rgl.cur() > 0) {close3d()}

open3d()
plot3d(IS2, alpha = 0.03, color ="grey")
#plot3d(br_SCL_DsecI, col = "lightskyblue3", alpha = 0.3)
#plot3d(br_SLP_DsecI, col = col_glom_2, alpha = 0.05)
#plot3d(tract_Dsec_AL_L_DsecI_lowres, material = "Superior_Latero-dorsal_Tract", col="blue", alpha= 0.3)
plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_R_VM5d[1:4], soma =soma, lwd=lwd, col = colfunc_darkblue)
plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_R_DM2[1:2], soma =soma, lwd=lwd, col = colfunc_cyan)
nview3d("dorsal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_E_Dmel_VM5d_DM2_dorsal_v1.png", fmt="png", height = height_frontal, width = width_frontal)
while (rgl.cur() > 0) {close3d()}









## Panel F - VM5d-like branching----

### All Cluster ALPNS ----

#### Dsec - LM ----

# plot3d(nl_Dsec_ALPNs_DsecI_allR$Dsec_64_adPN_up_DM6, lwd=6, soma=3, col="orange1")    # DM6                                        # VM5d-like extra branch
# plot3d(nl_Dsec_ALPNs_DsecI_allR$Dsec_62_adPN_up_DM6, lwd=6, soma=3, col="orange3")    # DM6  # VM7v #>DM2                          # VM5d-like extra branch
# plot3d(nl_Dsec_ALPNs_DsecI_allR$Dsec_12_adPN_up_DM6, lwd=6, soma=3, col="orange4")    # DM6  # VM7v #>VM2                          # VM5d-like extra branch
# plot3d(nl_Dsec_ALPNs_DsecI_allR$Dsec_40_adPN_up_VM7d, lwd=6, soma=3, col="red1")      # VM7d                                       # small VM5d-like extra branch
# plot3d(nl_Dsec_ALPNs_DsecI_allR$Dsec_66_adPN_up_VM7d, lwd=6, soma=3, col="red2")      # VM7d                                       # small VM5d-like extra branch
# plot3d(nl_Dsec_ALPNs_DsecI_allR$Dsec_57_adPN_up_VM7d, lwd=6, soma=3, col="red3")      # VM7d                                       # small VM5d-like extra branch # dorsal branch
# plot3d(nl_Dsec_ALPNs_DsecI_allR$Dsec_49_adPN_up_VM7v, lwd=6, soma=3, col="lightblue") # VM7v #>VC4 #>VC1 #>VM5d                    # VM5d-like extra branch
# plot3d(nl_Dsec_ALPNs_DsecI_allR$Dsec_59_adPN_up_VM7v, lwd=6, soma=3, col="purple")    # VM7v # VM2                                 # small VM5d-like extra branch
# plot3d(nl_Dsec_ALPNs_DsecI_allR$Dsec_13_adPN_up_VM3, lwd=6, soma=3, col="orange")     # VM3  # VC4 #VC1 #>VC3l #>VM7d #>VC3l #>VM2 # VM5d-like extra branch
# plot3d(nl_Dsec_ALPNs_DsecI_allR$Dsec_25_adPN_up_VM3, lwd=6, soma=3, col="red")        # VM3  # VC4 #VC1 #DM6 #>VC3l #>VM2
# plot3d(nl_Dsec_ALPNs_DsecI_allR$Dsec_120_adPN_up_VM2, lwd=6, soma=3, col="cyan")      # VM2  # VM3 #VC4 #>VM7v #>VC1               # VM5d-like extra branch


nl_Dsec_ALPNs_DsecI_VM5d_like <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_64_adPN_up_DM6,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_62_adPN_up_DM6,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_12_adPN_up_DM6,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_40_adPN_up_VM7d,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_66_adPN_up_VM7d,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_57_adPN_up_VM7d,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_49_adPN_up_VM7v,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_59_adPN_up_VM7v,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_13_adPN_up_VM3,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_25_adPN_up_VM3,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_120_adPN_up_VM2
                                            )

clear3d()
nl_Dsec_ALPNs_IS2_VM5d_like <- xform_brain(nl_Dsec_ALPNs_DsecI_VM5d_like, reference = "IS2", sample = "DsecI")

nl_Dsec_ALPNs_DsecI_VM5d_like_example <- neuronlist(nl_Dsec_ALPNs_DsecI_VM5d_like[1])


open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPNs_DsecI_VM5d_like, lwd=lwd, soma=soma, col=colfunc_red)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DC1", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_DM6-VM7v,d-VM3_VM5d_like_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPNs_DsecI_VM5d_like, lwd=lwd, soma=soma, col=colfunc_red)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DC1", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = zoom_dorsal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_DM6-VM7v,d-VM3_VM5d_like_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Cluster example
open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPNs_DsecI_VM5d_like_example, lwd=lwd, soma=soma, col=col_neuron_expl1)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DC1", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_DM6-VM7v,d-VM3_VM5d_like_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPNs_DsecI_VM5d_like_example, lwd=lwd, soma=soma, col=col_neuron_expl1)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DC1", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = zoom_dorsal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_DM6-VM7v,d-VM3_VM5d_like_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_DM6-VM7v,d-VM3_VM5d_like_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "812x1300+0+0")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_DM6-VM7v,d-VM3_VM5d_like_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "812x1300+0+0")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_DM6-VM7v,d-VM3_VM5d_like_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "812x690+0+0")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_DM6-VM7v,d-VM3_VM5d_like_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "812x690+0+0")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Figure4/Figure4_F_Dsec_DM6-VM7v,d-VM3_VM5d_like_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}





#### Dmel - LM ----

loc_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_DM6 <- file.path("./1_Data/6_Dataset_other/01.5.1_Dmel_ALPN_conf_VFB_FBbt_00067123_annotated_RH_IS2_n288_DM6/")
# loc_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VM3 <- file.path("./1_Data/6_Dataset_other//") # does not exist
loc_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VC4 <- file.path("./1_Data/6_Dataset_other/01.5.1_Dmel_ALPN_conf_VFB_FBbt_00067123_annotated_RH_IS2_n288_VC4/")
#loc_Dmel_Conf_FAFB_ALPNs_IS2_allR_VM5dlike_VM7d <- file.path("./1_Data/6_Dataset_other//") # does not exist
#loc_Dmel_Conf_FAFB_ALPNs_IS2_allR_VM5dlike_VM7v <- file.path("./1_Data/6_Dataset_other//") # does not exist


nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_DM6 <- read.neurons(loc_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_DM6, pattern = "*.swc", neuronnames = NULL)
#nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VM3 <- read.neurons(loc_Dmel_ConfALPNs_IS2_allR_VM5dlike_VM3, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VC4 <- read.neurons(loc_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VC4, pattern = "*.swc", neuronnames = NULL)
#nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VM7d <- read.neurons(loc_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VM7d, pattern = "*.swc", neuronnames = NULL)
#nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VM7v <- read.neurons(loc_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VM7v, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike <- c(nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_DM6,
                                          nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_VC4
                                          )

#nlscan(nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike, soma=soma)
#corrected soma of wrongly rooted PNs

nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_example <- neuronlist(nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike[1])

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike, lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_frontal.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike, lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_dorsal.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_example, lwd=lwd, soma=soma, col=colfunc_darkblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_example, lwd=lwd, soma=soma, col=colfunc_darkblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure4/Figure4_F_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_frontal.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure4/Figure4_F_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure4/Figure4_F_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_dorsal.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure4/Figure4_F_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Figure4/Figure4_F_Dmel_Conf_ALPNs_IS2_allR_VM5dlike_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}





#### Dmel - EM ----
loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_DM6 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_DM6/")
loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VM2/")
loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM3 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VM3/")
loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VC4 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VC4/")
loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM7d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VM7d/")
loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM7v <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VM7v/")

loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_DM6 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_DM6/")
loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VM2/")
loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM3 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VM3/")
loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VC4 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VC4/")
loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM7d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VM7d/")
loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM7v <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VM7v/")

nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_DM6 <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_DM6, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM2 <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM2, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM3 <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM3, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VC4 <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VC4, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM7d <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM7d, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM7v <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM7v, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_DM6 <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_DM6, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM2 <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM2, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM3 <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM3, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VC4 <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VC4, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM7d <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM7d, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM7v <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM7v, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike <- c(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_DM6,
                                        nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM2,
                                        nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM3,
                                        nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VC4,
                                        nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM7d,
                                        nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM7v,
                                        nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_DM6,
                                        nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM2,
                                        nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM3,
                                        nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VC4,
                                        nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM7d,
                                        nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM7v
                                        )


#nlscan(nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike, soma=soma)
#corrected soma of wrongly rooted PNs

nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike_example <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike, lwd=lwd, soma=soma, col=colfunc_darkblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dmel_EM_ALPNs_IS2_allR_VM5dlike_frontal.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike, lwd=lwd, soma=soma, col=colfunc_darkblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dmel_EM_ALPNs_IS2_allR_VM5dlike_dorsal.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike_example, lwd=lwd, soma=soma, col=colfunc_darkblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dmel_EM_ALPNs_IS2_allR_VM5dlike_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike_example, lwd=lwd, soma=soma, col=colfunc_darkblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dmel_EM_ALPNs_IS2_allR_VM5dlike_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure4/Figure4_F_Dmel_EM_ALPNs_IS2_allR_VM5dlike_frontal.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure4/Figure4_F_Dmel_EM_ALPNs_IS2_allR_VM5dlike_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure4/Figure4_F_Dmel_EM_ALPNs_IS2_allR_VM5dlike_dorsal.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure4/Figure4_F_Dmel_EM_ALPNs_IS2_allR_VM5dlike_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Figure4/Figure4_F_Dmel_EM_ALPNs_IS2_allR_VM5dlike_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}










### VM7d  ----

#### Dsec - LM ----
nl_Dsec_ALPNs_DsecI_VM5d_like_VM7d <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_40_adPN_up_VM7d,
                                                 nl_Dsec_ALPNs_DsecI_allR$Dsec_66_adPN_up_VM7d,
                                                 nl_Dsec_ALPNs_DsecI_allR$Dsec_57_adPN_up_VM7d
                                                 )

nl_Dsec_ALPNs_IS2_VM5d_like_VM7d <- xform_brain(nl_Dsec_ALPNs_DsecI_VM5d_like_VM7d, sample = DsecI, reference = IS2)


#### Dmel - EM ----
loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VM7d/")
nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d <- read.neurons(loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VM7d/")
nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d <- read.neurons(loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_VM7d <- c(nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_VM7d,nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_VM7d)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d_like_VM7d[1], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM7d[1], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM7d_LH_Example1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d_like_VM7d[2], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM7d[2], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM7d_LH_Example2.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d_like_VM7d[3], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM7d[3], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM7d_LH_Example3.png", fmt="png", height = height_frontal, width = width_frontal)

# Generate Sub-Panel
Frontal_L_Example1 <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM7d_LH_Example1.png")
Frontal_L_Example1 <- image_crop(Frontal_L_Example1, "550x300+60+150")
Frontal_L_Example1 <- image_flop(Frontal_L_Example1)
Frontal_L_Example1 <- rasterGrob(Frontal_L_Example1)

Frontal_L_Example2 <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM7d_LH_Example2.png")
Frontal_L_Example2 <- image_crop(Frontal_L_Example2, "550x300+60+150")
Frontal_L_Example2 <- image_flop(Frontal_L_Example2)
Frontal_L_Example2 <- rasterGrob(Frontal_L_Example2)

Frontal_L_Example3 <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM7d_LH_Example3.png")
Frontal_L_Example3 <- image_crop(Frontal_L_Example3, "550x300+60+150")
Frontal_L_Example3 <- image_flop(Frontal_L_Example3)
Frontal_L_Example3 <- rasterGrob(Frontal_L_Example3)

pdf("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM7d_LH_AllExamples_v1.pdf", width = 1, height = 1.7)
layout <- rbind(c(1),c(2),c(3))
grid.arrange(arrangeGrob(Frontal_L_Example1, Frontal_L_Example2, Frontal_L_Example3,
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}










### DM6 ----

#### Dsec - LM ----
nl_Dsec_ALPNs_DsecI_VM5d_like_DM6_VM7v <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_64_adPN_up_DM6,
                                                     nl_Dsec_ALPNs_DsecI_allR$Dsec_62_adPN_up_DM6,
                                                     nl_Dsec_ALPNs_DsecI_allR$Dsec_12_adPN_up_DM6)

nl_Dsec_ALPNs_IS2_VM5d_like_DM6_VM7v <- xform_brain(nl_Dsec_ALPNs_DsecI_VM5d_like_DM6_VM7v, sample = DsecI, reference = IS2)


#### Dmel - EM ----
loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DM6 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_DM6/")
nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DM6 <- read.neurons(loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DM6, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DM6 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_DM6/")
nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DM6 <- read.neurons(loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DM6, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_DM6 <- c(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_DM6,nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_DM6)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d_like_DM6_VM7v[1], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DM6[1], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_DM6_LH_Example1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d_like_DM6_VM7v[2], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DM6[2], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_DM6_LH_Example2.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d_like_DM6_VM7v[3], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_DM6[3], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_DM6_LH_Example3.png", fmt="png", height = height_frontal, width = width_frontal)

# Generate Sub-Panel
Frontal_L_Example1 <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_DM6_LH_Example1.png")
Frontal_L_Example1 <- image_crop(Frontal_L_Example1, "550x300+60+150")
Frontal_L_Example1 <- image_flop(Frontal_L_Example1)
Frontal_L_Example1 <- rasterGrob(Frontal_L_Example1)

Frontal_L_Example2 <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_DM6_LH_Example2.png")
Frontal_L_Example2 <- image_crop(Frontal_L_Example2, "550x300+60+150")
Frontal_L_Example2 <- image_flop(Frontal_L_Example2)
Frontal_L_Example2 <- rasterGrob(Frontal_L_Example2)

Frontal_L_Example3 <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_DM6_LH_Example3.png")
Frontal_L_Example3 <- image_crop(Frontal_L_Example3, "550x300+60+150")
Frontal_L_Example3 <- image_flop(Frontal_L_Example3)
Frontal_L_Example3 <- rasterGrob(Frontal_L_Example3)

pdf("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_DM6_LH_AllExamples_v1.pdf", width = 1, height = 1.7)
layout <- rbind(c(1),c(2),c(3))
grid.arrange(arrangeGrob(Frontal_L_Example1, Frontal_L_Example2, Frontal_L_Example3,
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}














### VM3-VM2-VC4 ----

#### Dsec - LM ----
nl_Dsec_ALPNs_IS2_VM5d_like_VM3_VM2 <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_13_adPN_up_VM3,
                                                  nl_Dsec_ALPNs_DsecI_allR$Dsec_25_adPN_up_VM3,
                                                  nl_Dsec_ALPNs_DsecI_allR$Dsec_120_adPN_up_VM2)

nl_Dsec_ALPNs_IS2_VM5d_like_VM3_VM2 <- xform_brain(nl_Dsec_ALPNs_IS2_VM5d_like_VM3_VM2, reference = "IS2", sample = "DsecI")


#### Dmel - EM - VM3-VM2(-VC4) ----
loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM3 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VM3/")
loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM3 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VM3/")
nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM3 <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM3, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM3 <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM3, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_VM2/")
loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_VM2/")
nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM2 <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM2, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM2 <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM2, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike_VM3 <- c(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM3,
                                            nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM3)

nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike_VM2 <- c(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_VM5dlike_VM2,
                                            nl_Dmel_EM_FAFB_ALPNs_IS2_allR_VM5dlike_VM2)


#### Lateral Horn - Dsec & Dmel ----

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d_like_VM3_VM2[3], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike_VM2[1], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM3_LH_Example1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d_like_VM3_VM2[2], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike_VM3[2], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM3_LH_Example2.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_VM5d_like_VM3_VM2[1], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_VM5dlike_VM3[3], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM3_LH_Example3.png", fmt="png", height = height_frontal, width = width_frontal)

# Generate Sub-Panel
Frontal_L_Example1 <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM3_LH_Example1.png")
Frontal_L_Example1 <- image_crop(Frontal_L_Example1, "550x300+60+150")
Frontal_L_Example1 <- image_flop(Frontal_L_Example1)
Frontal_L_Example1 <- rasterGrob(Frontal_L_Example1)

Frontal_L_Example2 <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM3_LH_Example2.png")
Frontal_L_Example2 <- image_crop(Frontal_L_Example2, "550x300+60+150")
Frontal_L_Example2 <- image_flop(Frontal_L_Example2)
Frontal_L_Example2 <- rasterGrob(Frontal_L_Example2)

Frontal_L_Example3 <- image_read("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM3_LH_Example3.png")
Frontal_L_Example3 <- image_crop(Frontal_L_Example3, "550x300+60+150")
Frontal_L_Example3 <- image_flop(Frontal_L_Example3)
Frontal_L_Example3 <- rasterGrob(Frontal_L_Example3)

pdf("./3_Figures/Figure4/Figure4_F_Dsec_Dmel_VM3_LH_AllExamples_v1.pdf", width = 1, height = 1.7)
layout <- rbind(c(1),c(2),c(3))
grid.arrange(arrangeGrob(Frontal_L_Example1, Frontal_L_Example2, Frontal_L_Example3,
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}










## Panel G - VM5d extra branch Tracts ----

### Brain regions - VM5d extra branch in Dsec ----

nl_Dsec_ALPNs_DsecI_VM5d <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_6_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_114_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_1_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_97_adPN_u_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_24_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_86_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_113_adPN_up_VM5d,
                                       nl_Dsec_ALPNs_DsecI_allR$Dsec_133_adPN_u_VM5d
)

nl_Dsec_ALPNs_DsecI_VM5d_like <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_64_adPN_up_DM6,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_62_adPN_up_DM6,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_12_adPN_up_DM6,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_40_adPN_up_VM7d,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_66_adPN_up_VM7d,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_57_adPN_up_VM7d,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_49_adPN_up_VM7v,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_59_adPN_up_VM7v,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_13_adPN_up_VM3,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_25_adPN_up_VM3,
                                            nl_Dsec_ALPNs_DsecI_allR$Dsec_120_adPN_up_VM2
)

# We are aware of a DM1 adPN with a branch that reaches out into the direction  as out Dsec VM5d's, it can be shown with the following two lines:
# nl_Dmel_ALPNs_IS2_DM1 <- read.neurons("./1_Data/6_Dataset_other/13_Dmel_DM1/")
# nl_Dmel_ALPNs_DsecI_DM1 <- xform_brain(nl_Dmel_ALPNs_IS2_DM1, sample = IS2, reference = DsecI)


# I used two different color for the brain area surfaces as they differed between dorsal and ventral perspectives
open3d()
clear3d()
plot3d(DsecI_surf, color ="grey", alpha = 0.03, )
plot3d(br_SCL_DsecI, col = "lightblue1", alpha = 0.2)
plot3d(br_SLP_DsecI, col = col_glom_2, alpha = 0.04)
plot3d(tract_Dsec_AL_L_DsecI_lowres, material = "Superior_Latero-dorsal_Tract", col="blue", alpha= 0.2)
plot3d(nl_Dsec_ALPNs_DsecI_VM5d, soma =soma, lwd=lwd, col = colfunc_red)
#plot3d(nl_Dmel_ALPNs_DsecI_DM1, soma =soma, lwd=lwd, col = colfunc_lightblue)
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Figure4/Figure4_G_Dsec_VM5d_SCL_SLP_anterior.png", fmt="png", height = height_frontal, width = width_frontal)


open3d()
clear3d()
plot3d(DsecI_surf, color ="grey", alpha = 0.03, )
plot3d(br_SCL_DsecI, col = "lightskyblue3", alpha = 0.2)
plot3d(br_SLP_DsecI, col = col_glom_2, alpha = 0.04)
plot3d(tract_Dsec_AL_L_DsecI_lowres, material = "Superior_Latero-dorsal_Tract", col="blue", alpha= 0.2)
plot3d(nl_Dsec_ALPNs_DsecI_VM5d, soma=soma, lwd=lwd, col = colfunc_red)
#plot3d(nl_Dmel_ALPNs_DsecI_DM1, soma=soma, lwd=lwd, col = colfunc_lightblue)
nview3d("dorsal", 0, zoom = 0.365)
snapshot3d("./3_Figures/Figure4/Figure4_G_Dsec_VM5d_SCL_SLP_dorsal.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Generate Sub-Panel
Frontal <- image_read("./3_Figures/Figure4/Figure4_G_Dsec_VM5d_SCL_SLP_anterior.png")
Frontal <- image_crop(Frontal, "740x700+90+14")
Frontal <- rasterGrob(Frontal)

Dorsal <- image_read("./3_Figures/Figure4/Figure4_G_Dsec_VM5d_SCL_SLP_dorsal.png")
Dorsal <- image_crop(Dorsal, "740x690+90+14")
Dorsal <- rasterGrob(Dorsal)

pdf("./3_Figures/Figure4/Figure4_G_Dsec_VM5d_SCL_SLP_v1.pdf", width = 1, height = 1.878)
layout <- rbind(c(1),c(2))
grid.arrange(arrangeGrob(Frontal, Dorsal,
                         heights = (c(1, 0.954)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}



## Panel H - Annotated Dataset with morphological changes ----
# made in Illustrator




