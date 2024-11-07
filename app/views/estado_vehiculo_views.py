from flask import render_template

def gestionar_disponibilidad(vehiculos):
    return render_template('g_disponibilidad.html',vehiculos=vehiculos)

def edit(estado_vehiculo):
    
    return render_template('edit_estado.html',estado=estado_vehiculo)

def create():
    return render_template("create_estado.html")