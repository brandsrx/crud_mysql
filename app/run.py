from flask import Flask,flash
from controllers import vehiculo_controller,estado_vehiculo_controller,reserva_controller
from controllers import ingresos_controller

app = Flask(__name__)

app.secret_key="mi_clave_secreta"

app.register_blueprint(vehiculo_controller.vehiculo_bp)
app.register_blueprint(estado_vehiculo_controller.est_vehiculo_bp)
app.register_blueprint(reserva_controller.reserva_bp)
app.register_blueprint(ingresos_controller.ingresos_bp)

if __name__ == "__main__":
      app.run(debug=True)


