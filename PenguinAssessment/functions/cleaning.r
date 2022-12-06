# Data cleaning functions

# cleaning function

cleaning <- function(penguins_raw){  # create a data cleaning function
  penguins_raw %>%  # apply function to specified data
    clean_names() %>%  # clean names
    remove_empty(c("cols","rows")) %>%  # remove empty rows and columns
    select(-starts_with("Delta")) %>%  # select everything except any variable that starts with Delta
    select(-comments)  # select everything except the comments
}

# data subsetting and cleaning function for analysis of Adelie culmen length

subset_adelie <- function(data_clean){  # create a data subsetting function
  data_clean %>%  # apply to cleaned data
    filter(!is.na(culmen_length_mm)) %>%  # subset observations that are not "NA" for culmen length
    filter(species=="Adelie Penguin (Pygoscelis adeliae)") %>%  # subset observations of Adelie penguins
    select(species, culmen_length_mm)  # select the species and culmen length variables
}

# data subsetting and cleaning function for analysis of Chinstrap culmen length

subset_chinstrap <- function(data_clean){  # create a data subsetting function
  data_clean %>%   # apply to cleaned data
    filter(!is.na(culmen_length_mm)) %>%  # subset observations that are not "NA" for culmen length
    filter(species=="Chinstrap penguin (Pygoscelis antarctica)") %>%  # subset observations of Chinstrap penguins
    select(species, culmen_length_mm)  # select the species and culmen length variables
}

# data subsetting and cleaning function for plotting of culmen length

subset_culmen <- function(data_clean){  # create a data subsetting function
  data_clean %>%  # apply to cleaned data
    filter(!is.na(culmen_length_mm)) %>%  # subset observations that are not NA for culmen length
    filter(!species=="Gentoo penguin (Pygoscelis papua)") %>%  # subset observations that are not Gentoo penguins
    select(species, culmen_length_mm)  # select the species and culmen length variables
}
