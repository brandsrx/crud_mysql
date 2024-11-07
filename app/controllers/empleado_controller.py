from flask import Blueprint, request, redirect, url_for, flash
from views import empleado_view
from models.empleado_models import EmpleadoPersona
from datetime import datetime

empleado_persona_bp = Blueprint('empleado_persona',__name__)

@empleado_persona_bp.route('/empleado/create', methods=['GET', 'POST'])
def create():
    if request.method == 'GET':
        return empleado_view.create()
    
    nombre = request.form['nom_empleado']
    ap_paterno = request.form['ap_paterno_empleado']
    ap_materno = request.form['ap_materno_empleado']
    direccion = request.form['direccion']
    telefono = request.form['telefono']
    fecha_nac = request.form['fecha_nac']
    email = request.form['email']
    ci = request.form['ci']
    usuario = request.form['usuario']
    contraseña = request.form['password']
    rolusuario = request.form['rol']

    
    fecha_nac_str = datetime.strptime(fecha_nac, '%Y-%m-%d').date()
    
    id_persona = EmpleadoPersona.create_persona(nombre, ap_paterno, ap_materno, direccion, telefono, email, fecha_nac_str)

    id_empleado = EmpleadoPersona.create_empleado(id_persona, email, ci, "0%")

    EmpleadoPersona.create_usuario(id_empleado, usuario, contraseña, rolusuario)
    flash("Empleado creado con exito","success")
    return redirect(url_for('empleado_persona.empleados'))

@empleado_persona_bp.route('/empleados', methods=['GET', 'POST'])
def empleados():
    search_query = request.args.get('buscar', '')  # Obtener el valor de búsqueda
    if search_query:
        empleados = EmpleadoPersona.search_by_name(search_query)
    else:
        empleados = EmpleadoPersona.find_all()
    return empleado_view.empleados(empleados)

@empleado_persona_bp.route('/empleados/<int:id>')
def empleado(id):
    empleado = EmpleadoPersona.find_by(id)
    if empleado is None:
        return "No hay un empleado con ese id"
    return empleado_view.empleado(empleado=empleado)

@empleado_persona_bp.route('/empleados/<int:id>/update', methods=["GET","POST"])
def update(id):
    if request.method == "GET":
        empleado = EmpleadoPersona.find_by_empleado(id)
        if empleado is None:
            return "No hay un empleado con ese id"
        return empleado_view.update_empleado(empleado=empleado)
    
    email_nuevo = request.form['email'] 
    ci_nuevo = request.form['ci']
    comisionES_nueva = request.form['comisionES']
    EmpleadoPersona.update_empleado(id_empleado=id, email=email_nuevo, ci=ci_nuevo, comisionES=comisionES_nueva)
    flash("Empleado actualizado correctamente", "success")
    return redirect(url_for('empleado_persona.empleados'))

@empleado_persona_bp.route('/empleados/<int:id>/delete')
def delete_empleado(id):
    EmpleadoPersona.delete_empleado(id)
    flash("Empleado eliminado correctamente", "success")
    return redirect(url_for('empleado_persona.empleados'))