metallicaRt
================

<!-- badges: start -->

[![Travis build
status](https://travis-ci.com/johnmackintosh/metallicaRt.svg?branch=master)](https://travis-ci.com/johnmackintosh/metallicaRt)

![R-CMD-check](https://github.com/johnmackintosh/metallicaRt/workflows/R-CMD-check/badge.svg)

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
metalli_palette("bells")
metalli_palette("orion")
metalli_palette("blackened")
```

<img src="man/figures/README-first4-1.png" width="25%" /><img src="man/figures/README-first4-2.png" width="25%" /><img src="man/figures/README-first4-3.png" width="25%" /><img src="man/figures/README-first4-4.png" width="25%" />

``` r
metalli_palette("roam")
metalli_palette("bleeding")
metalli_palette("fuel")
```

<img src="man/figures/README-roam-1.png" width="33%" /><img src="man/figures/README-roam-2.png" width="33%" /><img src="man/figures/README-roam-3.png" width="33%" />

``` r
metalli_palette("frantic")
metalli_palette("scarred")
metalli_palette("revenge")
```

<img src="man/figures/README-frantic-1.png" width="33%" /><img src="man/figures/README-frantic-2.png" width="33%" /><img src="man/figures/README-frantic-3.png" width="33%" />

## Gimme fuel, gimme fire, longer palettes I desire

OK then.

These contain more album specific colors, but might be of less practical
use for data visualisation purposes.

# Kill ’Em All

``` r
metalli_palette("kill")
scales::show_col(killem_pal()(10), labels = FALSE)
```

<img src="man/figures/README-kill-1.png" width="50%" /><img src="man/figures/README-kill-2.png" width="50%" />

## Ride The Lightning

``` r
metalli_palette("rtl")
scales::show_col(lightning_pal()(10), labels = FALSE)
```

<img src="man/figures/README-rtl-1.png" width="50%" /><img src="man/figures/README-rtl-2.png" width="50%" />

## Master of Puppets

``` r
metalli_palette("puppets")
```

![](man/figures/README-unnamed-chunk-2-1.png)<!-- -->

``` r
scales::show_col(puppets_pal()(10))
```

![](man/figures/README-unnamed-chunk-3-1.png)<!-- -->

## …And Justice For All

``` r
metalli_palette("justice")
```

![](man/figures/README-unnamed-chunk-4-1.png)<!-- -->

``` r
scales::show_col(justice_pal()(10))
```

![](man/figures/README-unnamed-chunk-5-1.png)<!-- -->

## Metallica

How much more black could it be?

``` r
metalli_palette("metallica")
```

![](man/figures/README-unnamed-chunk-6-1.png)<!-- -->

``` r
scales::show_col(metallica_pal()(10))
```

![](man/figures/README-unnamed-chunk-7-1.png)<!-- -->

## Load

Under-rated

``` r
metalli_palette("load")
```

![](man/figures/README-unnamed-chunk-8-1.png)<!-- -->

``` r
scales::show_col(load_pal()(10))
```

![](man/figures/README-unnamed-chunk-9-1.png)<!-- -->

## Reload

``` r
metalli_palette("reload")
```

![](man/figures/README-unnamed-chunk-10-1.png)<!-- -->

``` r
scales::show_col(reload_pal()(10))
```

![](man/figures/README-unnamed-chunk-11-1.png)<!-- -->

## St. Anger

``` r
metalli_palette("anger")
```

![](man/figures/README-unnamed-chunk-12-1.png)<!-- -->

``` r
scales::show_col(anger_pal()(10))
```

![](man/figures/README-unnamed-chunk-13-1.png)<!-- -->

## Death Magnetic

``` r
metalli_palette("magnetic")
```

![](man/figures/README-unnamed-chunk-14-1.png)<!-- -->

``` r
scales::show_col(magnetic_pal()(10))
```

![](man/figures/README-unnamed-chunk-15-1.png)<!-- -->

## Hardwired…To Self Destruct

``` r
metalli_palette("hardwired")
```

![](man/figures/README-unnamed-chunk-16-1.png)<!-- -->

``` r
scales::show_col(hardwired_pal()(10))
```

![](man/figures/README-unnamed-chunk-17-1.png)<!-- -->

## Metal up your palette

``` r
scales::show_col(combo_pal()(10))
```

![](man/figures/README-unnamed-chunk-18-1.png)<!-- -->
