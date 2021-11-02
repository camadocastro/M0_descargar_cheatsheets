#' ---
#' title: "CheatSheets"
#' subtitle: "Descargar todas las cheatsheets de R"
#' author: "Antonio Vidal"
#' date: "`r format(Sys.time(), '%d/%m/%y - %H:%M:%S')`"
#' output: html_document
#' ---

#' # Objetivo:
#'
#' Descargar todas las cheatsheets de R
#' 
#' Para descargarlo se usa la librería [cheatsheet](https://bradlindblad.github.io/cheatsheet/)
#'
#+ echo=FALSE

# initializacion -------------------------------------------------------------------------------------------------------

rm(list = ls())
setwd(here::here("R"))

# librerias necesarias
pacman::p_load(openxlsx, cheatsheet, glue, tidyverse, tidyselect)

set.seed(1234)

knitr::opts_chunk$set(list(warning = FALSE, message = FALSE, echo = FALSE, dpi = 180, fig.width = 6, fig.height = 6))

# parametros -----------------------------------------------------------------------------------------------------------

# momento de ejecucion
fecha <- format(x = Sys.time(), format = "%y%m%d%H%M%S")

nombre_tabla <- "cheatsheets"
dir_salida <- "output"

# funciones ------------------------------------------------------------------------------------------------------------

source(file = "00_utils.R")

# ejecucion ------------------------------------------------------------------------------------------------------------

cat(file = stderr(), paste(Sys.time(), "- iniciando descarga \n"))

get_all_cheatsheets(local_path = glue("{dir_salida}/{fecha}"), tidyverse_only = TRUE)

