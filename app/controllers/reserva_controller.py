from flask import Blueprint,request,redirect,url_for
from views import reserva_view
from models.reserva_models import Reserva
from datetime import datetime

reserva_bp = Blueprint('reserva',__name__)


@reserva_bp.route('/create/reserva',methods=['GET','POST'])
def create():
      if request.method == 'GET':
            return reserva_view.create()
      id_reserva = request.form['id_reserva']
      id_cliente = request.form['id_cliente']
      id_empleado = request.form['id_empleado']
      fecha_inicio = request.form['fecha_inicio']
      fecha_fin = request.form['fecha_fin']
      contrato = request.form['contrato']
            
      fecha_inicio_str = datetime.strptime(fecha_inicio, '%Y-%m-%d').date()
      fecha_fin_str = datetime.strptime(fecha_fin, '%Y-%m-%d').date()

      Reserva.create_reserva(id_reserva,id_cliente,id_empleado,fecha_inicio_str,fecha_fin_str,contrato)

      return "Se creo la reserva"


@reserva_bp.route('/')
def reservas():
      reservas = Reserva.find_all()
      return reserva_view.reservas(reservas)


@reserva_bp.route('/<int:id>')
def reserva(id):
      reserva = Reserva.find_by(id)
      if reserva is None:
            return "NO hay una reserva con ese id"
      return reserva_view.reserva(reserva=reserva)

@reserva_bp.route('/update/<int:id>',methods=["GET","POST"])
def update(id):
      if( request.method == "GET"):
            reserva = Reserva.find_by(id)
            if reserva is None:
                  return "NO hay una reserva con ese id"
            return reserva_view.update_reserva(reserva=reserva)
      
      fecha_inicio = request.form['fecha_inicio']
      fecha_fin = request.form['fecha_fin']
      contrato = request.form['contrato']
      fecha_inicio_str = datetime.strptime(fecha_inicio, '%Y-%m-%d').date()
      fecha_fin_str = datetime.strptime(fecha_fin, '%Y-%m-%d').date()
      
      

      Reserva.update_reserva(id_reserva=id,nueva_fecha_inicio=fecha_inicio_str,nueva_fecha_fin=fecha_fin_str,contrato_nuevo=contrato)

      return "se actualizo"

@reserva_bp.route('/delete/<int:id>')
def delete_reserva(id):
      Reserva.delete_reserva(id)
      return reserva_view.delete()
