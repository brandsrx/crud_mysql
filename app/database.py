import cx_Oracle

def db():
      try:
            db_connection = cx_Oracle.connect(
                  user="DB_CONSECIONARIO2",
                  password="123",
                  dsn="localhost:1521/xe",
                  encoding='UTF-8'
            )     
            print('Coneccion exitosa a la base de datos')
            return db_connection
      except Exception as ex:
            print(ex)
