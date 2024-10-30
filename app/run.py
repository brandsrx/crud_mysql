from flask import Flask
from controllers import reserva_controller

app = Flask(__name__)

app.register_blueprint(reserva_controller.reserva_bp)


if __name__ == "__main__":
      app.run(debug=True)


