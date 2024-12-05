from database import db

class Aseguradora:
    def create_aseguradora(self, id_aseguradora, nombre_aseguradora, contacto_aseguradora):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    """
                    INSERT INTO ASEGURADORA (idAseguradora, nombreAseguradora, contactoAseguradora) 
                    VALUES (%s,%s,%s)
                    """,
                    (
                        id_aseguradora,
                        nombre_aseguradora,
                        contacto_aseguradora
                    )
                )
                connection.commit()
        except Exception as ex:
            print("Error al crear la aseguradora:", ex)
        finally:
            connection.close()

    def find_all(self):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute("SELECT * FROM ASEGURADORA ORDER BY idAseguradora")
                aseguradoras = cursor.fetchall()
                return aseguradoras
        finally:
            connection.close()

    def find_by(self, id):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    "SELECT * FROM ASEGURADORA WHERE idAseguradora = %s",
                    (id,)  # <-- Nota: No uses ':' en el nombre de la clave
                )
                aseguradoras = cursor.fetchone()
                return aseguradoras
        finally:
            connection.close()
            
    def update_aseguradora(self, id_aseguradora, nuevo_nombre_aseguradora, nuevo_contacto_aseguradora):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    """UPDATE ASEGURADORA 
                    SET nombreAseguradora = %s, 
                        contactoAseguradora = %s
                    WHERE idAseguradora = %s""",
                    (
                        nuevo_nombre_aseguradora,
                        nuevo_contacto_aseguradora,
                        id_aseguradora  # <-- Nota: No uses ':' en el nombre de la clave
                    )
                )
                connection.commit()
                print("Aseguradora actualizada exitosamente")
        except Exception as ex:
            print("Error al actualizar la aseguradora:", ex)
        finally:
            connection.close()

    def delete_aseguradora(self, id_aseguradora):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    "DELETE FROM ASEGURADORA WHERE idAseguradora = %s",
                    (id_aseguradora,)  # <-- Nota: No uses ':' en el nombre de la clave
                )
                connection.commit()
        except Exception as ex:
            print("Error al eliminar la aseguradora:", ex)
        finally:
            connection.close()

    def find_all_ids():
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute("SELECT idAseguradora FROM ASEGURADORA")
                aseguradora_ids = cursor.fetchall()
                return [row[0] for row in aseguradora_ids]
        finally:
            connection.close()
