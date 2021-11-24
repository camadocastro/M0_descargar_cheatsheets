#' ---
#' title: "CheatSheets"
#' subtitle: "Descargar todas las cheatsheets de R"
#' author: "Antonio Vidal"
#' date: "`r format(Sys.time(), '%d/%m/%y - %H:%M:%S')`"
#' output: html_document
#' ---

#' # Objetivoss:
#'
#' Inicializar el entorno de trabajo para el proyecto
#'
#+ echo=FALSE

# initializationnnn -------------------------------------------------------------------------------------------------------

rm(list = ls())
setwd(here::here("R"))

# crear directorios de trabajo
base_dir <- c("./output/", "./informes/")
for (ind_dir in base_dir) {
  if (!dir.exists(ind_dir)) {
    dir.create(ind_dir)
  }
}
rm(base_dir, ind_dir)


# instalar librerias
if ("pacman" %in% rownames(installed.packages()) == FALSE) {
  install.packages("pacman")
}

pacman::p_load(openxlsx, cheatsheet, glue, tidyverse, tidyselect)
