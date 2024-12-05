from database import db
db_conecction = db()

class Reserva():
      def create_reserva(id_reserva,id_cliente,id_empleado,fecha_inicio,fecha_fin,contrato):
            connection = db()
            try:
                  with connection.cursor() as cursor:
                        cursor.execute(
                        """
                        INSERT INTO RESERVA (idReserva, idCliente, idEmpleado, fechaInicio, fechaFin, contrato) 
                        VALUES (%s,%s,%s,%s,%s,%s)
                        """,
                        (id_reserva,id_cliente,id_empleado,fecha_inicio,fecha_fin,contrato)
                        )
                        connection.commit()
            except Exception as ex:
                  print("Error al crear la reserva:", ex)
            finally:
                  connection.close()
      def find_all():
            cursor = db_conecction.cursor()
            cursor.execute("SELECT * FROM RESERVA")  # Ejemplo de consulta
            reservas = cursor.fetchall()
            cursor.close()
            return reservas
      
      def find_by(id):
            cursor = db_conecction.cursor()
            cursor.execute(
                  "SELECT * FROM RESERVA where idreserva =%s",
                  (id,))  # Ejemplo de consulta
            reservas = cursor.fetchone()
            cursor.close()
            return reservas
      
      def update_reserva(id_reserva, nueva_fecha_inicio, nueva_fecha_fin, contrato_nuevo):
            """Actualiza un registro en la tabla reserva."""
            connection = db()
            if connection:
                  try:
                        with connection.cursor() as cursor:
                              cursor.execute(
                                    """UPDATE reserva 
                                    SET fechaInicio = %s, 
                                          fechaFin = %s, 
                                          contrato = %s
                                    WHERE idreserva = %s""",
                                    (
                                          nueva_fecha_inicio,
                                          nueva_fecha_fin,
                                          contrato_nuevo,
                                          id_reserva
                                    )
                              )
                              connection.commit()
                        print("Reserva actualizada exitosamente")
                  except Exception as ex:
                        print("Error al actualizar la reserva:", ex)
                  finally:
                        connection.close()

      def delete_reserva(id_reserva):
            connection = db()
            try:
                  with connection.cursor() as cursor:
                        cursor.execute(
                        "DELETE FROM RESERVA WHERE IDRESERVA = %s",
                        (id_reserva,)
                        )
                        connection.commit()
            except Exception as ex:
                  print("Error al eliminar la reserva:", ex)
            finally:
                  connection.close()