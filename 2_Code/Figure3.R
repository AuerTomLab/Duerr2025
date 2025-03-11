#--------------------------------------------#
# Figure 3  ----
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


## Panel A - Registration of Reference Brains - DsecI & IS2 Side by Side ----

# Official reference brains of IS2.nrrd & DsecI.nrrd were used
# Images were overlapped in Fiji
# The CMTK Fiji plugin was used to register DsecI to IS2
# The plugin exported the warp-registered DsecI
# To generate the affine-registration image the warp-code-block in the registration file was removed and the registration file was used again in the Fiji plugin to format DsecI only using the affine-registration





#### DsecI & IS2 Side by Side ----
# Recorded Fiji Macro:

# ```
# open("/Users/benediktdurr/Dropbox/Auer group/Manuscripts/Dsec tool manuscript/Duerr et al. - R Version/1_Data/3_Registration/01_Reference_Brains/DsecI.nrrd");
# selectImage("DsecI.nrrd");
# run("Z Project...", "projection=[Max Intensity]");
# selectImage("MAX_DsecI.nrrd");
# run("Red");
# //run("Brightness/Contrast...");
# setMinAndMax(2050, 23000);
# saveAs("PNG", "/Users/benediktdurr/Dropbox/Auer group/Manuscripts/Dsec tool manuscript/Duerr et al. - R Version/3_Figures/Figure3/Figure3_tba_DsecI_SidebySide.png");
# ```

# ```
# open("/Users/benediktdurr/Dropbox/Auer group/Manuscripts/Dsec tool manuscript/Duerr et al. - R Version/1_Data/3_Registration/01_Reference_Brains/IS2.nrrd");
# selectImage("IS2.nrrd");
# run("Z Project...", "projection=[Max Intensity]");
# selectImage("MAX_IS2.nrrd");
# run("Cyan");
# //run("Brightness/Contrast...");
# setMinAndMax(7500, 72000);
# saveAs("PNG", "/Users/benediktdurr/Dropbox/Auer group/Manuscripts/Dsec tool manuscript/Duerr et al. - R Version/3_Figures/Figure3/Figure3_tba_IS2_SidebySide.png");
# ```




#### DsecI & IS2 Overlap ----
# 1. Maximum Intensity Z-Project Reference brains .nrrd files
# 2. Merge channels, DsecI (red), IS2 (cyan)
# 3. Adjust Minimum & Brightness so the two differently exposed Images match in brightness.
# Values we used:
# - DsecI: setMinAndMax(2050, 23000);
# - IS2: setMinAndMax(7500, 72000);
# Recorded Fiji Macro:

# ```
# open("/1_Data/3_Registration/01_Reference_Brains/DsecI.nrrd");
# selectImage("DsecI.nrrd");
# open("/1_Data/3_Registration/01_Reference_Brains/IS2.nrrd");
# selectImage("DsecI.nrrd");
# run("Z Project...", "projection=[Max Intensity]");
# selectImage("IS2.nrrd");
# run("Z Project...", "projection=[Max Intensity]");
# run("Merge Channels...", "c1=MAX_DsecI.nrrd c5=MAX_IS2.nrrd create keep ignore");
# //run("Brightness/Contrast...");
# setMinAndMax(2050, 23000);
# setMinAndMax(7500, 72000);
# saveAs("PNG", "/3_Figures/Figure3/Figure3_tba_DsecI_IS2_SidebySide.png");
# ```




#### DsecI & IS2 rigid/affine registration ----
# Here we reformatted DsecI with a modified warp-registration file in which we removed the part necessary for warp registration.
# Thereby we were able to reformat DsecI brain using CMTK in Fiji.
# Registration file used:

# ```
# ! TYPEDSTREAM 2.4
# registration {
#   reference_study "IS2.nrrd"
#   floating_study "images/DsecI_01.nrrd"
#   affine_xform {
#     xlate 23.84424178 36.11343119 0.7235015006 
#     rotate 7.47458242 0.02481233958 0.5886004592 
#     scale 1.133232272 1.16630508 0.9359329177 
#     shear -0.0007424180321 0.0003190150854 -0.06977384039 
#     center 176.8927457 176.8927457 85 
#   }
#   spline_warp {
#     affine_xform {
#       xlate 23.84424178 36.11343119 0.7235015006 
#       rotate 7.47458242 0.02481233958 0.5886004592 
#       scale 1.133232272 1.16630508 0.9359329177 
#       shear -0.0007424180321 0.0003190150854 -0.06977384039 
#       center 176.8927457 176.8927457 85 
#     }
#   }
# }
# ```

# Recorded Fiji Macro:
# ```
# open("/1_Data/3_Registration/01_Reference_Brains/IS2.nrrd");
# open("/1_Data/3_Registration/02_Bridging_Registrations/Reg_DsecI>IS2_rigid/reformatted/IS2_DsecI_01_warp_m0g80c8e1e-1x26r4.nrrd");
# selectImage("IS2_DsecI_01_warp_m0g80c8e1e-1x26r4.nrrd");
# run("Z Project...", "projection=[Max Intensity]");
# selectImage("IS2.nrrd");
# run("Z Project...", "projection=[Max Intensity]");
# run("Merge Channels...", "c1=MAX_IS2_DsecI_01_warp_m0g80c8e1e-1x26r4.nrrd c5=MAX_IS2.nrrd create keep ignore");
# //run("Brightness/Contrast...");
# setMinAndMax(2050, 23000);
# setMinAndMax(7500, 72000);
# saveAs("PNG", "/3_Figures/Figure3/Figure3_tba_DsecI>IS2_affine.png");
# ```




#### DsecI & IS2 warp registration ----

# Recorded Fiji Macro:
# ```
# open("/1_Data/3_Registration/02_Bridging_Registrations/Reg_DsecI>IS2/IS2.nrrd");
# open("/1_Data/3_Registration/02_Bridging_Registrations/Reg_DsecI>IS2/reformatted/IS2_DsecI_01_warp_m0g80c8e1e-1x26r4.nrrd");
# selectImage("IS2.nrrd");
# run("Z Project...", "projection=[Max Intensity]");
# selectImage("IS2_DsecI_01_warp_m0g80c8e1e-1x26r4.nrrd");
# run("Z Project...", "projection=[Max Intensity]");
# run("Merge Channels...", "c1=MAX_IS2_DsecI_01_warp_m0g80c8e1e-1x26r4.nrrd c5=MAX_IS2.nrrd create keep ignore");
# //run("Brightness/Contrast...");
# setMinAndMax(2050, 23000);
# setMinAndMax(7500, 72000);
# saveAs("PNG", "/3_Figures/Figure3/Figure3_tba_DsecI>IS2_warp.png");
# ```








## Panel B - Jacobian Determinant Map of the Registration from DsecI to IS2 (DsecI>IS2) ----

# Here we generate jacobian determinant maps for different bridging registrations (DsecF>DsecI & DsecI>IS2).
# This allows to check for potential registration artefacts.
# We use the command line after we installed CMTK (https://www.nitrc.org/projects/cmtk) to access cmtk functions via Fiji.
# In the Terminal we define the cd: cd /Applications/Fiji.app/bin/cmtk"
# Then we ran the following command with the corresponding file locations:

# As an example: ./reformatx -o /output_file_name.nrrd /reference_brain.nrrd --jacobian /cmtk_registration.list

# cmtk % ./reformatx -o /Users/benediktdurr/Desktop/Reg_DsecF\>IS2/jacobian_fixed.nrrd /Users/benediktdurr/Desktop/Reg_DsecF\>IS2/IS2.nrrd --jacobian /Users/benediktdurr/Desktop/Reg_DsecF\>IS2/Registration/warp/IS2_DsecF_01_warp_m0g80c8e1e-1x26r4.list

# cmtk % ./reformatx
# -o Reg_DsecF\>IS2/jacobian_fixed.nrrd 
# /Reg_DsecF\>IS2/IS2.nrrd 
# --jacobian /Reg_DsecF\>IS2/Registration/warp/IS2_DsecF_01_warp_m0g80c8e1e-1x26r4.list



### Jacobian Determinant Map & DsecI warp registration Overlap - Fiji ----
# The following code block was recorded in Fiji using the Markdown recorder
# We had to reduce the brightness of the registered DsecI grey scale image so the jacobian map was still visible.

# ```
# open("/1_Data/9_Jacobian/test/jacobian_fixed.nrrd");
# selectImage("jacobian_fixed.nrrd");
# 
# open("/1_Data/9_Jacobian/test/IS2_DsecF_01_warp_m0g80c8e1e-1x26r4.nrrd");
# selectImage("IS2_DsecF_01_warp_m0g80c8e1e-1x26r4.nrrd");
# selectImage("jacobian_fixed.nrrd");
# 
# makeRectangle(0, 0, 768, 768);
# run("Measure Stack...");
# //run("Brightness/Contrast...");
# setMinAndMax(0.00, 4.499);
# run("Divide...", "value=4.990 stack");
# setMinAndMax(0, 1);
# run("phase");
# 
# selectImage("jacobian_fixed.nrrd");
# run("AVI... ", "compression=JPEG frame=15 save=[/3_Figures/Figure3/Figure3_tba_Jacobian_Map_PhaseLUT.avi]");
# 
# selectImage("jacobian_fixed.nrrd");
# run("Slice Keeper", "first=30 last=30 increment=1");
# selectImage("jacobian_fixed.nrrd kept stack");
# saveAs("PNG", "/3_Figures/Figure3/Figure3_tba_Jacobian_Map_PhaseLUT_z30.png");
# 
# selectImage("jacobian_fixed.nrrd");
# run("Slice Keeper", "first=80 last=80 increment=1");
# saveAs("PNG", "/3_Figures/Figure3/Figure3_tba_Jacobian_Map_PhaseLUT_z80.png");
# 
# selectImage("jacobian_fixed.nrrd");
# run("Slice Keeper", "first=120 last=120 increment=1");
# saveAs("PNG", "/3_Figures/Figure3/Figure3_tba_Jacobian_Map_PhaseLUT_z120.png");
# 
# run("Merge Channels...", "c1=jacobian_fixed.nrrd c4=IS2_DsecF_01_warp_m0g80c8e1e-1x26r4.nrrd create keep");
# 
# # The brightness of the registered DsecI grey scale image we had to reduce the brightness so the jacobian map is still visible.
# //run("Brightness/Contrast...");
# setMinAndMax(10000, 130000);
# 
# run("AVI... ", "compression=JPEG frame=15 save=[/3_Figures/Figure3/Figure3_tba_Jacobian_Map_PhaseLUT.avi]");
# 
# selectImage("Composite-1");
# run("RGB Color", "slices keep");
# run("Slice Keeper", "first=30 last=30 increment=1");
# saveAs("PNG", "/Users/benediktdurr/Dropbox/Auer group/Manuscripts/Dsec tool manuscript/Duerr et al. - R Version/3_Figures/Figure3/Figure3_tba_Jacobian_Map_PhaseLUT_z30.png");
# 
# selectImage("Composite-1");
# run("Slice Keeper", "first=80 last=80 increment=1");
# saveAs("PNG", "/Users/benediktdurr/Dropbox/Auer group/Manuscripts/Dsec tool manuscript/Duerr et al. - R Version/3_Figures/Figure3/Figure3_tba_Jacobian_Map_PhaseLUT_z80.png");
# 
# selectImage("Composite-1");
# run("Slice Keeper", "first=120 last=120 increment=1");
# saveAs("PNG", "/Users/benediktdurr/Dropbox/Auer group/Manuscripts/Dsec tool manuscript/Duerr et al. - R Version/3_Figures/Figure3/Figure3_tba_Jacobian_Map_PhaseLUT_z120.png");
# ```


### Color Legend ----
# The Jacobian Determinant Map generated by cmtk depicts compression and expanded points using pixel intensities
# Values below 1 depict a compression (set to blue) and values above 1 depict expansion (set to red) of the point
# Thereby a custom color legend had to created to properly depict the compression/expansion correctly

# Java Code for ImageJ
# '''
# import ij.IJ;
# import ij.ImagePlus;
# import ij.gui.NewImage;
# import ij.process.ColorProcessor;
# import ij.process.ImageProcessor;
# 
# public class CustomColormap {
#   
#   public static void main(String[] args) {
#     // Test Image (Optional)
#     ImagePlus imp = NewImage.createByteImage("Test Image", 256, 1, 1, NewImage.FILL_BLACK);
#     ImageProcessor ip = imp.getProcessor();
#     for (int i = 0; i < 256; i++) {
#       ip.set(i, 0, (byte) i);
#     }
#     imp.show();
#     
#     // Create the custom colormap
#     byte[] reds = new byte[256];
#     byte[] greens = new byte[256];
#     byte[] blues = new byte[256];
#     
#     // j = 0 -> red (index 0)
#     reds[0] = (byte) 255;
#     greens[0] = (byte) 0;
#     blues[0] = (byte) 0;
#     
#     // 0 < j < 1 -> dark blue to white (index 1-50)
#     for (int i = 1; i <= 50; i++) {
#       reds[i] = (byte) ((i * 255) / 50);
#       greens[i] = (byte) ((i * 255) / 50);
#       blues[i] = (byte) 255;
#     }
#     
#     // j = 1 -> white (index 51)
#     reds[51] = (byte) 255;
#     greens[51] = (byte) 255;
#     blues[51] = (byte) 255;
#     
#     // 1 < j < 4 -> white to red (index 52-255)
#     for (int i = 52; i <= 255; i++) {
#       reds[i] = (byte) 255;                     // Red stays at max
#       greens[i] = (byte) (255 - ((i - 51) * 255)/ (255-51)); // Linear gradient for green
#       blues[i] = (byte) (255 - ((i - 51) * 255)/ (255-51)); // Linear gradient for blue
#     }
#     
#     // Set the custom colormap
#     ColorProcessor cp = (ColorProcessor) imp.getProcessor().convertToColorProcessor();
#     cp.setRGB(reds, greens, blues);
#     imp.setProcessor(cp);
#     imp.updateAndDraw();
#     
#     //Optional: Save the LUT
#     //IJ.saveAs(imp, "LUT", "/path/to/save/custom_lut.lut");
#   }
# }
# '''










## Panel C - Dataset Overview ----

### Dsec - Conf - All olfactory adPNs & lPN ----
nl_Dsec_ALPNs_DsecI_allR <- read.neurons("./1_Data/5_Dataset_our/3.4_Dsec_ALPNs_DsecI_allR_renamed/")

open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col="grey")
plot3d(nl_Dsec_ALPNs_DsecI_allR, lwd = lwd, soma = soma, col = colfunc_red)
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Figure3/Figure3_C_Dsec_Conf_Dataset_Overview_ALPNs_n133_anterior.png", fmt="png", height = height_frontal, width = width_frontal)
nview3d("dorsal", 0, zoom = 0.365)
snapshot3d("./3_Figures/Figure3/Figure3_C_Dsec_Conf_Dataset_Overview_ALPNs_n133_dorsal.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R <- image_read("./3_Figures/Figure3/Figure3_C_Dsec_Conf_Dataset_Overview_ALPNs_n133_anterior.png")
Frontal_R <- rasterGrob(Frontal_R)

Dorsal_R <- image_read("./3_Figures/Figure3/Figure3_C_Dsec_Conf_Dataset_Overview_ALPNs_n133_dorsal.png")
Dorsal_R <- rasterGrob(Dorsal_R)

pdf("./3_Figures/Figure3/Figure3_C_Dsec_Conf_Dataset_Overview_ALPNs_n133_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1),c(2))
grid.arrange(arrangeGrob(Frontal_R, Dorsal_R,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}





### Dmel - Conf - All olfactory adPNs & lPNs ----

nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN <- read.neurons("./1_Data/6_Dataset_other/01.5_Dmel_ALPN_conf_VFB_FBbt_00067123_annotated_RH_IS2_n285_adPN/")
# open3d()
# plot3d(nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN, lwd = lwd, soma = soma, col = colfunc_lightblue)
# Select neurons which are likely not correctly rooted using nlscan()
# list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_NoSoma <- nlscan(nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN, lwd = lwd, soma = soma)
# saveRDS(list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_NoSoma, file = "./1_Data/6_Dataset_other/01.5_list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_NoSoma.rds")
list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_NoSoma <- readRDS("./1_Data/6_Dataset_other/01.5_list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_NoSoma.rds")
# n=63 possibly incorrectly annotated /not existing somata
nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_NoSoma <- nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN[list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_NoSoma]


nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA <- read.neurons("./1_Data/6_Dataset_other/01.4_Dmel_ALPN_conf_VFB_FBbt_00067123_NA_adPNs_lPNs_v2_LHreach_allR_n178/")
# open3d()
# plot3d(nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA, lwd = lwd, soma = soma, col = colfunc_lightblue)
# Select neurons which are likely not correctly rooted using nlscan()
# list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_NoSoma <- nlscan(nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA, lwd = lwd, soma = soma)
# saveRDS(list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_NoSoma, file = "./1_Data/6_Dataset_other/01.4_list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_NoSoma.rds")
list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_NoSoma <- readRDS("./1_Data/6_Dataset_other/01.4_list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_NoSoma.rds")
# n=84 possibly incorrectly annotated /not existing somata
nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_NoSoma <- nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA[list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_NoSoma]


# create neuron lists of NA neurons with soma
list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_WithSoma <- setdiff(names(nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN), list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_NoSoma)
nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_WithSoma <- nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN[list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_WithSoma]

list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_WithSoma <- setdiff(names(nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA), list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_NoSoma)
nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_WithSoma <- nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA[list_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_WithSoma]

# combine neuronlists
nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_WithSoma <- c(nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_WithSoma,
                                                       nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_WithSoma)

nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NoSoma <- c(nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_AN_NoSoma,
                                                     nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NA_NoSoma)


open3d()
plot3d(IS2, alpha = alpha_brain, col="grey")
plot3d(nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_WithSoma, lwd = lwd, soma = soma, col = colfunc_lightblue)
plot3d(nl_WholeDataset_Dmel_Conf_All_adPNs_lPNs_NoSoma, lwd = lwd, col = colfunc_lightblue)
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Figure3/Figure3_C_Dmel_Conf_all_ad&lPNs_n463_anterior.png", fmt="png", height = height_frontal, width = width_frontal)
nview3d("dorsal", 0, zoom = 0.5)
snapshot3d("./3_Figures/Figure3/Figure3_C_Dmel_Conf_all_ad&lPNs_n463_dorsal.png", fmt="png", height = 900, width = width_dorsal)

# Generate Sub-Panel
Frontal_R <- image_read("./3_Figures/Figure3/Figure3_C_Dmel_Conf_all_ad&lPNs_n463_anterior.png")
Frontal_R <- rasterGrob(Frontal_R)

Dorsal_R <- image_read("./3_Figures/Figure3/Figure3_C_Dmel_Conf_all_ad&lPNs_n463_dorsal.png")
Dorsal_R <- image_crop(Dorsal_R, "1550x900+33+0")
# Image got resized as the brain space has a different Z depth
Dorsal_R <- image_resize(Dorsal_R, "1600x690!")
Dorsal_R <- rasterGrob(Dorsal_R)

pdf("./3_Figures/Figure3/Figure3_C_Dmel_Conf_all_ad&lPNs_n463_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1),c(2))
grid.arrange(arrangeGrob(Frontal_R, Dorsal_R,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}





### Dmel - EM - All olfactory adPNs & lPNs----

nl_WholeDataset_Dmel_EM_All_adPNs_uni <- read.neurons("./1_Data/6_Dataset_other/01.8_Dmel_ALPN_em_VFB_FBbt_00067123_RH_all_IS2_uniglomerular_n219_adPN/")
# open3d()
# plot3d(nl_WholeDataset_Dmel_EM_All_adPNs_uni, lwd = lwd, soma = soma, col = colfunc_lightblue)
# Select neurons which are likely not correctly rooted using nlscan()
# list_WholeDataset_Dmel_EM_All_adPNs_uni_NoSoma <- nlscan(nl_WholeDataset_Dmel_EM_All_adPNs_uni, lwd = lwd, soma = soma)
# saveRDS(list_WholeDataset_Dmel_EM_All_adPNs_uni_NoSoma, file = "./1_Data/6_Dataset_other/01.8_list_WholeDataset_Dmel_EM_All_adPNs_uni_NoSoma.rds")
list_WholeDataset_Dmel_EM_All_adPNs_uni_NoSoma <- readRDS("./1_Data/6_Dataset_other/01.8_list_WholeDataset_Dmel_EM_All_adPNs_uni_NoSoma.rds")
# n=70 possibly incorrectly annotated /not existing somata
nl_WholeDataset_Dmel_EM_All_adPNs_uni_NoSoma <- nl_WholeDataset_Dmel_EM_All_adPNs_uni[list_WholeDataset_Dmel_EM_All_adPNs_uni_NoSoma]


nl_WholeDataset_Dmel_EM_All_lPNs_uni <- read.neurons("./1_Data/6_Dataset_other/01.8_Dmel_ALPN_em_VFB_FBbt_00067123_RH_all_IS2_uniglomerular_n98_lPN/")
# open3d()
# plot3d(nl_WholeDataset_Dmel_EM_All_lPNs_uni, lwd = lwd, soma = soma, col = colfunc_lightblue)
# Select neurons which are likely not correctly rooted using nlscan()
# list_WholeDataset_Dmel_EM_All_lPNs_uni_NoSoma <- nlscan(nl_WholeDataset_Dmel_EM_All_lPNs_uni, lwd = lwd, soma = soma)
# saveRDS(list_WholeDataset_Dmel_EM_All_lPNs_uni_NoSoma, file = "./1_Data/6_Dataset_other/01.8_list_WholeDataset_Dmel_EM_All_lPNs_uni_NoSoma.rds")
list_WholeDataset_Dmel_EM_All_lPNs_uni_NoSoma <- readRDS("./1_Data/6_Dataset_other/01.8_list_WholeDataset_Dmel_EM_All_lPNs_uni_NoSoma.rds")
# n=32 possibly incorrectly annotated /not existing somata
nl_WholeDataset_Dmel_EM_All_lPNs_uni_NoSoma <- nl_WholeDataset_Dmel_EM_All_lPNs_uni[list_WholeDataset_Dmel_EM_All_lPNs_uni_NoSoma]


nl_WholeDataset_Dmel_EM_All_adPNs_multi <- read.neurons("./1_Data/6_Dataset_other/01.8_Dmel_ALPN_em_VFB_FBbt_00067123_RH_all_IS2_multiadPNs_n22/")
# open3d()
# plot3d(nl_WholeDataset_Dmel_EM_All_adPNs_multi, lwd = lwd, soma = soma, col = colfunc_lightblue)
# Select neurons which are likely not correctly rooted using nlscan()
# list_WholeDataset_Dmel_EM_All_adPNs_multi_NoSoma <- nlscan(nl_WholeDataset_Dmel_EM_All_adPNs_multi, lwd = lwd, soma = soma)
# saveRDS(list_WholeDataset_Dmel_EM_All_adPNs_multi_NoSoma, file = "./1_Data/6_Dataset_other/01.8_list_WholeDataset_Dmel_EM_All_adPNs_multi_NoSoma.rds")
list_WholeDataset_Dmel_EM_All_adPNs_multi_NoSoma <- readRDS("./1_Data/6_Dataset_other/01.8_list_WholeDataset_Dmel_EM_All_adPNs_multi_NoSoma.rds")
# n=2 possibly incorrectly annotated /not existing somata
nl_WholeDataset_Dmel_EM_All_adPNs_multi_NoSoma <- nl_WholeDataset_Dmel_EM_All_adPNs_multi[list_WholeDataset_Dmel_EM_All_adPNs_multi_NoSoma]


nl_WholeDataset_Dmel_EM_All_lPNs_multi <- read.neurons("./1_Data/6_Dataset_other/01.8_Dmel_ALPN_em_VFB_FBbt_00067123_RH_all_IS2_multilPNs_n26/")
# open3d()
# plot3d(nl_WholeDataset_Dmel_EM_All_lPNs_multi, lwd = lwd, soma = soma, col = colfunc_lightblue)
# Select neurons which are likely not correctly rooted using nlscan()
# list_WholeDataset_Dmel_EM_All_lPNs_multi_NoSoma <- nlscan(nl_WholeDataset_Dmel_EM_All_lPNs_multi, lwd = lwd, soma = soma)
# saveRDS(list_WholeDataset_Dmel_EM_All_lPNs_multi_NoSoma, file = "./1_Data/6_Dataset_other/01.8_list_WholeDataset_Dmel_EM_All_lPNs_multi_NoSoma.rds")
list_WholeDataset_Dmel_EM_All_lPNs_multi_NoSoma <- readRDS("./1_Data/6_Dataset_other/01.8_list_WholeDataset_Dmel_EM_All_lPNs_multi_NoSoma.rds")
# n=0 possibly incorrectly annotated /not existing somata
nl_WholeDataset_Dmel_EM_All_lPNs_multi_NoSoma <- nl_WholeDataset_Dmel_EM_All_lPNs_multi[list_WholeDataset_Dmel_EM_All_lPNs_multi_NoSoma]



# create neuron lists of EM neurons with soma
list_WholeDataset_Dmel_EM_All_adPNs_uni_WithSoma <- setdiff(names(nl_WholeDataset_Dmel_EM_All_adPNs_uni), list_WholeDataset_Dmel_EM_All_adPNs_uni_NoSoma)
nl_WholeDataset_Dmel_EM_All_adPNs_uni_WithSoma <- nl_WholeDataset_Dmel_EM_All_adPNs_uni[list_WholeDataset_Dmel_EM_All_adPNs_uni_WithSoma]

list_WholeDataset_Dmel_EM_All_lPNs_uni_WithSoma <- setdiff(names(nl_WholeDataset_Dmel_EM_All_lPNs_uni), list_WholeDataset_Dmel_EM_All_lPNs_uni_NoSoma)
nl_WholeDataset_Dmel_EM_All_lPNs_uni_WithSoma <- nl_WholeDataset_Dmel_EM_All_lPNs_uni[list_WholeDataset_Dmel_EM_All_lPNs_uni_WithSoma]

list_WholeDataset_Dmel_EM_All_adPNs_multi_WithSoma <- setdiff(names(nl_WholeDataset_Dmel_EM_All_adPNs_multi), list_WholeDataset_Dmel_EM_All_adPNs_multi_NoSoma)
nl_WholeDataset_Dmel_EM_All_adPNs_multi_WithSoma <- nl_WholeDataset_Dmel_EM_All_adPNs_multi[list_WholeDataset_Dmel_EM_All_adPNs_multi_WithSoma]

list_WholeDataset_Dmel_EM_All_lPNs_multi_WithSoma <- setdiff(names(nl_WholeDataset_Dmel_EM_All_lPNs_multi), list_WholeDataset_Dmel_EM_All_lPNs_multi_NoSoma)
nl_WholeDataset_Dmel_EM_All_lPNs_multi_WithSoma <- nl_WholeDataset_Dmel_EM_All_lPNs_multi[list_WholeDataset_Dmel_EM_All_lPNs_multi_WithSoma]


# combine neuronlists
nl_WholeDataset_Dmel_EM_All_adPNs_lPNs_WithSoma <- c(nl_WholeDataset_Dmel_EM_All_adPNs_uni_WithSoma,
                                                     nl_WholeDataset_Dmel_EM_All_lPNs_uni_WithSoma,
                                                     nl_WholeDataset_Dmel_EM_All_adPNs_multi_WithSoma,
                                                     nl_WholeDataset_Dmel_EM_All_lPNs_multi_WithSoma)


nl_WholeDataset_Dmel_EM_All_adPNs_lPNs_NoSoma <- c(nl_WholeDataset_Dmel_EM_All_adPNs_uni_NoSoma,
                                                   nl_WholeDataset_Dmel_EM_All_lPNs_uni_NoSoma,
                                                   nl_WholeDataset_Dmel_EM_All_adPNs_multi_NoSoma,
                                                   nl_WholeDataset_Dmel_EM_All_lPNs_multi_NoSoma)


open3d()
plot3d(IS2,
       alpha = 0.05)
plot3d(nl_WholeDataset_Dmel_EM_All_adPNs_lPNs_WithSoma, lwd = lwd, soma = soma, col = colfunc_darkblue)
plot3d(nl_WholeDataset_Dmel_EM_All_adPNs_lPNs_NoSoma, lwd = lwd, col = colfunc_darkblue)
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Figure3/Figure3_C_Dmel_EM_all_ad&lPNs_n=365_anterior.png", fmt="png", height = height_frontal, width = width_frontal)
nview3d("dorsal", 0, zoom = 0.5)
snapshot3d("./3_Figures/Figure3/Figure3_C_Dmel_EM_all_ad&lPNs_n=365_dorsal.png", fmt="png", height = 900, width = width_dorsal)

# Generate Sub-Panel
Frontal_R <- image_read("./3_Figures/Figure3/Figure3_C_Dmel_EM_all_ad&lPNs_n=365_anterior.png")
Frontal_R <- rasterGrob(Frontal_R)

Dorsal_R <- image_read("./3_Figures/Figure3/Figure3_C_Dmel_EM_all_ad&lPNs_n=365_dorsal.png")
Dorsal_R <- image_crop(Dorsal_R, "1550x900+33+0")
Dorsal_R <- image_resize(Dorsal_R, "1600x690!")
Dorsal_R <- rasterGrob(Dorsal_R)

pdf("./3_Figures/Figure3/Figure3_C_Dmel_EM_all_ad&lPNs_n=365_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1),c(2))
grid.arrange(arrangeGrob(Frontal_R, Dorsal_R,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}









## Panel D - ALPN Comparison Dsec vs Dmel ----

### mlPN2 ----
# mlPN2 = Lateral Multi 2 #in older code
# mlPN3 = Lateral Multi 3 #in older code

#### Dsec Conf ----
# Same code as in Sup_Figure2

nl_Dsec_Conf_mlPN2 <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_105_lPN_m_ml2,
                                         nl_Dsec_ALPNs_DsecI_allR$Dsec_65_lPN_m_ml2,
                                         nl_Dsec_ALPNs_DsecI_allR$Dsec_106_lPN_m_ml2,
                                         nl_Dsec_ALPNs_DsecI_allR$Dsec_100_lPN_m_ml2,
                                         nl_Dsec_ALPNs_DsecI_allR$Dsec_95_lPN_m_ml2,
                                         nl_Dsec_ALPNs_DsecI_allR$Dsec_42_lPN_m_ml2
                                         )

nl_Dsec_Conf_mlPN2_example_R <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_65_lPN_m_ml2)

# All Cluster ALPNS
open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_Conf_mlPN2, lwd=lwd, soma=soma, col=col_neuron_clust)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN2_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_Conf_mlPN2, lwd=lwd, soma=soma, col=colfunc_red)
nview3d("dorsal", 0, zoom = zoom_dorsal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN2_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Cluster example
open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_Conf_mlPN2, lwd=lwd, soma=soma, col=col_neuron_expl1)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN2_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_Conf_mlPN2, lwd=lwd, soma=soma, col=col_neuron_expl1)
nview3d("dorsal", 0, zoom = zoom_dorsal)
snapshot3d("./3_Figures/Figure3/Figure3/Figure3_D_Dsec_Conf_mlPN2_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN2_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "812x1300+0+0")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN2_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "812x1300+0+0")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN2_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "812x690+0+0")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN2_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "812x690+0+0")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN2_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}




#### Dmel Conf ----
loc_Dmel_Conf_ALPNs_IS2_allR_mlPN2 <- file.path("./1_Data/6_Dataset_other/01.4_Dmel_ALPN_Conf_VFB_FBbt_00067123_NA_adPNs_lPNs_v2_LHreach_allR_mlPN2_n4/")
nl_Dmel_Conf_ALPNs_IS2_allR_mlPN2 <- read.neurons(loc_Dmel_Conf_ALPNs_IS2_allR_mlPN2, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_Conf_ALPNs_IS2_allR_mlPN2_example_R <- neuronlist(nl_Dmel_Conf_ALPNs_IS2_allR_mlPN2[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_mlPN2, lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DM2---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN2_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_mlPN2, lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN2_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_mlPN2_example_R, lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN2_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_mlPN2_example_R, lwd=lwd, soma=soma, col=colfunc_lightblue)
#plot3d(glom_Dsec_AL_RH_DsecI, materials = "RH_DL2d---", color = col_glom, alpha = alpha_glom)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN2_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN2_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN2_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN2_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN2_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN2_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}





#### Dmel EM ----

loc_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_mlPN2/")
nl_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN2 <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN2, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_mlPN2/")
nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN2 <- read.neurons(loc_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN2, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_mlPN2 <- c(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN2,nl_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN2)

nl_Dmel_EM_ALPNs_IS2_allR_mlPN2_example_R <- neuronlist(nl_Dmel_EM_ALPNs_IS2_allR_mlPN2[1])
#nl_Dmel_EM_FlyEM_ALPNs_IS2_mlPN2i_example_RH <- neuronlist(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN2[5])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_mlPN2, lwd=lwd, soma=soma, col=colfunc_darkblue)
#plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN2, lwd=lwd, soma=soma, col=colfunc_red)
#plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN2, lwd=lwd, soma=soma, col=colfunc_blue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN2_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_mlPN2, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN2, lwd=lwd, soma=soma, col=colfunc_red)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_allR_mlPN2, lwd=lwd, soma=soma, col=colfunc_blue)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN2_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_mlPN2_example_R, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_mlPN2_example_R, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_mlPN2_example_R, lwd=lwd, soma=soma, col=col_neuron_expl2)

nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN2_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_mlPN2_example_R, lwd=lwd, soma=soma, col=colfunc_darkblue)
# plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_mlPN2_example_R, lwd=lwd, soma=soma, col=col_neuron_expl1)
# plot3d(nl_Dmel_EM_FlyEM_ALPNs_IS2_mlPN2_example_R, lwd=lwd, soma=soma, col=col_neuron_expl2)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN2_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN2_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN2_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN2_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN2_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN2_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}








### mlPN3 ----

#### Dsec Conf > Sup Fig2 ----
nl_Dsec_ALPNs_DsecI_mlPN3 <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_93_lPN_m_ml3,
                                        nl_Dsec_ALPNs_DsecI_allR$Dsec_98_lPN_m_ml3,
                                        nl_Dsec_ALPNs_DsecI_allR$Dsec_77_lPN_m_ml3,
                                        nl_Dsec_ALPNs_DsecI_allR$Dsec_35_lPN_m_ml3,
                                        nl_Dsec_ALPNs_DsecI_allR$Dsec_122_lPN_m_ml3,
                                        nl_Dsec_ALPNs_DsecI_allR$Dsec_46_lPN_m_ml3,
                                        nl_Dsec_ALPNs_DsecI_allR$Dsec_80_lPN_m_ml3,
                                        nl_Dsec_ALPNs_DsecI_allR$Dsec_54_lPN_m_ml3
                                        )

nl_Dsec_ALPNs_DsecI_mlPN3_example_R <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_98_lPN_m_ml3)

# All Cluster ALPNS
open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPNs_DsecI_mlPN3, lwd=lwd, soma=soma, col=col_neuron_clust)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN3_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPNs_DsecI_mlPN3, lwd=lwd, soma=soma, col=colfunc_red)
nview3d("dorsal", 0, zoom = zoom_dorsal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN3_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Cluster example
open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPNs_DsecI_mlPN3_example_R, lwd=lwd, soma=soma, col=col_neuron_expl1)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN3_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(DsecI_surf, alpha = alpha_brain, col = "grey")
plot3d(nl_Dsec_ALPNs_DsecI_mlPN3_example_R, lwd=lwd, soma=soma, col=col_neuron_expl1)
nview3d("dorsal", 0, zoom = zoom_dorsal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN3_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN3_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "812x1300+0+0")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN3_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "812x1300+0+0")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN3_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "812x690+0+0")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN3_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "812x690+0+0")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Figure3/Figure3_D_Dsec_Conf_mlPN3_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {rgl.close()}







#### Dmel Conf ----

loc_Dmel_Conf_ALPNs_IS2_allR_mlPN3 <- file.path("./1_Data/6_Dataset_other/01.4_Dmel_ALPN_Conf_VFB_FBbt_00067123_NA_adPNs_lPNs_v2_LHreach_allR_mlPN3/")
nl_Dmel_Conf_ALPNs_IS2_allR_mlPN3 <- read.neurons(loc_Dmel_Conf_ALPNs_IS2_allR_mlPN3, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_Conf_ALPNs_IS2_allR_mlPN3_example_R <- neuronlist(nl_Dmel_Conf_ALPNs_IS2_allR_mlPN3[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_mlPN3, lwd=lwd, soma=soma, col=colfunc_lightblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN3_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_mlPN3, lwd=lwd, soma=soma, col=colfunc_lightblue)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN3_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_mlPN3_example_R, lwd=lwd, soma=soma, col=colfunc_lightblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN3_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_Conf_ALPNs_IS2_allR_mlPN3_example_R, lwd=lwd, soma=soma, col=colfunc_lightblue)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN3_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN3_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN3_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN3_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN3_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)


pdf("./3_Figures/Figure3/Figure3_D_Dmel_Conf_mlPN3_v1.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}





#### Dmel EM ----

loc_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN3 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_mlPN3/")
nl_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN3 <- read.neurons(loc_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN3, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_FAFB_ALPNs_IS2_mlPN3_example_R <- neuronlist(nl_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN3[1])

# All Cluster ALPNS
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN3, lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN3_frontal_all.png", fmt="png", height = height_frontal, width = width_frontal)
close3d()

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_allR_mlPN3, lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN3_dorsal_all.png", fmt="png", height = height_dorsal, width = width_dorsal)


# Cluster example
open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_mlPN3_example_R, lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN3_frontal_example.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dmel_EM_FAFB_ALPNs_IS2_mlPN3_example_R, lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("dorsal", 0, zoom = 0.46)
snapshot3d("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN3_dorsal_example.png", fmt="png", height = height_dorsal, width = width_dorsal)

# Generate Sub-Panel
Frontal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN3_frontal_all.png")
Frontal_R_all <- image_crop(Frontal_R_all, "787x1270+25+30")
Frontal_R_all <- image_resize(Frontal_R_all, "812x1300!")
Frontal_R_all <- rasterGrob(Frontal_R_all)

Frontal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN3_frontal_example.png")
Frontal_R_example <- image_crop(Frontal_R_example, "787x1270+25+30")
Frontal_R_example <- image_resize(Frontal_R_example, "812x1300!")
Frontal_L_example <- image_flop(Frontal_R_example)
Frontal_L_example <- rasterGrob(Frontal_L_example)

Dorsal_R_all <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN3_dorsal_all.png")
Dorsal_R_all <- image_crop(Dorsal_R_all, "612x690+205+0")
Dorsal_R_all <- image_resize(Dorsal_R_all, "812x690!")
Dorsal_R_all <- rasterGrob(Dorsal_R_all)

Dorsal_R_example <- image_read("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN3_dorsal_example.png")
Dorsal_R_example <- image_crop(Dorsal_R_example, "612x690+205+0")
Dorsal_R_example <- image_resize(Dorsal_R_example, "812x690!")
Dorsal_L_example <- image_flop(Dorsal_R_example)
Dorsal_L_example <- rasterGrob(Dorsal_L_example)

pdf("./3_Figures/Figure3/Figure3_D_Dmel_EM_mlPN3.pdf", width = 1, height = 1.2258)
layout <- rbind(c(1,2),c(3,4))
grid.arrange(arrangeGrob(Frontal_R_all, Frontal_L_example, Dorsal_R_all, Dorsal_L_example,
                         heights = (c(0.668, 0.355)),
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}






















## Panel E - madPN2 - LH Branching Comparison Dsec vs Dmel ----
# madPN2 - madPN2


### Overview ----
# See Sup_Figure_2






### Detail - Lateral Horn ----

#### Dsec ----
nl_Dsec_ALPNs_DsecI_madPN2 <- neuronlist(nl_Dsec_ALPNs_DsecI_allR$Dsec_53_adPN_m_md2,
                                               nl_Dsec_ALPNs_DsecI_allR$Dsec_61_adPN_m_md2,
                                               nl_Dsec_ALPNs_DsecI_allR$Dsec_48_adPN_m_md2,
                                               nl_Dsec_ALPNs_DsecI_allR$Dsec_58_adPN_m_md2,
                                               nl_Dsec_ALPNs_DsecI_allR$Dsec_36_adPN_m_md2,
                                               nl_Dsec_ALPNs_DsecI_allR$Dsec_51_adPN_m_md2,
                                               nl_Dsec_ALPNs_DsecI_allR$Dsec_103_adPN_m_md2,
                                               nl_Dsec_ALPNs_DsecI_allR$Dsec_14_adPN_m_md2
)

nl_Dsec_ALPNs_IS2_madPN2<- xform_brain(nl_Dsec_ALPNs_DsecI_madPN2, sample = DsecI, reference = IS2)


#### Dmel - EM ----
loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_madPN2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FAFB_RH_IS2_madPN2/")
nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_madPN2 <- read.neurons(loc_Dmel_EM_FAFB_other_ALPNs_IS2_allR_madPN2, pattern = "*.swc", neuronnames = NULL)

loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_madPN2 <- file.path("./1_Data/6_Dataset_other/01.8.1_Dmel_ALPN_em_FlyEM_RH_IS2_madPN2/")
nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_madPN2 <- read.neurons(loc_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_madPN2, pattern = "*.swc", neuronnames = NULL)

nl_Dmel_EM_ALPNs_IS2_allR_madPN2 <- c(nl_Dmel_EM_FlyEM_other_ALPNs_IS2_allR_madPN2,nl_Dmel_EM_FAFB_other_ALPNs_IS2_allR_madPN2)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_madPN2[1], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_madPN2[4], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_E_Dsec_Dmel_madPN2_LH_Example1_v1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_madPN2[2], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_madPN2[2], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_E_Dsec_Dmel_madPN2_LH_Example2_v1.png", fmt="png", height = height_frontal, width = width_frontal)

open3d()
plot3d(IS2, alpha = alpha_brain)
plot3d(nl_Dsec_ALPNs_IS2_madPN2[3], lwd=lwd, soma=soma, col=col_neuron_expl1)
plot3d(nl_Dmel_EM_ALPNs_IS2_allR_madPN2[3], lwd=lwd, soma=soma, col=colfunc_darkblue)
nview3d("frontal", 0, zoom = zoom_frontal)
snapshot3d("./3_Figures/Figure3/Figure3_E_Dsec_Dmel_madPN2_LH_Example3_v1.png", fmt="png", height = height_frontal, width = width_frontal)

# Generate Sub-Panel
Frontal_LH_Example1 <- image_read("./3_Figures/Figure3/Figure3_E_Dsec_Dmel_madPN2_LH_Example1_v1.png")
Frontal_LH_Example1 <- image_crop(Frontal_LH_Example1, "550x300+60+150")
Frontal_LH_Example1 <- image_flop(Frontal_LH_Example1)
Frontal_LH_Example1 <- rasterGrob(Frontal_LH_Example1)

Frontal_LH_Example2 <- image_read("./3_Figures/Figure3/Figure3_E_Dsec_Dmel_madPN2_LH_Example2_v1.png")
Frontal_LH_Example2 <- image_crop(Frontal_LH_Example2, "550x300+60+150")
Frontal_LH_Example2 <- image_flop(Frontal_LH_Example2)
Frontal_LH_Example2 <- rasterGrob(Frontal_LH_Example2)

Frontal_LH_Example3 <- image_read("./3_Figures/Figure3/Figure3_E_Dsec_Dmel_madPN2_LH_Example3_v1.png")
Frontal_LH_Example3 <- image_crop(Frontal_LH_Example3, "550x300+60+150")
Frontal_LH_Example3 <- image_flop(Frontal_LH_Example3)
Frontal_LH_Example3 <- rasterGrob(Frontal_LH_Example3)

pdf("./3_Figures/Figure3/Figure3_E_Dsec_Dmel_madPN2_LH_AllExamples_v1.pdf", width = 1, height = 1.7)
layout <- rbind(c(1),c(2),c(3))
grid.arrange(arrangeGrob(Frontal_LH_Example1, Frontal_LH_Example2, Frontal_LH_Example3,
                         layout_matrix = layout))
dev.off()
while (rgl.cur() > 0) {close3d()}
















## Panel F - madPN2 - Dsec&Dmel in IS2 - NBLAST Comparison of different neuron pruning ----

### Overview - No Pruning - Whole Neuron ----
loc_Dsec_IS2_madPN2 <- file.path("./1_Data/6_Dataset_other/16_Dsec_IS2_md2")
loc_Dmel_IS2_madPN2 <- file.path("./1_Data/6_Dataset_other/16_Dmel_IS2_md2")

nl_Dsec_IS2_madPN2 <- read.neurons(loc_Dsec_IS2_madPN2, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_IS2_madPN2 <- read.neurons(loc_Dmel_IS2_madPN2, pattern = "*.swc", neuronnames = NULL)
nl_Dsec_Dmel_IS2_madPN2 <- c(nl_Dsec_IS2_madPN2,nl_Dmel_IS2_madPN2)

open3d()
plot3d(nl_Dsec_IS2_madPN2, lwd = lwd, soma = soma, col = colfunc_red) # no soma plotted
plot3d(nl_Dmel_IS2_madPN2, lwd = lwd, soma = soma, col = colfunc_darkblue) # no soma plotted
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Figure3/Figure3_F_Dsec_Dmel_madPN2_anterior.png", fmt="png", height = height_frontal, width = width_frontal)



#### NBLAST ----
##### Analysis ----
dots_Dsec_Dmel_IS2_madPN2 <- dotprops(nl_Dsec_Dmel_IS2_madPN2, OmitFailures = NA)
scores_Dsec_Dmel_IS2_madPN2 <- nblast_allbyall(dots_Dsec_Dmel_IS2_madPN2)
hc_Dsec_Dmel_IS2_madPN2 <- nhclust(scoremat=scores_Dsec_Dmel_IS2_madPN2)
h = 0.75
color_Dsec_Dmel_IS2_madPN2 <- colour_clusters(hc_Dsec_Dmel_IS2_madPN2, h=h, groupLabels=F)

##### Dendrogram ----
pdf("./3_Figures/Figure3/Figure3_F_NBLAST_Dsec_Dmel_IS2_madPN2_v1.pdf", 
    width=22, height=10)
# PDF export: x= 0,2 inch per entry; y= 15inch
par(mar = c(15,3,5,1))
par(mgp = c(1.5, 0.5, 0))
plot(color_Dsec_Dmel_IS2_madPN2,
     main = "Dsec_Dmel_VM5d_IS2",
     ylab = "NBLAST Score")
abline(h=h, lty=2, col="grey")
rect <- rect.hclust(hc_Dsec_Dmel_IS2_madPN2, h=h, border = "grey")
beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
y_clus <- weighted.mean(rev(hc_Dsec_Dmel_IS2_madPN2$height)+0.1)
text(x=beg_clus, y=y_clus, col="black", font=2)
dev.off()
while (rgl.cur() > 0) {close3d()}


### NBLAST - Pruning 3 - similar node density ---
# (not included into the manuscript)
# We increased the node density in Neutube using the insert key "i".
# We increased the node density of Dsec by 2x
# We increased the node density of Dmel FlyEM by 1x
# We did not increase the node density of Dmel FAFB as it is already very high
# The NBLAST result barely changed, the position withing the blast score did not change

# loc_Dmel_FAFB_IS2_madPN2_pruned3_dense <- file.path("./1_Data/6_Dataset_other/16_Dmel_IS2_md2_pruned3_dense")
# loc_Dmel_FlyEM_IS2_madPN2_pruned3_denseX1 <- file.path("./1_Data/6_Dataset_other/16_Dmel_IS2_md2_pruned3_denseX1")
# loc_Dsec_IS2_madPN2_pruned3_denseX2 <- file.path("./1_Data/6_Dataset_other/16_Dsec_IS2_md2_pruned3_denseX2")
# 
# nl_Dmel_FAFB_IS2_madPN2_pruned3_dense <- read.neurons(loc_Dmel_FAFB_IS2_madPN2_pruned3_dense, pattern = "*.swc", neuronnames = NULL)
# nl_Dmel_FlyEM_IS2_madPN2_pruned3_denseX1 <- read.neurons(loc_Dmel_FlyEM_IS2_madPN2_pruned3_denseX1, pattern = "*.swc", neuronnames = NULL)
# nl_Dsec_IS2_madPN2_pruned3_denseX2 <- read.neurons(loc_Dsec_IS2_madPN2_pruned3_denseX2, pattern = "*.swc", neuronnames = NULL)
# nl_Dsec_Dmel_IS2_madPN2_pruned3_dense <- c(nl_Dmel_FAFB_IS2_madPN2_pruned3_dense,nl_Dmel_FlyEM_IS2_madPN2_pruned3_denseX1,nl_Dsec_IS2_madPN2_pruned3_denseX2)
# 
# #### Analysis ---
# dots_Dsec_Dmel_IS2_madPN2_pruned3_dense <- dotprops(nl_Dsec_Dmel_IS2_madPN2_pruned3_dense, OmitFailures = NA)
# scores_Dsec_Dmel_IS2_madPN2_pruned3_dense <- nblast_allbyall(dots_Dsec_Dmel_IS2_madPN2_pruned3_dense)
# hc_Dsec_Dmel_IS2_madPN2_pruned3_dense <- nhclust(scoremat=scores_Dsec_Dmel_IS2_madPN2_pruned3_dense)
# h = 0.75
# color_Dsec_Dmel_IS2_madPN2_pruned3_dense <- colour_clusters(hc_Dsec_Dmel_IS2_madPN2_pruned3_dense, h=h, groupLabels=F)
# 
# #### Dendrogram ---
# pdf("./3_Figures/Figure3/Figure3_tba_NBLAST_Dsec_Dmel_IS2_madPN2_pruned3_dense_v1.pdf", 
#     width=22, height=10)
# # PDF export: x= 0,2 inch per entry; y= 15inch
# par(mar = c(15,3,5,1))
# par(mgp = c(1.5, 0.5, 0))
# plot(color_Dsec_Dmel_IS2_madPN2_pruned3_dense,
#      main = "Dsec_Dmel_IS2_madPN2_pruned3_dense",
#      ylab = "NBLAST Score")
# abline(h=h, lty=2, col="grey")
# rect <- rect.hclust(hc_Dsec_Dmel_IS2_madPN2_pruned3_dense, h=h, border = "grey")
# beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
# y_clus <- weighted.mean(rev(hc_Dsec_Dmel_IS2_madPN2_pruned3_dense$height)+0.1)
# text(x=beg_clus, y=y_clus, col="black", font=2)
# dev.off()
# while (rgl.cur() > 0) {close3d()}





### Overview - Pruned - Antennal Lobe Dendrites ----
loc_Dsec_IS2_madPN2_pruned1 <- file.path("./1_Data/6_Dataset_other/16_Dsec_IS2_md2_pruned1")
loc_Dmel_IS2_madPN2_pruned1 <- file.path("./1_Data/6_Dataset_other/16_Dmel_IS2_md2_pruned1")

nl_Dsec_IS2_madPN2_pruned1 <- read.neurons(loc_Dsec_IS2_madPN2_pruned1, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_IS2_madPN2_pruned1 <- read.neurons(loc_Dmel_IS2_madPN2_pruned1, pattern = "*.swc", neuronnames = NULL)
nl_Dsec_Dmel_IS2_madPN2_pruned1 <- c(nl_Dsec_IS2_madPN2_pruned1,nl_Dmel_IS2_madPN2_pruned1)

open3d()
plot3d(nl_Dsec_IS2_madPN2_pruned1, lwd = lwd, soma = soma, col = colfunc_red)
plot3d(nl_Dmel_IS2_madPN2_pruned1, lwd = lwd, soma = soma, col = colfunc_darkblue)
nview3d("frontal", 0, zoom = 0.69)
snapshot3d("./3_Figures/Figure3/Figure3_F_Dsec_Dmel_madPN2_pruned1_anterior.png", fmt="png", height = height_frontal, width = width_frontal)


#### NBLAST ----
##### Analysis ----
dots_Dsec_Dmel_IS2_madPN2_pruned1 <- dotprops(nl_Dsec_Dmel_IS2_madPN2_pruned1, OmitFailures = NA)
scores_Dsec_Dmel_IS2_madPN2_pruned1 <- nblast_allbyall(dots_Dsec_Dmel_IS2_madPN2_pruned1)
hc_Dsec_Dmel_IS2_madPN2_pruned1 <- nhclust(scoremat=scores_Dsec_Dmel_IS2_madPN2_pruned1)
h = 0.75
color_Dsec_Dmel_IS2_madPN2_pruned1 <- colour_clusters(hc_Dsec_Dmel_IS2_madPN2_pruned1, h=h, groupLabels=F)

##### Dendrogram ----
pdf("./3_Figures/Figure3/Figure3_F_NBLAST_Dsec_Dmel_IS2_madPN2_pruned1_v1.pdf", 
    width=22, height=10)
# PDF export: x= 0,2 inch per entry; y= 15inch
par(mar = c(15,3,5,1))
par(mgp = c(1.5, 0.5, 0))
plot(color_Dsec_Dmel_IS2_madPN2_pruned1,
     main = "Dsec_Dmel_VM5d_IS2",
     ylab = "NBLAST Score")
abline(h=h, lty=2, col="grey")
rect <- rect.hclust(hc_Dsec_Dmel_IS2_madPN2_pruned1, h=h, border = "grey")
beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
y_clus <- weighted.mean(rev(hc_Dsec_Dmel_IS2_madPN2_pruned1$height)+0.1)
text(x=beg_clus, y=y_clus, col="black", font=2)
dev.off()
while (rgl.cur() > 0) {close3d()}




### Overview - Pruned - Only Mushroom Body & LH inntervations ----
loc_Dsec_IS2_madPN2_pruned3 <- file.path("./1_Data/6_Dataset_other/16_Dsec_IS2_md2_pruned3")
loc_Dmel_IS2_madPN2_pruned3 <- file.path("./1_Data/6_Dataset_other/16_Dmel_IS2_md2_pruned3")

nl_Dsec_IS2_madPN2_pruned3 <- read.neurons(loc_Dsec_IS2_madPN2_pruned3, pattern = "*.swc", neuronnames = NULL)
nl_Dmel_IS2_madPN2_pruned3 <- read.neurons(loc_Dmel_IS2_madPN2_pruned3, pattern = "*.swc", neuronnames = NULL)
nl_Dsec_Dmel_IS2_madPN2_pruned3 <- c(nl_Dsec_IS2_madPN2_pruned3,nl_Dmel_IS2_madPN2_pruned3)

open3d()
plot3d(nl_Dsec_IS2_madPN2_pruned3, lwd = lwd, col = colfunc_red) # no soma plotted
plot3d(nl_Dmel_IS2_madPN2_pruned3, lwd = lwd, col = colfunc_darkblue) # no soma plotted
nview3d("frontal", 0, zoom = 1)
snapshot3d("./3_Figures/Figure3/Figure3_F_Dsec_Dmel_madPN2_pruned3_anterior.png", fmt="png", height = height_frontal, width = width_frontal)


#### NBLAST ----

##### Analysis ----
dots_Dsec_Dmel_IS2_madPN2_pruned3 <- dotprops(nl_Dsec_Dmel_IS2_madPN2_pruned3, OmitFailures = NA)
scores_Dsec_Dmel_IS2_madPN2_pruned3 <- nblast_allbyall(dots_Dsec_Dmel_IS2_madPN2_pruned3)
hc_Dsec_Dmel_IS2_madPN2_pruned3 <- nhclust(scoremat=scores_Dsec_Dmel_IS2_madPN2_pruned3)
h = 0.75
color_Dsec_Dmel_IS2_madPN2_pruned3 <- colour_clusters(hc_Dsec_Dmel_IS2_madPN2_pruned3, h=h, groupLabels=F)

##### Dendrogram ----
pdf("./3_Figures/Figure3/Figure3_F_NBLAST_Dsec_Dmel_IS2_madPN2_pruned3_v1.pdf", 
    width=22, height=10)
# PDF export: x= 0,2 inch per entry; y= 15inch
par(mar = c(15,3,5,1))
par(mgp = c(1.5, 0.5, 0))
plot(color_Dsec_Dmel_IS2_madPN2_pruned3,
     main = "Dsec_Dmel_VM5d_IS2",
     ylab = "NBLAST Score")
abline(h=h, lty=2, col="grey")
rect <- rect.hclust(hc_Dsec_Dmel_IS2_madPN2_pruned3, h=h, border = "grey")
beg_clus <- head(cumsum(c(1, lengths(rect))), -1)
y_clus <- weighted.mean(rev(hc_Dsec_Dmel_IS2_madPN2_pruned3$height)+0.1)
text(x=beg_clus, y=y_clus, col="black", font=2)
dev.off()
while (rgl.cur() > 0) {close3d()}





