from datetime import datetime
from flask import Blueprint, render_template, request, redirect, url_for, flash
from views import seguro_view
from models.seguro_models import Seguro

seguro_bp = Blueprint('seguro', __name__)
seguro_model = Seguro()  # Create an instance of Seguro

@seguro_bp.route('/seg')
def seguros():
    seguros = seguro_model.find_all()
    return seguro_view.seguros(seguros)

@seguro_bp.route('/seg/create/seguro', methods=['GET', 'POST'])
def create():
    if request.method == 'GET':
        return seguro_view.create()
    
    id_seguro = request.form['id_seguro']
    id_vehiculo = request.form['id_vehiculo']
    id_aseguradora = request.form['id_aseguradora']
    fecha_inicio = request.form['fecha_inicio']
    fecha_fin = request.form['fecha_fin']
    tipo_seguro = request.form['tipo_seguro']
    costo = request.form['costo']
      
    fecha_inicio_str = datetime.strptime(fecha_inicio, '%d-%m-%Y').date()
    fecha_fin_str = datetime.strptime(fecha_fin, '%d-%m-%Y').date()

    seguro_model.create_seguro(id_seguro, id_vehiculo, id_aseguradora, fecha_inicio_str, fecha_fin_str, tipo_seguro, costo)

    return redirect(url_for('seguro.seguros'))


@seguro_bp.route('/seg/update/<int:id>', methods=["GET", "POST"])
def update(id):
    if request.method == "GET":
        seguro = seguro_model.find_by(id)
        if seguro is None:
            #flash('No existe un seguro con ese id', 'error')
            return redirect(url_for('seguro.seguros'))
        return seguro_view.update_seguro(seguro=seguro)
    
    # Collect updated form data
    id_vehiculo = request.form['id_vehiculo']
    id_aseguradora = request.form['id_aseguradora']
    fecha_inicio = request.form['fecha_inicio']
    fecha_fin = request.form['fecha_fin']
    tipo_seguro = request.form['tipo_seguro']
    costo = request.form['costo']

    fecha_inicio_str = datetime.strptime(fecha_inicio, '%Y-%m-%d').date()
    fecha_fin_str = datetime.strptime(fecha_fin, '%Y-%m-%d').date()
    # Update the seguro
    seguro_model.update_seguro(id, id_vehiculo, id_aseguradora, fecha_inicio_str, fecha_fin_str, tipo_seguro, costo)
    #flash('Seguro actualizado exitosamente!', 'success')

    return redirect(url_for('seguro.seguros'))

@seguro_bp.route('/seg/delete/<int:id>')
def delete_seguro(id):
    seguro = seguro_model.find_by(id)
    if seguro is None:
        print('No existe un seguro con ese id', 'error')
    else:
        seguro_model.delete_seguro(id)

    return redirect(url_for('seguro.seguros'))

@seguro_bp.route('/seg/<int:id>')
def seguro(id):
    seguro = seguro_model.find_by(id)
    if seguro is None:
        return redirect(url_for('seguro.seguros'))
    return seguro_view.seguro(seguro=seguro)

@seguro_bp.route('/rep/vencidos', methods=['GET'])
def seg_vencido():
    seguros = seguro_model.seguros_vencidos()
    return seguro_view.seguros_vencidos(seguros)

@seguro_bp.route('/rep/activos', methods=['GET'])
def seg_activo():
    seguros = seguro_model.seguros_activos()
    return seguro_view.seguros_activos(seguros)