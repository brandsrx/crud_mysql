import mysql.connector

# Establecer la conexión con la base de datos
connection = mysql.connector.connect(
    host="localhost",          # Dirección del servidor de MySQL
    user="root",               # Usuario de la base de datos
    password="123456",  # Contraseña del usuario
    database="consecionario" # Nombre de la base de datos
)

# Crear un cursor para ejecutar las consultas
cursor = connection.cursor()

# Realizar una consulta
cursor.execute("SELECT * FROM tu_tabla")

# Obtener los resultados de la consulta
results = cursor.fetchall()

# Imprimir los resultados
for row in results:
    print(row)

# Cerrar la conexión
cursor.close()
connection.close()
