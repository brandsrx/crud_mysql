from database import db
db_conecction = db()

class EmpleadoPersona:
    
    @staticmethod
    def search_by_name(nombre):
        connection = db()
        try:
            with connection.cursor() as cursor:
                query = """
                SELECT e.idEmpleado, p.nombre, p.paterno, p.materno, e.email, e.ci, e.comisionES
                FROM EMPLEADO e
                JOIN PERSONA p ON e.idPersona = p.idPersona
                WHERE LOWER(p.nombre) LIKE '%' || LOWER(:nombre) || '%'
                   OR LOWER(p.paterno) LIKE '%' || LOWER(:nombre) || '%'
                   OR LOWER(p.materno) LIKE '%' || LOWER(:nombre) || '%'
                """
                cursor.execute(query, nombre=nombre)
                empleados = cursor.fetchall()
            return empleados
        except Exception as e:
            print("Error al buscar empleados:", e)
            return []
        finally:
            connection.close()

    @staticmethod
    def create_persona(nombre, paterno, materno, direccion, telefono, email, fecha_nac):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    """
                    INSERT INTO PERSONA (idPersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento)
                    VALUES (persona_seq.nextval, %s,%s,%s,%s,%s,%s,%s)
                    """,(nombre, paterno, materno, direccion, telefono, email, fecha_nac),
                )
                 # Recupera el último ID generado
                cursor.execute("SELECT persona_seq.currval FROM dual")
                id_persona = cursor.fetchone()[0]  # Obtiene el valor de la secuencia actual

                connection.commit()
                # Devuelve el ID de persona generado
                return id_persona
        except Exception as e:
            print("Error al crear persona:", e)
            return None
        finally:
            connection.close()

    @staticmethod
    def create_empleado(id_persona, email, ci, comisionES):
        connection = db()
        try:
            with connection.cursor() as cursor:

                cursor.execute(
                    """
                    INSERT INTO EMPLEADO (idEmpleado, idPersona, email, ci, comisionES)
                    VALUES (empleado_seq.nextval, %s,%s,%s,%s)
                    """,(id_persona, email, ci, comisionES)
                )
                # Recupera el último ID generado
                cursor.execute("SELECT empleado_seq.currval FROM dual")
                id_empleado = cursor.fetchone()[0]  # Obtiene el valor de la secuencia actual

                connection.commit()
                
                # Devuelve el ID de empleado generado
                return id_empleado
        except Exception as e:
            print("Error al crear empleado:", e)
            return None
        finally:
            connection.close()

    @staticmethod
    def create_usuario(id_empleado, nombreUsuario, contrasena, rolUsuario):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    """
                    INSERT INTO USUARIO (idUsuario, idEmpleado, nombreUsuario, contrasena, rolUsuario)
                    VALUES (usuario_seq.nextval, %s,%s,%s,%s)
                    """,
                    (id_empleado, nombreUsuario, contrasena, rolUsuario)
                )
                connection.commit()
        except Exception as e:
            print("Error al crear usuario:", e)
        finally:
            connection.close()
    
    @staticmethod
    def find_all():
        cursor = db_conecction.cursor()
        cursor.execute("SELECT * FROM EMPLEADO")
        empleados = cursor.fetchall()
        cursor.close()
        return empleados
    
    @staticmethod
    def find_by(id):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    """
                    SELECT 
                        e.idEmpleado,
                        p.nombre || ' ' || p.paterno || ' ' || p.materno AS nombre_completo,
                        p.direccion,
                        p.telefono,
                        p.email,
                        e.ci,
                        e.comisionES,
                        u.rolUsuario AS rol
                    FROM EMPLEADO e
                    JOIN PERSONA p ON e.idPersona = p.idPersona
                    JOIN usuario u ON e.idEmpleado = u.idEmpleado
                    WHERE e.idEmpleado = %s
                    """, (id,)
                )
                empleado = cursor.fetchone()
            return empleado
        except Exception as e:
            print("Error al obtener detalles del empleado:", e)
            return None
        finally:
            connection.close()

    @staticmethod
    def find_by_empleado(id_empleado):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    """
                    SELECT * FROM EMPLEADO WHERE idEmpleado = %s
                    """, (id_empleado,)
                )
                empleado = cursor.fetchone()
            connection.commit()

            return empleado
        except Exception as e:
            print("Error al actualizar el empleado:", e)
        finally:
            connection.close()

    @staticmethod
    def update_empleado(id_empleado, email, ci, comisionES):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute(
                    """
                    UPDATE EMPLEADO
                    SET email = %s, ci = %s, comisionES = %s
                    where idEmpleado = %s
                    """, (email, ci, comisionES, id_empleado)
                )
            connection.commit()
        except Exception as e:
            print("Error al actualizar el empleado:", e)
        finally:
            connection.close()
    @staticmethod
    def delete_empleado(id_empleado):
        connection = db()
        try:
            with connection.cursor() as cursor:
                cursor.execute("DELETE FROM EMPLEADO WHERE idEmpleado = %s", (id_empleado,))
                connection.commit()
        except Exception as ex:
            print("Error al eliminar el empleado:", ex)
        finally:
            connection.close()
