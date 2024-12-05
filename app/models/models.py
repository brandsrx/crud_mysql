from database import db as get_oracle_connection

class Persona:
    def __init__(self, id=None, nombre=None, paterno=None, materno=None, direccion=None, telefono=None, email=None, fecha_nacimiento=None):
        self.id = id
        self.nombre = nombre
        self.paterno = paterno
        self.materno = materno
        self.direccion = direccion
        self.telefono = telefono
        self.email = email
        self.fecha_nacimiento = fecha_nacimiento
        
    @staticmethod
    def get_all():
        connection = get_oracle_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT idpersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento FROM persona")
        rows = cursor.fetchall()
        personas = [Persona(id=row[0], nombre=row[1], paterno=row[2], materno=row[3], direccion=row[4], telefono=row[5], email=row[6], fecha_nacimiento=row[7]) for row in rows]
        cursor.close()
        return personas

    @staticmethod
    def get_by_id(id):
        connection = get_oracle_connection()
        cursor = connection.cursor()
        cursor.execute("SELECT idpersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento FROM persona WHERE idpersona = %s", (id,))
        row = cursor.fetchone()
        cursor.close()
        if row:
            return Persona(id=row[0], nombre=row[1], paterno=row[2], materno=row[3], direccion=row[4], telefono=row[5], email=row[6], fecha_nacimiento=row[7])
        return None

    def save(self):
        connection = get_oracle_connection()
        cursor = connection.cursor()
        cursor.execute(
            "INSERT INTO persona (idpersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento) VALUES (%s,%s,%s,%s,%s,%s,%s, TO_DATE(%s, 'DD/MM/YYYY'))",
            (self.id, self.nombre, self.paterno, self.materno, self.direccion, self.telefono, self.email, self.fecha_nacimiento)
        )
        connection.commit()
        cursor.close()

    def update(self):
        connection = get_oracle_connection()
        cursor = connection.cursor()
        cursor.execute(
            "UPDATE persona SET nombre = %s, paterno = %s, materno = %s, direccion = %s, telefono = %s, email = %s, fecha_nacimiento = TO_DATE(%s, 'DD/MM/YYYY') WHERE idpersona = :id",
            (self.id, self.nombre, self.paterno, self.materno, self.direccion, self.telefono, self.email, self.fecha_nacimiento)
        )
        connection.commit()
        cursor.close()

    def delete(self):
        connection = get_oracle_connection()
        cursor = connection.cursor()
        cursor.execute("DELETE FROM persona WHERE idpersona = %s",(self.id))
        connection.commit()
        cursor.close()

    def to_dict(self):
        return {
            'id': self.id,
            'nombre': self.nombre,
            'paterno': self.paterno,
            'materno': self.materno,
            'direccion': self.direccion,
            'telefono': self.telefono,
            'email': self.email,
            'fecha_nacimiento': self.fecha_nacimiento
        }
