import pymysql

def db():
      try:
            conexion = pymysql.connect(
                        host="localhost",          
                        user="root",               
                        password="123456",  
                        database="consecionario" 
            )
            print("Conexion exitosa")
      except Exception as ex:
            print(f"Error no se pudo conectar : {ex}")
            return None
      return conexion