---
title: "Introduction to brainstorm"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Introduction to brainstorm}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---




# About

The `brainstorm` package houses  personal utility functions which I reuse in my R scripts. Please see some examples below.


```r

library(brainstorm)
```


# Excel Visualization

The `brainstorm` package contains my default settings for efficiently plotting tables in Excel worksheets (using the `openxlsx` package). In the following example, we consider the classic `iris` dataset using the `add_worksheet()` function, which itself depends upon several subfunctions. If the user desires finer control, these subfunctions could be called individually and in succession, and the default values for each of the arguments could thereby be modified.


```r

# load package
library(openxlsx)

# create workbook
wb = createWorkbook()
sheet = "Iris Data"

# call function
add_worksheet(wb, sheet, iris)

# save workbook
saveWorkbook(wb, "Iris Data.xlsx", overwrite = TRUE)
```

The resulting example file can be downloaded below.

`<a href="data:application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;base64,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" download="Iris Data.xlsx">Download Iris Data.xlsx</a>`{=html}


# Markdown Functions

`show_table()` is a utility function to show interactive tables within a markdown document, as shown below.


```r

# show table
show_table(iris, height = "150px")
```

<div style="border: 1px solid #ddd; padding: 0px; margin-bottom: 1.2em;overflow-y: scroll; height:150px; overflow-x: scroll; width:100%; "><table class="table table-striped table-bordered table-hover table-responsive" style="font-size: 12px; margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:center;position: sticky; top:0; background-color: #159957;"> Sepal.Length </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #159957;"> Sepal.Width </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #159957;"> Petal.Length </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #159957;"> Petal.Width </th>
   <th style="text-align:center;position: sticky; top:0; background-color: #159957;"> Species </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 3.5 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.9 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.7 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.6 </td>
   <td style="text-align:center;"> 3.1 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 3.6 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.4 </td>
   <td style="text-align:center;"> 3.9 </td>
   <td style="text-align:center;"> 1.7 </td>
   <td style="text-align:center;"> 0.4 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.6 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.3 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.4 </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.9 </td>
   <td style="text-align:center;"> 3.1 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.1 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.4 </td>
   <td style="text-align:center;"> 3.7 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.8 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 1.6 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.8 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.1 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.3 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 1.1 </td>
   <td style="text-align:center;"> 0.1 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.8 </td>
   <td style="text-align:center;"> 4.0 </td>
   <td style="text-align:center;"> 1.2 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.7 </td>
   <td style="text-align:center;"> 4.4 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.4 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.4 </td>
   <td style="text-align:center;"> 3.9 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> 0.4 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 3.5 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.3 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.7 </td>
   <td style="text-align:center;"> 3.8 </td>
   <td style="text-align:center;"> 1.7 </td>
   <td style="text-align:center;"> 0.3 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 3.8 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.3 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.4 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 1.7 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 3.7 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.4 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.6 </td>
   <td style="text-align:center;"> 3.6 </td>
   <td style="text-align:center;"> 1.0 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 3.3 </td>
   <td style="text-align:center;"> 1.7 </td>
   <td style="text-align:center;"> 0.5 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.8 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 1.9 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 1.6 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 1.6 </td>
   <td style="text-align:center;"> 0.4 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.2 </td>
   <td style="text-align:center;"> 3.5 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.2 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.7 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 1.6 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.8 </td>
   <td style="text-align:center;"> 3.1 </td>
   <td style="text-align:center;"> 1.6 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.4 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.4 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.2 </td>
   <td style="text-align:center;"> 4.1 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.1 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.5 </td>
   <td style="text-align:center;"> 4.2 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.9 </td>
   <td style="text-align:center;"> 3.1 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 1.2 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.5 </td>
   <td style="text-align:center;"> 3.5 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.9 </td>
   <td style="text-align:center;"> 3.6 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.1 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.4 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 3.5 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> 0.3 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.5 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> 0.3 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.4 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 3.5 </td>
   <td style="text-align:center;"> 1.6 </td>
   <td style="text-align:center;"> 0.6 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 3.8 </td>
   <td style="text-align:center;"> 1.9 </td>
   <td style="text-align:center;"> 0.4 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.8 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.3 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 3.8 </td>
   <td style="text-align:center;"> 1.6 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.6 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.3 </td>
   <td style="text-align:center;"> 3.7 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 3.3 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> 0.2 </td>
   <td style="text-align:center;"> setosa </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.0 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 4.7 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.4 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 4.5 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.9 </td>
   <td style="text-align:center;"> 3.1 </td>
   <td style="text-align:center;"> 4.9 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.5 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> 4.0 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.5 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 4.6 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.7 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 4.5 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.3 </td>
   <td style="text-align:center;"> 3.3 </td>
   <td style="text-align:center;"> 4.7 </td>
   <td style="text-align:center;"> 1.6 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.9 </td>
   <td style="text-align:center;"> 2.4 </td>
   <td style="text-align:center;"> 3.3 </td>
   <td style="text-align:center;"> 1.0 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.6 </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 4.6 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.2 </td>
   <td style="text-align:center;"> 2.7 </td>
   <td style="text-align:center;"> 3.9 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 2.0 </td>
   <td style="text-align:center;"> 3.5 </td>
   <td style="text-align:center;"> 1.0 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.9 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 4.2 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.0 </td>
   <td style="text-align:center;"> 2.2 </td>
   <td style="text-align:center;"> 4.0 </td>
   <td style="text-align:center;"> 1.0 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.1 </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 4.7 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 3.6 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.7 </td>
   <td style="text-align:center;"> 3.1 </td>
   <td style="text-align:center;"> 4.4 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 4.5 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.8 </td>
   <td style="text-align:center;"> 2.7 </td>
   <td style="text-align:center;"> 4.1 </td>
   <td style="text-align:center;"> 1.0 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.2 </td>
   <td style="text-align:center;"> 2.2 </td>
   <td style="text-align:center;"> 4.5 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> 3.9 </td>
   <td style="text-align:center;"> 1.1 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.9 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 4.8 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.1 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 4.0 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.3 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> 4.9 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.1 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 4.7 </td>
   <td style="text-align:center;"> 1.2 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.4 </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 4.3 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.6 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 4.4 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.8 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 4.8 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.7 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 1.7 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.0 </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 4.5 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.7 </td>
   <td style="text-align:center;"> 2.6 </td>
   <td style="text-align:center;"> 3.5 </td>
   <td style="text-align:center;"> 1.0 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.5 </td>
   <td style="text-align:center;"> 2.4 </td>
   <td style="text-align:center;"> 3.8 </td>
   <td style="text-align:center;"> 1.1 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.5 </td>
   <td style="text-align:center;"> 2.4 </td>
   <td style="text-align:center;"> 3.7 </td>
   <td style="text-align:center;"> 1.0 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.8 </td>
   <td style="text-align:center;"> 2.7 </td>
   <td style="text-align:center;"> 3.9 </td>
   <td style="text-align:center;"> 1.2 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.0 </td>
   <td style="text-align:center;"> 2.7 </td>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 1.6 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.4 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 4.5 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.0 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 4.5 </td>
   <td style="text-align:center;"> 1.6 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.7 </td>
   <td style="text-align:center;"> 3.1 </td>
   <td style="text-align:center;"> 4.7 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.3 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> 4.4 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 4.1 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.5 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> 4.0 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.5 </td>
   <td style="text-align:center;"> 2.6 </td>
   <td style="text-align:center;"> 4.4 </td>
   <td style="text-align:center;"> 1.2 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.1 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 4.6 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.8 </td>
   <td style="text-align:center;"> 2.6 </td>
   <td style="text-align:center;"> 4.0 </td>
   <td style="text-align:center;"> 1.2 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> 3.3 </td>
   <td style="text-align:center;"> 1.0 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 2.7 </td>
   <td style="text-align:center;"> 4.2 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.7 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 4.2 </td>
   <td style="text-align:center;"> 1.2 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.7 </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 4.2 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.2 </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 4.3 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 1.1 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.7 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 4.1 </td>
   <td style="text-align:center;"> 1.3 </td>
   <td style="text-align:center;"> versicolor </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.3 </td>
   <td style="text-align:center;"> 3.3 </td>
   <td style="text-align:center;"> 6.0 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.8 </td>
   <td style="text-align:center;"> 2.7 </td>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 1.9 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.1 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 5.9 </td>
   <td style="text-align:center;"> 2.1 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.3 </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.5 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 5.8 </td>
   <td style="text-align:center;"> 2.2 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.6 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 6.6 </td>
   <td style="text-align:center;"> 2.1 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 4.9 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> 4.5 </td>
   <td style="text-align:center;"> 1.7 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.3 </td>
   <td style="text-align:center;"> 2.9 </td>
   <td style="text-align:center;"> 6.3 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.7 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> 5.8 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.2 </td>
   <td style="text-align:center;"> 3.6 </td>
   <td style="text-align:center;"> 6.1 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.5 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 2.0 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.4 </td>
   <td style="text-align:center;"> 2.7 </td>
   <td style="text-align:center;"> 5.3 </td>
   <td style="text-align:center;"> 1.9 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.8 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 5.5 </td>
   <td style="text-align:center;"> 2.1 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.7 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 2.0 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.8 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 2.4 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.4 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 5.3 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.5 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 5.5 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.7 </td>
   <td style="text-align:center;"> 3.8 </td>
   <td style="text-align:center;"> 6.7 </td>
   <td style="text-align:center;"> 2.2 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.7 </td>
   <td style="text-align:center;"> 2.6 </td>
   <td style="text-align:center;"> 6.9 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.0 </td>
   <td style="text-align:center;"> 2.2 </td>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.9 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 5.7 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 4.9 </td>
   <td style="text-align:center;"> 2.0 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.7 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 6.7 </td>
   <td style="text-align:center;"> 2.0 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.3 </td>
   <td style="text-align:center;"> 2.7 </td>
   <td style="text-align:center;"> 4.9 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.7 </td>
   <td style="text-align:center;"> 3.3 </td>
   <td style="text-align:center;"> 5.7 </td>
   <td style="text-align:center;"> 2.1 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.2 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 6.0 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.2 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 4.8 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.1 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 4.9 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.4 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 2.1 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.2 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 5.8 </td>
   <td style="text-align:center;"> 1.6 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.4 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 6.1 </td>
   <td style="text-align:center;"> 1.9 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.9 </td>
   <td style="text-align:center;"> 3.8 </td>
   <td style="text-align:center;"> 6.4 </td>
   <td style="text-align:center;"> 2.0 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.4 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 2.2 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.3 </td>
   <td style="text-align:center;"> 2.8 </td>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 1.5 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.1 </td>
   <td style="text-align:center;"> 2.6 </td>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 1.4 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 7.7 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 6.1 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.3 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 2.4 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.4 </td>
   <td style="text-align:center;"> 3.1 </td>
   <td style="text-align:center;"> 5.5 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.0 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 4.8 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.9 </td>
   <td style="text-align:center;"> 3.1 </td>
   <td style="text-align:center;"> 5.4 </td>
   <td style="text-align:center;"> 2.1 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.7 </td>
   <td style="text-align:center;"> 3.1 </td>
   <td style="text-align:center;"> 5.6 </td>
   <td style="text-align:center;"> 2.4 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.9 </td>
   <td style="text-align:center;"> 3.1 </td>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.8 </td>
   <td style="text-align:center;"> 2.7 </td>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 1.9 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.8 </td>
   <td style="text-align:center;"> 3.2 </td>
   <td style="text-align:center;"> 5.9 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.7 </td>
   <td style="text-align:center;"> 3.3 </td>
   <td style="text-align:center;"> 5.7 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.7 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 5.2 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.3 </td>
   <td style="text-align:center;"> 2.5 </td>
   <td style="text-align:center;"> 5.0 </td>
   <td style="text-align:center;"> 1.9 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.5 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 5.2 </td>
   <td style="text-align:center;"> 2.0 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 6.2 </td>
   <td style="text-align:center;"> 3.4 </td>
   <td style="text-align:center;"> 5.4 </td>
   <td style="text-align:center;"> 2.3 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
  <tr>
   <td style="text-align:center;"> 5.9 </td>
   <td style="text-align:center;"> 3.0 </td>
   <td style="text-align:center;"> 5.1 </td>
   <td style="text-align:center;"> 1.8 </td>
   <td style="text-align:center;"> virginica </td>
  </tr>
</tbody>
</table></div>

Further, inspired by [this GitHub issue](https://github.com/yixuan/prettydoc/issues/30), the repository for this package contains my custom CSS file for the R Markdown `cayman` theme in [`prettydoc`](https://github.com/yixuan/prettydoc), available for download below.

`<a href="data:text/css;base64,LyogQ09ERSBPVVRQVVQgKi8KCmRpdi5zb3VyY2VDb2RlIHsKICBtYXJnaW4tYm90dG9tOiAwOwp9CgpkaXYuc291cmNlQ29kZSB+IHByZSB7CiAgbWFyZ2luLWJvdHRvbTogMS4yZW07CiAgYmFja2dyb3VuZC1jb2xvcjogd2hpdGU7CiAgZm9udC1zaXplOiAwLjdlbTsKfQoKCi8qIFRBQkxFIE9GIENPTlRFTlRTICovCgpkaXYudG9jLWJveCB7CiAgbWFyZ2luLXRvcDogMXJlbTsKfQoKZGl2LnRvYzo6YmVmb3JlIHsKICBjb250ZW50OiAiVGFibGUgb2YgQ29udGVudHMiOwogIG1hcmdpbi10b3A6IDJyZW07CiAgZm9udC13ZWlnaHQ6IDQwMDsKICBjb2xvcjogIzE1OTk1NzsKICBmb250LXNpemU6IDEuNWVtOwp9CgpkaXYudG9jIHsKICBwYWRkaW5nLXRvcDogNHJlbTsKfQoKCi8qIEgxIEhFQURFUiAqLwoKaDEgewogIHBhZGRpbmctdG9wOiAycmVtOwp9CgojZGVwZW5kZW5jaWVzIGgxIHsKICBwYWRkaW5nLXRvcDogMC4ycmVtOwp9CgoKLyogU1VCVElUTEUgKi8KCmgzLnByb2plY3QtdGFnbGluZSB7CiAgbWFyZ2luLXRvcDogMHJlbTsKICBwYWRkaW5nLWJvdHRvbTogMS41cmVtOwp9" download="custom.css">Download custom.css</a>`{=html}
