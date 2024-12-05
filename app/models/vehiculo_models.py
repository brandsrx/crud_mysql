from database import db
from .estado_vehiculo_model import EstadoVehiculo
from .marca import Marca
db_conecction =db()

class Vehiculo():
      def __init__(self,id_vehiculo,anio,modelo,precio_diario,precio_dolar,caracteristicas,id_estado_vehiculo,id_marca):
            self.id_vehiculo = id_vehiculo
            self.anio = anio
            self.modelo = modelo
            self.precio_diario = precio_diario
            self.precio_dolar = precio_dolar
            self.caracteristicas = caracteristicas
            self.id_estado_vehiculo = id_estado_vehiculo
            self.id_marca = id_marca
      def create(self):
            connection = db()
            try:
                  with connection.cursor() as cursor:
                        cursor.execute(
                        """
                        INSERT INTO VEHICULO (idVehiculo, anio, modelo, precioDiario, precioDolar, caracteristicas, idEstadoVehiculo, idMarca) 
                        VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                        """,
                        (
                              self.id_vehiculo,
                              self.anio,
                              self.modelo,
                              self.precio_diario,
                              self.precio_dolar,
                              self.caracteristicas,
                              self.id_estado_vehiculo,
                              self.id_marca
                        )
                        )
                        connection.commit()
                  return True  # Retorna True si todo se ejecutó correctamente
            except Exception as ex:
                  print("Error al crear el vehículo:", ex)
                  return False  # Retorna False en caso de error
            finally:
                  cursor.close()
      @staticmethod
      def find_all():
            try:
                  connection = db()  # Obtener la conexión
                  with connection.cursor() as cursor:
                        cursor.execute("SELECT * FROM VEHICULO")
                        vehiculos = cursor.fetchall()
                        list_vehiculo = []
                        for vh in vehiculos:
                              vehiculo = Vehiculo(vh[0], vh[1], vh[2], vh[3], vh[4], vh[5], vh[6], vh[7])
                              list_vehiculo.append(vehiculo)
                  return list_vehiculo
            except Exception as ex:
                  print("Error al obtener los vehículos:", ex)
            finally:
                  connection.close()

      @staticmethod
      def find_by(id):
            cursor = db_conecction.cursor()
            cursor.execute(
                  "SELECT * FROM VEHICULO where idVehiculo = %s",
                  (id,))  # Ejemplo de consulta
            reservas = cursor.fetchone()
            vehiculo = Vehiculo(reservas[0],reservas[1],reservas[2],reservas[3],reservas[4],reservas[5],reservas[6],reservas[7])
            cursor.close()
            return vehiculo

      @staticmethod
      def detail(id):
            cursor = db_conecction.cursor()
            cursor.execute(
                  """
                        select vh.*,ev.nombre_estado as estado,ev.descripcion,m.nombremarca,m.descripcion,m.paismarca from vehiculo vh
                        inner join estado_vehiculo ev on vh.idestadovehiculo = ev.idestadovehiculo
                        inner join marca m on vh.idmarca = m.idmarca 
                        where idvehiculo = %s
                  """,
                  (id,)
            )
            vehiculo_one = cursor.fetchone()
            
            vehiculo = Vehiculo(vehiculo_one[0],vehiculo_one[1],vehiculo_one[2],vehiculo_one[3],vehiculo_one[4],vehiculo_one[5],vehiculo_one[6],vehiculo_one[7])
            estado_vehiculo = EstadoVehiculo(vehiculo.id_estado_vehiculo,vehiculo_one[8],vehiculo_one[9])
            marca = Marca(vehiculo.id_marca,vehiculo_one[10],vehiculo_one[11],vehiculo_one[12])

            cursor.close()
            return [vehiculo,estado_vehiculo,marca]

      @staticmethod
      def vehiculo_disponible():
            connectiond = db()
            cursor = connectiond.cursor()
            cursor.execute("""
                              SELECT 
                                    VH.*,
                                    ev.nombre_estado as estado,
                                    ev.descripcion
                              FROM VEHICULO VH
                              INNER JOIN ESTADO_VEHICULO EV ON 
                              VH.IDESTADOVEHICULO = EV.IDESTADOVEHICULO and
                              lower(ev.nombre_estado) like 'disponible'
                              """)
            vehiculo_ones = cursor.fetchall()
            list_vh = []
            for vehiculo_one in vehiculo_ones:
                  vehiculo = Vehiculo(vehiculo_one[0],vehiculo_one[1],vehiculo_one[2],vehiculo_one[3],vehiculo_one[4],vehiculo_one[5],vehiculo_one[6],vehiculo_one[7])
                  estado_vehiculo = EstadoVehiculo(vehiculo.id_estado_vehiculo,vehiculo_one[8],vehiculo_one[9])
                  list_vh.append([vehiculo,estado_vehiculo])
            cursor.close()
            
            return list_vh
            
      def update(self,anio = None,modelo = None,precio_diario=None,precio_dolar=None,caracteristicas=None):
            """Actualiza un registro en la tabla reserva."""
            connection = db()

            if(anio is not None):
                  self.anio = anio
            if modelo is not None:
                  self.modelo = modelo
            if precio_diario is not None:
                  self.precio_diario = precio_diario
            if precio_dolar is not None:
                  self.precio_dolar = precio_dolar
            if caracteristicas is not None:
                  self.caracteristicas = caracteristicas

            if connection:
                  try:
                        with connection.cursor() as cursor:
                              cursor.execute(
                                    """UPDATE vehiculo 
                                    SET anio = %s, 
                                          modelo = %s, 
                                          precioDiario = %s,
                                          precioDolar = %s,
                                          caracteristicas = %s
                                    WHERE IDVEHICULO = %s""",
                                    (
                                          self.anio,
                                          self.modelo,
                                          self.precio_diario,
                                          self.precio_dolar,
                                          self.caracteristicas,
                                          self.id_vehiculo
                                    )
                              )
                              connection.commit()
                  except Exception as ex:
                        print("Error al actualizar la reserva:", ex)
                  finally:
                        connection.close()
      def to_string(self):
            print(self.id_vehiculo,self.anio,self.modelo,self.precio_diario,self.precio_dolar,self.caracteristicas,self.id_estado_vehiculo,self.id_marca)
      @staticmethod
      def find_all_ids():
            connection = db()
            try:
                  with connection.cursor() as cursor:
                        cursor.execute("SELECT idVehiculo FROM VEHICULO")
                        vehiculo_ids = cursor.fetchall()
                        return [row[0] for row in vehiculo_ids]
            finally:
                  connection.close()
      @staticmethod
      def seguimient():
            seguimiento = None
            try:
                  connection = db()
                  cursor = connection.cursor()
                  cursor.execute("SELECT * FROM SEGUIMIENTO_VEHICULO")
                  lista =[]
                  for seg in cursor.fetchall():
                        lista.append({
                              'id':seg[0],
                              'id_vehiculo':seg[1],
                              'ubicacion_actual':seg[2],
                              'ultima_fecha':seg[3]
                        })
                  seguimiento = lista
            except Exception as ex:
                  print(ex)
            return seguimiento
      
      @staticmethod
      def delete(id_vehiculo):
            connection = db()
            try:
                  with connection.cursor() as cursor:
                        cursor.execute(
                        "DELETE FROM VEHICULO WHERE IDVEHICULO = %s",
                        (id_vehiculo,)
                        )
                        connection.commit()
            except Exception as ex:
                  print("Error al eliminar la reserva:", ex)
            finally:
                  connection.close()

                  