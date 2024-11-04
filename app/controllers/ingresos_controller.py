from flask import Blueprint,render_template

ingresos_bp = Blueprint('ingresos',__name__)

@ingresos_bp.route("/")
def home():
    return render_template('index.html')

@ingresos_bp.route("/ingresos")
def index():
    return render_template('ingresos/home.html')

@ingresos_bp.route("/ingresos/dashboard")
def dashboard():
    return render_template("ingresos/dashboard.html")