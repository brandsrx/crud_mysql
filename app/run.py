from flask import Flask,flash
from controllers import vehiculo_controller,estado_vehiculo_controller,reserva_controller
from controllers import ingresos_controller

from controllers import seguro_controller,aseguradora_controller

from controllers import routes

from controllers import empleado_controller

app = Flask(__name__)

app.secret_key="mi_clave_secreta"

app.register_blueprint(vehiculo_controller.vehiculo_bp)
app.register_blueprint(estado_vehiculo_controller.est_vehiculo_bp)
app.register_blueprint(reserva_controller.reserva_bp)
app.register_blueprint(ingresos_controller.ingresos_bp)

app.register_blueprint(aseguradora_controller.aseguradora_bp)
app.register_blueprint(seguro_controller.seguro_bp)

app.register_blueprint(routes.main)

app.register_blueprint(empleado_controller.empleado_persona_bp)

if __name__ == "__main__":
      app.run(debug=True)


