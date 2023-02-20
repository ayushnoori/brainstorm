# brainstorm: Personal Utility Functions <img src='man/figures/logo.png' align="right" height="139" />

The `brainstorm` package houses personal utility functions which I reuse in my R scripts. Please note that this package remains under development.

## Installation

`brainstorm` is designed for the [R](https://www.r-project.org/) programming language and statistical computing environment. To install the latest version of this package, please run the following line in your R console:

```{r}
devtools::install_github("ayushnoori/brainstorm")
```

## Build Documentation

The documentation for `brainstorm` is built using the `roxygen2` package. To build the documentation, run:

```{r}
roxygen2::roxygenise()
```

## Build Website

The website for `brainstorm` is built using the `pkgdown` package. To compile and render the website, run:

```{r}
pkgdown::build_site()
```

## Author

This package was developed by [Ayush Noori](mailto:anoori1@mgh.harvard.edu).