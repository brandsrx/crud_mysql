from flask import Flask,flash
from controllers import vehiculo_controller

app = Flask(__name__)

app.secret_key="mi_clave_secreta"
app.register_blueprint(vehiculo_controller.vehiculo_bp)


if __name__ == "__main__":
      app.run(debug=True)


