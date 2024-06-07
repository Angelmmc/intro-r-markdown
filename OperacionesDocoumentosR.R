# Establecer la semilla para reproducibilidad

?set.seed(986)

# Número de alumnos

num_alumnos <- 60

# Generar nombres aleatorios para los alumnos

nombres <- sample(c("Juan", "María", "Pedro", "Luis", "Ana", "Sofía","Adriel","Alberto","Jacinto"), num_alumnos, replace = TRUE)

apellidos <- sample(c("González", "Martínez", "López", "Rodríguez", "Pérez", "García", "López", "Peréz", "Aguilar", "Reyes"), num_alumnos, replace = TRUE)


# Generar las calificaciones aleatorias

calculo_integral <- round(runif(num_alumnos, min = 60, max = 100), 1)

#Visualiza el contenido de la variable calculo_integral en formato tabular 

View(calculo_integral)

#Genera un vector de calificaciones en base al numero de alumnos entre 60 y 100 

programacion_oop <- round(runif(num_alumnos, min = 60, max = 100), 1)

estructura_datos <- round(runif(num_alumnos, min = 60, max = 100), 1)

analitica_datos <- round(runif(num_alumnos, min = 60, max = 100), 1)

ihc <- round(runif(num_alumnos, min = 60, max = 100), 1)


# Crear el data frame

df <- data.frame(
  
  No = 1:num_alumnos, #Asigna numeros del 1 al numero de alumnos que es 45 
  
  NombreAlumno = nombres,
  
  ApellidoAlumno = apellidos,
  
  Mat_CalculoIntegral = calculo_integral,
  
  Mat_ProgramacionOOP = programacion_oop,
  
  Mat_EstructuraDatos = estructura_datos,
  
  Mat_AnaliticaDatos = analitica_datos,
  
  Mat_InteraccionHumanoComputadora = ihc
  
)

#Ver data frame en formato de tabla

View(df)

#Ver velores de la columna CnombreAlumno

View(df$NombreAlumno)

#Crea el cmapo nombre completo con la concatenación de nombre y apellido 

df$nombreCompleto <- paste(df$NombreAlumno, df$ApellidoAlumno)

#Permite ver el nombre de las columnas de un data frame

names(df)

#Busca nombres de columnas que comienzan con Mat

colcal <- grep("^Mat_",names(df),value = TRUE)

#Calcula el promedio de de las columnas en colcal na.rm significa que elimina vacios

df$promedio <-rowMeans(df[colcal], na.rm = TRUE)

# Guardar el data frame en un archivo CSV

write.csv(df, "calificaciones_alumnos.csv", row.names = FALSE)

