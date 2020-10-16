metallicaRt
================

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/johnmackintosh/metallicaRt.svg?branch=master)](https://travis-ci.com/johnmackintosh/metallicaRt)
<!-- badges: end -->

# <img src="man/figures/metallicart.jpg" width="160px" align="right"/>

## What?

On a whim, this is a collection of colour palettes based on Metallica
album covers.

Each is named using an abbreviation of the relevant album.

## Why?

Because I saw [this
post](https://github.com/annahensch/R-tutorials/blob/master/ggplot-on-fire.md)
on Twitter

## But still, …why?

Because I’d already created a bunch of palettes manually for [this post
on my
blog](https://johnmackintosh.net/blog/2018-01-29-hardwired-for-tidy-text/)

## How?

I produced the palettes with 7 colours using an online tool, when I
produced my blog post originally. I also put together the ‘combo’
palette.

Palettes that end with ‘10’ were created using
[colorfindr](https://CRAN.R-project.org/package=colorfindr)

## Credit

Thanks to Kelly Cotton for [the nycpalettes
package](https://github.com/kellycotton/nycpalettes) which this was
extremely heavily based on

## I need this in my life

Of course you do. This will not go to CRAN, so please install using the
remotes package.

``` r
#library(remotes)
#remotes::install_github("johnmackintosh/metallicaRt")
library(metallicaRt)
#> Warning: replacing previous import 'vctrs::data_frame' by 'tibble::data_frame'
#> when loading 'dplyr'
```

## Data Viz Friendly

These mini palettes *might* actually be useful.

All named after a song title from the relevant album

``` r
metalli_palette("whiplash")
```

![](man/figures/README-unnamed-chunk-2-1.png)<!-- -->

``` r
metalli_palette("bells")
```

![](man/figures/README-unnamed-chunk-3-1.png)<!-- -->

``` r
metalli_palette("orion")
```

![](man/figures/README-unnamed-chunk-4-1.png)<!-- -->

``` r
m <- outer(1:20,1:20,function(x,y) sin(sqrt(x*y)/3))
cols <- metalli_palette("orion")
Lab.palette <- colorRampPalette(cols,space = "Lab")
filled.contour(m, col = Lab.palette(20))
```

![](man/figures/README-unnamed-chunk-4-2.png)<!-- -->

``` r
metalli_palette("blackened")
```

![](man/figures/README-unnamed-chunk-5-1.png)<!-- -->

``` r
metalli_palette("roam")
```

![](man/figures/README-unnamed-chunk-6-1.png)<!-- -->

``` r
metalli_palette("bleeding")
```

![](man/figures/README-unnamed-chunk-7-1.png)<!-- -->

``` r
cols <- metalli_palette("bleeding")
Lab.palette <- colorRampPalette(cols,space = "Lab")
filled.contour(m, col = Lab.palette(20))
```

![](man/figures/README-unnamed-chunk-7-2.png)<!-- -->

``` r
metalli_palette("fuel")
```

![](man/figures/README-unnamed-chunk-8-1.png)<!-- -->

``` r
metalli_palette("frantic")
```

![](man/figures/README-unnamed-chunk-9-1.png)<!-- -->

``` r
metalli_palette("scarred")
```

![](man/figures/README-unnamed-chunk-10-1.png)<!-- -->

``` r
metalli_palette("revenge")
```

![](man/figures/README-unnamed-chunk-11-1.png)<!-- -->

``` r
cols <- metalli_palette("revenge")
Lab.palette <- colorRampPalette(cols,space = "Lab")
filled.contour(m, col = Lab.palette(20))
```

![](man/figures/README-unnamed-chunk-11-2.png)<!-- -->

## Gimme fuel, gimme fire, longer palettes I desire

OK then.

These contain more album specific colors, but might be of less practical
use for data visualisation purposes.

# Kill ’Em All

``` r
metalli_palette("kill")
```

![](man/figures/README-unnamed-chunk-12-1.png)<!-- -->

``` r
scales::show_col(killem_pal()(10))
```

![](man/figures/README-unnamed-chunk-13-1.png)<!-- -->

## Ride The Lightning

``` r
metalli_palette("rtl")
```

![](man/figures/README-unnamed-chunk-14-1.png)<!-- -->

``` r
scales::show_col(lightning_pal()(10))
```

![](man/figures/README-unnamed-chunk-15-1.png)<!-- -->

## Master of Puppets

``` r
metalli_palette("puppets")
```

![](man/figures/README-unnamed-chunk-16-1.png)<!-- -->

``` r
scales::show_col(puppets_pal()(10))
```

![](man/figures/README-unnamed-chunk-17-1.png)<!-- -->

## …And Justice For All

``` r
metalli_palette("justice")
```

![](man/figures/README-unnamed-chunk-18-1.png)<!-- -->

``` r
scales::show_col(justice_pal()(10))
```

![](man/figures/README-unnamed-chunk-19-1.png)<!-- -->

## Metallica

How much more black could it be?

``` r
metalli_palette("metallica")
```

![](man/figures/README-unnamed-chunk-20-1.png)<!-- -->

``` r
scales::show_col(metallica_pal()(10))
```

![](man/figures/README-unnamed-chunk-21-1.png)<!-- -->

## Load

Under-rated

``` r
metalli_palette("load")
```

![](man/figures/README-unnamed-chunk-22-1.png)<!-- -->

``` r
metalli_palette("load10")
```

![](man/figures/README-unnamed-chunk-23-1.png)<!-- -->

## Reload

``` r
metalli_palette("reload")
```

![](man/figures/README-unnamed-chunk-24-1.png)<!-- -->

``` r
metalli_palette("reload10")
```

![](man/figures/README-unnamed-chunk-25-1.png)<!-- -->

## St. Anger

``` r
metalli_palette("anger")
```

![](man/figures/README-unnamed-chunk-26-1.png)<!-- -->

``` r
metalli_palette("anger10")
```

![](man/figures/README-unnamed-chunk-27-1.png)<!-- -->

## Death Magnetic

``` r
metalli_palette("magnetic")
```

![](man/figures/README-unnamed-chunk-28-1.png)<!-- -->

``` r
metalli_palette("magnetic10")
```

![](man/figures/README-unnamed-chunk-29-1.png)<!-- -->

## Hardwired…To Self Destruct

``` r
metalli_palette("hardwired")
```

![](man/figures/README-unnamed-chunk-30-1.png)<!-- -->

``` r
metalli_palette("hardwired10")
```

![](man/figures/README-unnamed-chunk-31-1.png)<!-- -->

## Metal up your palette

``` r
metalli_palette("combo")
```

![](man/figures/README-unnamed-chunk-32-1.png)<!-- -->
