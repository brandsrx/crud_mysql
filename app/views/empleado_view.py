from flask import render_template

def create():
    return render_template('empleados/create_empleado.html')

def empleados(empleados):
    return render_template('empleados/empleados.html', empleados=empleados)

def empleado(empleado):
    return render_template('empleados/empleado.html', empleado=empleado)

def update_empleado(empleado):
    return render_template('empleados/update_empleado.html', empleado=empleado)