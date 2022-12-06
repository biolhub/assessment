# Data plotting functions

# function to create two overlapping histograms showing distribution of culmen lengths in Adelie and Chinstrap penguinns

plot_culmen_figure <- function(culmen_plotting){  # create function for plotting
  culmen_plotting %>%  # use subset of data for plotting
    ggplot(aes(culmen_length_mm,  # plot distribution culmen length 
               fill = species)) +  # colour by species
    geom_histogram(position = position_identity(),  # plot overlaying histograms
                   alpha=0.75) +  # set transparency to 0.5 for visibility of both histograms
    scale_fill_manual(values = c("darkorange","purple"),  # set standard colours for species
                      labels=c("Adelie","Chinstrap")) +  # rename species
    labs(x = "Culmen length (mm)", y = "Frequency",  # label axes
         title = "Culmen lengths in Adelie and Chinstrap penguins",
         fill = "Penguin species") +  
    theme_bw()  # set theme
}

# function to plot data and save as png

save_culmen_plot_png <- function(culmen_plotting,  # create function for plotting data and saving plot
                                  filename,  # allow specification of filename
                                 size,  # allow specification of size
                                 res,  # allow specificaiton of resolution
                                 scaling){  # allows specification of scaling of lines and text
  agg_png(filename,  # use agg function to specify filename for png
          width   =  size, height  =  size,  # specifies image dimensions
          units   =  "cm",  # size units in cm
          res     =  res,  # specifies image resolution
          scaling =  scaling)  # specifies scaling of lines and text
  culmen_hist <- plot_culmen_figure(culmen_plotting)  # plot histogram using custom function
  print(culmen_hist)  # produce image of plot
  dev.off()  # end agg function 
}