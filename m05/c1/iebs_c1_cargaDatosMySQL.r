######################################################
# IEBS 008 BIG DATA ALMACENAMIENTO                   #
# CLASE 1: SISTEMAS SQL                              #
# AUTOR: JUAN JOSE SILVA                             # 
#                                                    #
# DESCRIPCION:                                       #
#                                                    #
# EN ESTA PRÁCTICA VAMOS A CONECTAR R CON MYSQL      #
# CARGAR DATOS EN LA TABLA Y REALIZAR ALGUNAS        #
# CONSULTAS                                          #
######################################################


# SE CARGAN PAQUETES NECESARIOS PARA LA CORRECTA EJECUCION DEL SCRIPT
require(data.table)
require(RMySQL)


# SE ESTABLECE CONEXION CON LA BBDD
conn = dbConnect(MySQL()
                 ,user = 'jjsilvat'      # Usuario de la BBDD con el que se desea acceder
                 ,password = 'iebs8501'  # Contraseña del usuario
                 ,host = '34.91.253.241'      # IP o host del la BBDD                         
                 ,dbname = 'iebsAlumni'    # Nombre de la BBDD a la que queremos acceder. Por ejemplo: 'iebsAlumni'
) 

dbExecute(conn,'SET NAMES utf8')

summary(conn)

# SI LA CONEXIÓN ES OK DEBE APARECER EN PANTALLA ALGO SIMILAR A:
# <MySQLConnection:0,0>
# User:   jjsilvat 
# Host:   34.91.253.241 
# Dbname: iebsAlumni 
# Connection type: 34.91.253.241 via TCP/IP 


folder = '/home/jjsilvat/data/'  # CARPETA EN LA QUE SE ENCUENTRA EL FICHERO, POR EJEMPLO: '/home/jjsilvat/data/'

###################################
# TAREA 1 - CARGA DEL TRAFICO WEB #
###################################

fileName = 'iebs008_kpis.csv'    # NOMBRE DEL FICHERO
table = 'kpi'                    # TABLA DONDE SE VA A ALMACENAR EL KPI


traficoWeb = data.table(read.csv(paste0(folder,fileName)
                                 ,header = T
                                 ,sep = ';'
                                 )
                        )

# LA LONGITUD DEL FICHERO QUE VAMOS A CARGAR ES 267840
nrow(traficoWeb)

# CARGA DEL FICHERO EN BASE DE DATOS
dbWriteTable(conn
             ,table
             ,traficoWeb
             ,append = T
             ,row.names = FALSE)

# SI LA CARGA HA IDO CORRECTAMENTE, EL NUMERO DE FILAS CARGADAS 
# DEBE COINCIDIR CON LA LONGITUD DEL FICHERO QUE HEMOS CARGADO
resultado = dbGetQuery(conn
                       ,'SELECT COUNT(*) AS NUMERO_FILAS FROM kpi')

print(resultado)

# EJECUCION DE ALGUNAS QUERIES:

# 1 - ¿QUE DISPOSITIVO ES EL LIDER EN VISITAS?
query = paste0('SELECT DISPOSITIVO, SUM(VISITAS) AS VISITAS_TOTALES FROM '
               ,table
               ,' GROUP BY 1 ORDER BY 2 DESC')

print(query)

resultado = dbGetQuery(conn,
                       query)


# ¿QUE DISPOSITIVO GENERA MAS UNIDADES VENTAS? ¿Y MAS IMPORTE?
query = paste0('SELECT DISPOSITIVO, SUM(UNIDADES_VENDIDAS) AS VENTAS, SUM(IMPORTE) AS IMPORTE FROM '
               ,table
               ,' GROUP BY 1 ORDER BY 2 DESC')

print(query)


resultado = dbGetQuery(conn,query)
print(resultado)


############################################
# TAREA 2 - CARGA DEL PLAN DE MEDIOS DE TV #
############################################

fileName = 'iebs008_planMediosTV.csv'
table = 'plan_medios_tv'

planMediosTV = data.table(read.csv(paste0(folder,fileName)
                                   ,header = T
                                   ,sep = ';'
                                   )
                          )

# NUMERO DE FILAS DEL FICHERO
nrow(planMediosTV)


# CARGA DEL FICHERO EN BASE DE DATOS
dbWriteTable(conn
             ,table
             ,planMediosTV
             ,append = T
             ,row.names = FALSE)


# SI LA CARGA HA IDO CORRECTAMENTE, EL NUMERO DE FILAS CARGADAS 
# DEBE COINCIDIR CON LA LONGITUD DEL FICHERO QUE HEMOS CARGADO
resultado = dbGetQuery(conn
                       ,paste0('SELECT COUNT(*) AS NUMERO_FILAS FROM ',table))

print(resultado)



############################################
# TAREA 3 - CARGA DEL PLAN DE MEDIOS DE RD #
############################################

fileName = 'iebs008_planMediosRD.csv'
table = 'plan_medios_rd'

planMediosRD = data.table(read.csv(paste0(folder,fileName)
                                   ,header = T
                                   ,sep = ';'
                                   ,encoding = 'UTF-8'))


# NUMERO DE FILAS DEL FICHERO
nrow(planMediosRD)


# CARGA DEL FICHERO EN BASE DE DATOS
dbWriteTable(conn
             ,table
             ,planMediosRD
             ,append = F
             ,overwrite = T
             ,row.names = FALSE)

# SI LA CARGA HA IDO CORRECTAMENTE, EL NUMERO DE FILAS CARGADAS 
# DEBE COINCIDIR CON LA LONGITUD DEL FICHERO QUE HEMOS CARGADO
resultado = dbGetQuery(conn
                       ,paste0('SELECT COUNT(*) AS NUMERO_FILAS FROM ',table))

print(resultado)


#############################################
# TAREA 4 - CARGA DEL PLAN DE MEDIOS DE SEM #
#############################################

fileName = 'iebs008_planMediosSEM.csv'
table = 'sem'

planMediosSEM = data.table(read.csv(paste0(folder,fileName)
                                       ,header = T
                                       ,sep = ';'
                                       ,encoding = 'UTF-8'))


# NUMERO DE FILAS DEL FICHERO
nrow(planMediosSEM)


# CARGA DEL FICHERO EN BASE DE DATOS
dbWriteTable(conn
             ,table
             ,planMediosSocial
             ,append = T
             #,overwrite = T
             ,row.names = FALSE)

# COMPRUEBE QUE EL NUMERO DE FILAS CARGADAS COINCIDE CON EL NUMERO DE FILAS DEL 
# FICHERO

resultado = # COMPLETAR POR EL ALUMNO (1 LINEA DE CODIGO)
print(resultado) # DEBE SALIR 72566

################################################
# TAREA 5 - CARGA DEL PLAN DE MEDIOS DE SOCIAL #
################################################
fileName = 'iebs008_planMediosSocial.csv'
table = 'social'

planMediosSocial = data.table(read.csv(paste0(folder,fileName)
                                       ,header = T
                                       ,sep = ';'
                                       ,encoding = 'UTF-8'))

# NUMERO DE FILAS DEL FICHERO
nrow(planMediosSocial)


# CARGA DEL FICHERO EN BASE DE DATOS
dbWriteTable(conn
             ,table
             ,planMediosSocial
             ,append = T
             #,overwrite = T
             ,row.names = FALSE)


# COMPRUEBE QUE EL NUMERO DE FILAS CARGADAS COINCIDE CON EL NUMERO DE FILAS DEL 
# FICHERO

resultado = # COMPLETAR POR EL ALUMNO (1 LINEA DE CODIGO)
print(resultado) # DEBE SALIR 32457



# SE CIERRA LA CONEXION CON LA BBDD
dbDisconnect(conn)
