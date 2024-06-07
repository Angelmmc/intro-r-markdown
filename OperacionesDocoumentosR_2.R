# Abrir un documento por medio del cuadro de díaloo 

file <- file.choose()

#Leer el archivo csv que esta en la ruta file 

datos <- read.csv(file)

#Muestra la tabla en formato de excel 
View(datos)

#Muestra la estructura de la tabla 
str(datos)

#Cuenta el número de filas de la tabla
nrow(datos)

#Cuenta el número de columnas de la tabla 
ncol(datos)

#Cuenta el número de filas y de columnas 
dim(datos)

#Muestra el nombre de las filas 
rownames(datos)

#Muestra el nombre de las columnas 
colnames(datos)

#Muestra un pequeño resumen de la información que esta en las tablas
summary(datos)

#Es una funcion que permite hacer comparaciones de los valores de una columna 

datos$Aprobado <- ifelse(datos$promedio >= 70, "Aprobado", "Reprobado") 

#Permite graficar 2 valores
plot(
  x=datos$No, 
  y=datos$promedio,
  type="h",
  main = "Grafica de calificaciones por calumno", 
  xlab = "No. alumno",
  ylab = "Promedio"
)

#Abrir la libreria de ggplot 
library(ggplot2)
library(tidyr)

ggplot(datos, aes(x = No, y = promedio)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(title = "Gráfica de Barras Verticales",
       x = "Categorías",
       y = "Valores")

barplot(
  height = datos$promedio,
  names.arg = datos$No,
  xlab = "No. de alumno",
  ylab = "Calificaciones",
  main = "Gráfica de calificaciones",
  col = "blue",
  border = "red"
)

data_long <- pivot_longer(datos, 
                          cols = c(Mat_CalculoIntegral, Mat_ProgramacionOOP, Mat_EstructuraDatos, Mat_AnaliticaDatos, Mat_InteraccionHumanoComputadora), 
                          names_to = "materia", 
                          values_to = "calificacion")


# Crear la gráfica
ggplot(data_long, aes(x = nombreCompleto, y = calificacion, fill = materia)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Calificaciones de los Estudiantes por Materia", 
       x = "Nombre del Estudiante", 
       y = "Calificación") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Girar los nombres de los estudiantes
  scale_fill_brewer(palette = "Set1")
