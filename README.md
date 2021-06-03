# bluepally
Use colour palettes in ggplot2 based on fresh and delicious blueberries!

The gradient is based on this picture

![https://www.reddit.com/r/mildlyinteresting/comments/nr14oh/the_gradient_this_clump_of_blueberries_makes/](bb.jpg)

I used https://html-color-codes.info/colors-from-image/ for extracting the colors.

## Installation
Install via GitHub:

``` r
# install.packages("devtools")
devtools::install_github("manucarl/bluepally")
```

## Examples


``` r
library(bluepally)
library(ggplot2)

blueberry_colors

ggplot(iris, aes(Sepal.Width, Sepal.Length, color = Species)) +
geom_point(size = 4) +
scale_color_blueberry(palette="blue", reverse = TRUE)
```


``` r
ggplot(mpg, aes(manufacturer, fill = manufacturer)) +
geom_bar() +
theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
scale_fill_blueberry( guide = "none")
```

