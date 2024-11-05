from database import db

class Seguro:
    def create_seguro(self, id_seguro, id_vehiculo, id_aseguradora, fecha_inicio, fecha_fin, tipo_seguro, costo):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    """
                    INSERT INTO SEGURO (idSeguro, idVehiculo, idAseguradora, fechaInicio, fechaFin, tipoSeguro, costo) 
                    VALUES (:id_seguro, :id_vehiculo, :id_aseguradora, :fecha_inicio, :fecha_fin, :tipo_seguro, :costo)
                    """,
                    {
                        'id_seguro': id_seguro,
                        'id_vehiculo': id_vehiculo,
                        'id_aseguradora': id_aseguradora,
                        'fecha_inicio': fecha_inicio,
                        'fecha_fin': fecha_fin,
                        'tipo_seguro': tipo_seguro,
                        'costo': costo
                    }
                )
                connection.commit()
                print("Seguro creado exitosamente")
        except Exception as ex:
            print("Error al crear el seguro:", ex)
        finally:
            connection.close()

    def find_all(self):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute("SELECT * FROM SEGURO ORDER BY idSeguro")
                seguros = cursor.fetchall()
                return seguros
        finally:
            connection.close()

    def find_by(self, id_seguro):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    "SELECT * FROM SEGURO WHERE idSeguro = :id_seguro",
                    {'id_seguro': id_seguro}
                )
                seguro = cursor.fetchone()
                return seguro
        finally:
            connection.close()

    def update_seguro(self, id_seguro, nuevo_id_vehiculo, nuevo_id_aseguradora, nueva_fecha_inicio, nueva_fecha_fin, nuevo_tipo_seguro, nuevo_costo):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    """
                    UPDATE SEGURO 
                    SET idVehiculo = :nuevo_id_vehiculo,
                        idAseguradora = :nuevo_id_aseguradora,
                        fechaInicio = :nueva_fecha_inicio,
                        fechaFin = :nueva_fecha_fin,
                        tipoSeguro = :nuevo_tipo_seguro,
                        costo = :nuevo_costo
                    WHERE idSeguro = :id_seguro
                    """,
                    {
                        'nuevo_id_vehiculo': nuevo_id_vehiculo,
                        'nuevo_id_aseguradora': nuevo_id_aseguradora,
                        'nueva_fecha_inicio': nueva_fecha_inicio,
                        'nueva_fecha_fin': nueva_fecha_fin,
                        'nuevo_tipo_seguro': nuevo_tipo_seguro,
                        'nuevo_costo': nuevo_costo,
                        'id_seguro': id_seguro
                    }
                )
                connection.commit()
                print("Seguro actualizado exitosamente")
        except Exception as ex:
            print("Error al actualizar el seguro:", ex)
        finally:
            connection.close()

    def delete_seguro(self, id_seguro):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    "DELETE FROM SEGURO WHERE IDSEGURO = :id_seguro",
                    {'id_seguro': id_seguro}
                )
                connection.commit()
                print("Seguro eliminado exitosamente")
        except Exception as ex:
            print("Error al eliminar el seguro:", ex)
        finally:
            connection.close()

    def seguros_vencidos(self):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute("SELECT * FROM SEGURO WHERE fechaFin < SYSDATE")
                seguros = cursor.fetchall()
                return seguros
        finally:
            connection.close()
    
    def seguros_activos(self):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute("SELECT * FROM SEGURO WHERE fechaFin > SYSDATE")
                seguros = cursor.fetchall()
                return seguros
        finally:
            connection.close()