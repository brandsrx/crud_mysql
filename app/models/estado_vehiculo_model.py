from database import db

class EstadoVehiculo:
      def __init__(self,id_estado_vehiculo,nombre_estado,descripcion) -> None:
            self.id_estado_vehiculo = id_estado_vehiculo
            self.nombre_estado = nombre_estado
            self.descripcion = descripcion

      def create(self):
            try:
                  connection = db()
                  cursor = connection.cursor()
                  cursor.execute("""INSERT INTO ESTADO_VEHICULO (IDESTADOVEHICULO,NOMBRE_ESTADO,DESCRIPCION)
                                    VALUES (%s,%s,%s)""",
                                    (
                                          self.id_estado_vehiculo,
                                          self.nombre_estado,
                                          self.descripcion
                                    ))
                  return True
            except Exception as ex:
                  print(f"error:{ex}")
                  return False

      @staticmethod
      def find_by(id):
            connection = db()
            cursor = connection.cursor()
            cursor.execute("""
                              SELECT * FROM ESTADO_VEHICULO
                              WHERE IDESTADOVEHICULO = %s
                              """,(id,))
            x1 = cursor.fetchone()
            print(x1)                 
            estado = EstadoVehiculo(x1[0],x1[1],x1[2])
            return estado

      def update(self,nombre_estado=None,descripcion=None):
            if(nombre_estado is not None):
                  self.nombre_estado = nombre_estado
            if(descripcion is not None):
                  self.descripcion= descripcion
            
            connection = db()
            
            try:
                  cursor = connection.cursor()
                  cursor.execute("""
                              UPDATE  ESTADO_VEHICULO 
                              SET 
                              NOMBRE_ESTADO = %s,
                              DESCRIPCION = %s
                              WHERE IDESTADOVEHICULO = %s
                              """,
                              (
                                    self.nombre_estado,
                                    self.descripcion,
                                    self.id_estado_vehiculo
                              ))
                  connection.commit()
                  return True
            except Exception as ex:
                  print(ex)
                  return False