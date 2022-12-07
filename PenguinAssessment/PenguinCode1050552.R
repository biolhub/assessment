# candidate number: 1050552

# Load the data ----

# SET WORKING DIRECTORY TO WHEREVER FOLDER HAS BEEN DOWNLOADED
setwd("~/assessment-main/PenguinAssessment") # Set working directory

# load relevant files
source("functions/libraries.r")
source("functions/cleaning.r")
source("functions/plotting.r")

# Appropriately clean the data ----

penguins_clean <- cleaning(penguins_raw)  # clean data using custom function

head(penguins_clean)  # check data is cleaned appropriately

# Run a statistical test
# A T-test on culmen length in Adelie vs Chinstrap penguins

# clean and subset data for analysis using custom functions
adelie_culmen <- subset_adelie(penguins_clean)
chinstrap_culmen <- subset_chinstrap(penguins_clean)

t.test(adelie_culmen$culmen_length_mm, chinstrap_culmen$culmen_length_mm)  # perform an unpaired two-sided two sample t-test on the data

# Create a figure ----

culmen_plotting <- subset_culmen(penguins_clean)  # clean and subset data for plotting using a custom function

culmen_hist <- plot_culmen_figure(culmen_plotting)  # plot 2 overlapping histograms using a custom function
culmen_hist  # display figure 

# Save the figure ----

save_culmen_plot_png(culmen_plotting,  # save specified figure using custom function
                      "figures/fig.png",  # name figure
                      size = 15,  # specify figure size
                     res = 600,  # specify figure resolution
                     scaling=1) # specify scaling of line width and text size

