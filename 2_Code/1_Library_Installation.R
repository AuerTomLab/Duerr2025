#-----------------------------#
# Library - Installation -----
#-----------------------------#

#------------------------------  Description  ---------------------------------#
# This file contains all necessary libraries.
# It should be executed ahead of running code for the figures
#------------------------------------------------------------------------------#


## Initiate the renv ----
# We can restore the used project package library from the renv lockfile

# renv::init() #This command was used for setting up the project
# renv::snapshot() #Record new/updated packages in the lockfile
# renv::status()
# renv::restore() #reinstall specific packages used in this project
# renv::deactivate(clean = TRUE)
# renv::clean()


## Setup .Renviron ----
# usethis::edit_r_environ()
# paste your details for:
# GITHUB_PAT=
# CHROMOTE_CHROME="(path to Chrome browser)" # for webshot2 # for exporting high resolution neurons
# neuprint_server="https://neuprint.janelia.org"
# neuprint_token=""
# neuprint_dataset="hemibrain:v1.2.1"


## Packages used in the project ----

### Base Packages ----

install.packages("remotes")
install.packages("promises")
install.packages("usethis")
install.packages("devtools")
install.packages("rtools")


### Main Packages ----

# install natverse
# follow: https://natverse.org/install/

install.packages("natmanager")
natmanager::install("natverse")

remotes::install_github("natverse/nat.flybrains")
install.packages("git2r")
install.packages("hdf5r")
renv::install("hdf5r") # was installed via the command line: brew install hdf5
devtools::install_github('natverse/nat.h5reg')
# nat.flybrains::download_jefferislab_registrations()
remotes::install_github("natverse/nat.jrcbrains")
install.packages("nat.templatebrains")
install.packages("dendroextras")


# configure python environment in: Tools > Project Options... > Python
# e.g. in MacOS terminal: pip3 install vfb-connect

install.packages("XML")
devtools::install_github("jefferis/vfbr")
devtools::install_github("jefferis/vfbconnectr")
devtools::install_github("natverse/neuprintr")
remotes::install_github("natverse/hemibrainr")


### Glomeruli import ----
install.packages("alphashape3d")


### Other Packages ----
install.packages("usethis")
install.packages("readobj")
install.packages("tidyverse")


### Visualisation Packages ----
# Not properly set up rgl can lead to problems in exporting snapshots

remotes::install_github("rstudio/webshot2")
install.packages("RColorBrewer")

install.packages("gridExtra")
install.packages("ggplot2")
install.packages("png")
install.packages("magick")

#install.packages("fplot")
# install.packages("manipulateWidget")
