#' ---
#' title: "CheatSheets"
#' subtitle: "Listado de cheatsheets"
#' author: "Antonio Vidal"
#' date: "`r format(Sys.time(), '%d/%m/%y - %H:%M:%S')`"
#' output: html_document
#' ---

#' # Objetivo:
#'
#' Obtener un listado de todas las cheatsheets descargadas
#'
#+ echo=FALSE

# initializacion -------------------------------------------------------------------------------------------------------

rm(list = ls())
setwd(here::here("R"))

# librerias necesarias
pacman::p_load(openxlsx, knitr, glue, tidyverse, tidyselect)

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

cat(file = stderr(), paste(Sys.time(), "- iniciando ejecucion \n"))

listado_ejecuciones <- list.files(path = dir_salida, include.dirs = TRUE, full.names = TRUE)
ultima_ejecucion <- listado_ejecuciones[length(listado_ejecuciones)]

listado_cheatsheets <- list.files(path = ultima_ejecucion, include.dirs = FALSE, full.names = TRUE)
nombres_cheatsheets <- basename(listado_cheatsheets)

cheatsheets <- tibble(descarga = ultima_ejecucion, nombre = nombres_cheatsheets, file = listado_ejecuciones)

kable(cheatsheets)

rm(listado_cheatsheets, ultima_ejecucion, listado_ejecuciones, nombres_cheatsheets)

# guardar el resultado --------------------------------------------------------------------------------------------

cat(file = stderr(), paste(Sys.time(), "- guardando resultados \n"))

wb <- createWorkbook()
# escribit todos los datos totales
escribir_hoja(datos_escribir = cheatsheets, workbook = wb, nombre_hoja = glue("{nombre_tabla}"))
# excel general
saveWorkbook(wb = wb, 
             file = file.path("informes", glue(fecha, "_{nombre_tabla}.xlsx")),
             overwrite = TRUE)

