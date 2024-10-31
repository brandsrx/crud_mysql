from flask import Blueprint,request,url_for,redirect,flash
from views import vehiculo_views
from models.vehiculo_models import Vehiculo

vehiculo_bp = Blueprint('vehiculo',__name__)

@vehiculo_bp.route('/')
def get_vehiculos():
      vehiculos = Vehiculo.find_all()
      return vehiculo_views.vehiculos(vehiculos=vehiculos)

@vehiculo_bp.route('/<int:id>')
def get_vehiculo(id):
      list_vehiculo = Vehiculo.detail(id)
      return vehiculo_views.get_vehiculo(vehiculo=list_vehiculo[0],estado_vehiculo=list_vehiculo[1],marca=list_vehiculo[2])

@vehiculo_bp.route('/register',methods=["GET","POST"])
def create_vehiculo():
      if(request.method == "GET"):
            return vehiculo_views.creat_view()
      try:
            id_vehiculo = request.form['idVehiculo']
            anio = request.form['anio']
            modelo = request.form['modelo']
            precio_diario = request.form['precioDiario']
            precio_dolar = request.form['precioDolar']
            caracteristicas = request.form['caracteristicas']
            id_estado_vehiculo = request.form['idEstadoVehiculo']
            id_marca = request.form['idMarca']      

            vehiculo = Vehiculo(id_vehiculo,anio,modelo,precio_diario,precio_dolar,caracteristicas,id_estado_vehiculo,id_marca)
            if vehiculo.create() is not None:
                  flash(f'Se registro correctamente, vehiculo: {id_vehiculo} ','success')
            else:
                  flash('Ocurrio un error al registrar','error')
      except Exception as ex:
            flash('No se pudo registrar, error','error')
      return  redirect(url_for('vehiculo.get_vehiculos'))


@vehiculo_bp.route('/vehiculo/<int:id>/edit',methods=["POST","GET"])
def edit(id):
      vehiculo = Vehiculo.find_by(id)
      vehiculo.to_string()
      
      if request.method == "GET":
            return vehiculo_views.edit(vehiculo=vehiculo)
      anio = request.form['anio']
      modelo = request.form['modelo']
      precio_diario = request.form['precio_diario']
      precio_dolar = request.form['precio_dolar']
      caracteristicas = request.form['caracteristicas']
      vehiculo.to_string()

      vehiculo.update(anio=anio,modelo=modelo,precio_diario=precio_diario,precio_dolar=precio_dolar,caracteristicas=caracteristicas)
      flash(f"Se acutalizo correctamente el vehiculo: {id}",'success')
      return redirect(url_for('vehiculo.get_vehiculos'))

@vehiculo_bp.route("/vehiculo/<int:id>/delete")
def delete(id):
      vehiculo = Vehiculo.delete(id_vehiculo=id)
      flash(f'Se elimino el vehiculo correctamente: {id}','error')
      return redirect(url_for('vehiculo.get_vehiculos'))