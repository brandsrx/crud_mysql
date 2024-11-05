from flask import redirect, render_template, url_for
from models.vehiculo_models import Vehiculo
from models.aseguradora_models import Aseguradora


def create():
    vehiculos = Vehiculo.find_all_ids()
    aseguradoras = Aseguradora.find_all_ids()
    return render_template('seguros/pagSeguro/create_seguro.html', vehiculos=vehiculos, aseguradoras=aseguradoras)

def seguros(seguros):
    return render_template('seguros/pagSeguro/seguros.html', seguros=seguros)

def seguro(seguro):
    return render_template('seguros/pagSeguro/seguro.html', seguro=seguro)

def update_seguro(seguro=None, error=None):
    vehiculos = Vehiculo.find_all_ids()
    aseguradoras = Aseguradora.find_all_ids()
    return render_template('seguros/pagSeguro/update_seguro.html', seguro=seguro, error=error, vehiculos=vehiculos, aseguradoras=aseguradoras)

def delete():
    return redirect(url_for('seguro.seguros'))

def seguros_vencidos(seguros):
    return render_template('seguros/pagReportes/seguros_vencidos.html', seguros=seguros)

def seguros_activos(seguros):
    return render_template('seguros/pagReportes/seguros_activos.html', seguros=seguros)