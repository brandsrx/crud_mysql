from flask import render_template

def creat_view():
      return render_template('create.html')

def get_vehiculo(vehiculo,estado_vehiculo,marca):
      return render_template('get_vehiculo.html',vehiculo=vehiculo,estado_vehiculo=estado_vehiculo,marca=marca)

def vehiculos(vehiculos):
      return render_template('vehiculos.html',vehiculos=vehiculos)

def edit(vehiculo):
      return render_template('edit_vehiculo.html',vehiculo=vehiculo)