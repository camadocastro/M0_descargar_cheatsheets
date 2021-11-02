#' ---
#' title: "CheatSheets"
#' subtitle: "Descarga automática"
#' author: "Antonio Vidal"
#' date: "`r format(Sys.time(), '%d/%m/%y - %H:%M:%S')`"
#' output: html_document
#' ---

#' # Objetivo:
#'
#' Descargar de forma automática las cheatsheets
#'
#+ echo=FALSE

# initializacion -------------------------------------------------------------------------------------------------------

rm(list = ls())
setwd(here::here("R"))

# librerias necesarias
pacman::p_load(glue, rmarkdown, tidyverse, tidyselect)

set.seed(1234)

knitr::opts_chunk$set(warning = FALSE, message = FALSE, echo = FALSE, dpi = 180, fig.width = 6, fig.height = 6)

# parametros -----------------------------------------------------------------------------------------------------------

# momento de ejecucion
fecha <- format(x = Sys.time(), format = "%y%m%d%H%M%S")

# funciones ------------------------------------------------------------------------------------------------------------

source(file = "00_utils.R")

# ejecucion ------------------------------------------------------------------------------------------------------------

source(file = "01_descargar_cheatsheets.R")

render(input = "02_listado_cheatsheets.R", 
       output_format = "html_document", 
       output_file = glue("./informes/{fecha}_cheatsheets.html"))
