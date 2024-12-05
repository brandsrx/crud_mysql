import pymysql

# Configuración de la conexión
def db():
      try:
            conexion = pymysql.connect(
                        host="localhost",          # Dirección del servidor de MySQL
                        user="root",               # Usuario de la base de datos
                        password="123456",  # Contraseña del usuario
                        database="consecionario" # Nombre de la base de datos
            )
            print("Conexion exitosa")
      except Exception as ex:
            print(f"Error no se pudo conectar : {ex}")
            return None
      return conexion