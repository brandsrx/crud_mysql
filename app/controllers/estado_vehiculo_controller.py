from flask import Blueprint,request,redirect,url_for,flash
from models.estado_vehiculo_model import EstadoVehiculo
from models.vehiculo_models import Vehiculo
from views import estado_vehiculo_views

est_vehiculo_bp = Blueprint('est_vehiculo',__name__)


@est_vehiculo_bp.route("/vehiculo/disponible")
def vehiculo_disponible():
    results = Vehiculo.vehiculo_disponible()
    print(results[0][0].id_vehiculo)
    return estado_vehiculo_views.gestionar_disponibilidad(results)

@est_vehiculo_bp.route('/vehiculo/<int:id>/edit/estado',methods=["GET","POST"])
def edit(id):
    estado = EstadoVehiculo.find_by(id=id)
    if request.method == "GET":
        return estado_vehiculo_views.edit(estado_vehiculo = estado)

    nombre_estado = request.form["nombre_estado"]
    descripcion = request.form["descripcion"]
    
    res = estado.update(nombre_estado=nombre_estado,descripcion=descripcion)

    if res is True:
        flash(f"Se acutalizo correctamente ",'success')
    else:
        flash("Error: no se pudo actualizar el estado","error")
    return redirect(url_for("est_vehiculo.vehiculo_disponible"))
