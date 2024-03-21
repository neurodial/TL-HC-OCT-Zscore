# Retinal Layer Thicknesses Age-adjusted Z-score generation
This repository contains health control (HC) data and codes used to generate HC reference percentiles and z-score curves. It also includes code that users can follow to transform raw OCT measures of patients into corresponding Z-scores. Please note that this repository does not include all the codes used for the analysis presented in the paper 'Individual Prognostication of Disease Activity and Disability Worsening in Multiple Sclerosis with Retinal Layer Thickness Z-scores' by Lin et al. (Translational Neuroimaging Group (DIAL), Charité Universitätsmedizin Berlin).

# Installation
The R script was written with R version 4.2.0 and RStudio Desktop version 2022.02.2+485, therefore R version 4.2.0 or higher and RStudio version 2022.02.2+485 or later is needed to successfully run this code.

These packages are needed in order to be able to run this code successfully: **_knitr, dplyr, plyr, gamlss, gamlss.foreach_**

You can simply install all these packages by running this R code. The code installs the packages which have not been already installed.
```r
list.of.packages <- c("knitr", "dplyr", "plyr", "gamlss", "gamlss.foreach")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)>0) install.packages(new.packages)
```
The version of the packages used during the development of this code is as follows: knitr v1.39, dplyr v2.1.1, plyr v1.8.7, gamlss v5.4-3, gamlss.foreach_ v1.1-3. Although, the installation of R and RStudio with the right versions should yield to the installation of the packages with the correct versions without specifying them. R, RStudio and the packages might need administrative privileges to be installed.

## Usage
In order to run the code, please open HC_Zscore_Public.R in RStudio, and replace './Data/Your_MS_Data.csv' with the directory of your patient data.

## Need Help?
In case you needed help running this code or had related questions, please contact Dr. Ting-Yi Lin (ting-yi.lin[at]charite.de) or Dr. Friedemann Paul (friedemann.paul[at]charite.de). We would be delighted to help you and answer your questions!

## License
Using the data and code provided in this repository without permission is prohibited. Please contact Dr. Ting-Yi Lin (ting-yi.lin[at]charite.de) for any inquiries about the data and code.
