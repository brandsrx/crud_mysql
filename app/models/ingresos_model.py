from database import db
db_conecction =db()

class TipoCambio():
      def __init__(self,id_tipo_cambio,fecha_tipo_cambio,valor_dolar):
            self.id = id_tipo_cambio
            self.fecha = fecha_tipo_cambio
            self.valor_dolar = valor_dolar

      @staticmethod
      def query(query):
            connection = db()
            cursor = connection.cursor()

            cursor.execute(query)

            return cursor.fetchall()


      def create(self):
            connection = db()
            print(self.id,self.fecha,self.valor_dolar)
            try:
                  with connection.cursor() as cursor:
                        cursor.execute(
                        """
                        INSERT INTO TIPO_CAMBIO (IDTIPOCAMBIO,FECHATIPOCAMBIO,VALORDOLAR) 
                        VALUES (%s,%s,%s)
                        """,
                        (
                              self.id+1,
                              self.fecha,
                              self.valor_dolar
                        )
                        )
                        connection.commit()
                  return True
            except Exception as ex:
                  print("Error al crear la reserva:", ex)
                  return False
            finally:
                  connection.close()

      @staticmethod
      def find_all():
            cursor = db_conecction.cursor()
            cursor.execute("SELECT * FROM VEHICULO")  # Ejemplo de consulta
            lista = []
            for tipo in cursor.fetchall():
                  tipo_cambio = TipoCambio(tipo[0],tipo[1],tipo[2])
                  lista.append(tipo_cambio)
            cursor.close()
            return lista
      @staticmethod
      def find_by(id):
            cursor = db_conecction.cursor()
            cursor.execute(
                  "SELECT * FROM TIPO_CAMBIO where IDTIPOCAMBIO = %s",
                  (id,))  # Ejemplo de consulta
            tipo = cursor.fetchone()
            tipo_cambio = TipoCambio(tipo[0],tipo[1],tipo[2])
            cursor.close()
            return tipo_cambio

      

            
      def update(self,id_tipo_cambio = None,fecha_tipo_cambio = None,valor_dolar=None):
            connection = db()

            if id_tipo_cambio is not None:
                  self.id = id_tipo_cambio
            if fecha_tipo_cambio is not None:
                  self.fecha = fecha_tipo_cambio
            if valor_dolar is not None:
                  self.valor_dolar = valor_dolar

            try:
                  with connection.cursor() as cursor:
                        cursor.execute(
                              """UPDATE vehiculo 
                              SET FECHATIPOCAMBIO = %s,
                                    VALORDOLAR = %s

                              WHERE IDTIPOCAMBIO = %s""",
                              (self.fecha,self.valor_dolar,self.id)
                        )
                        connection.commit()
                  return True
            except Exception as ex:
                  print("Error al actualizar la reserva:", ex)
                  return False
            finally:
                  cursor.close()
      
      @staticmethod
      def delete(id_vehiculo):
            connection = db()
            try:
                  with connection.cursor() as cursor:
                        cursor.execute(
                        "DELETE FROM tipo_cambio WHERE IDTIPOCAMBIO = %s",
                        (id_vehiculo,)
                        )
                        connection.commit()
                  return True
            except Exception as ex:
                  print("Error al eliminar la reserva:", ex)
                  return False
            finally:
                  connection.close()

class Transaccion:
      def __init__(self,id,id_cliente,tipo_transaccion,fecha_transaccion,costo,id_tipo_cambio) -> None:
            self.id = id
            self.id_cliente = id_cliente
            self.transaccion = tipo_transaccion
            self.fecha = fecha_transaccion
            self.costo = costo
            self.id_tipo_cambio = id_tipo_cambio
      
      def create(self):
            connection = db()
            try:
                  with connection.cursor() as cursor:
                        cursor.execute(
                        """
                        INSERT INTO transaccion (idtransaccion,idcliente,tipotransaccion,fechatransaccion,costo,idtipocambio) 
                        VALUES (%s,%s,%s,%s,%s,%s)
                        """,
                        (
                              self.id+1,
                              self.id_cliente,
                              self.transaccion,
                              self.fecha,
                              self.costo,
                              self.id_tipo_cambio
                        )
                        )
                        connection.commit()
                  return True
            except Exception as ex:
                  print("Error al crear la reserva:", ex)
                  return False
            finally:
                  connection.close()
      @staticmethod
      def delete_transaccion(id_transaccion):
            connection = db()
            cursor = connection.cursor()
            cursor.execute("DELETE FROM TRANSACCION WHERE idTransaccion = %s", (id_transaccion,))
            connection.commit()
            cursor.close()
            connection.close()

      @staticmethod
      def find_all():
            cursor = db_conecction.cursor()
            cursor.execute("SELECT * FROM transaccion")  # Ejemplo de consulta
            lista = []
            for transaccion in cursor.fetchall():
                  transaccion_x = Transaccion(transaccion[0],transaccion[1],transaccion[2],transaccion[3],transaccion[4],transaccion[5])
                  lista.append(transaccion_x)
            cursor.close()
            return lista
            
      @staticmethod
      def update_transaccion(id_transaccion, tipo_transaccion, costo, id_tipo_cambio):
            connection = db()
            cursor = connection.cursor()
            cursor.execute("""
                  UPDATE TRANSACCION
                  SET tipoTransaccion = %s, costo = %s, idTipoCambio = %s
                  WHERE idTransaccion = %s
            """, (tipo_transaccion, costo, id_tipo_cambio, id_transaccion))
            connection.commit()
            cursor.close() 
            connection.close()
      @staticmethod
      def query(query):
            connection = db()
            cursor = connection.cursor()

            cursor.execute(query)

            return cursor.fetchall()
