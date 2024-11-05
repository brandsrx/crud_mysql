from flask import Blueprint,render_template,request,flash,redirect,url_for
from models.ingresos_model import TipoCambio,Transaccion
from datetime import datetime
import calendar
ingresos_bp = Blueprint('ingresos',__name__)

@ingresos_bp.route("/")
def home():
    
    return render_template('index.html')

@ingresos_bp.route("/ingresos")
def index():
    transacciones = Transaccion.find_all()
    return render_template('ingresos/home.html',transacciones = transacciones)

def ingresos_men():
    meses = []
    costo = []
    datas = Transaccion.query("""
                                        SELECT TO_CHAR(FECHATRANSACCION, 'YYYY-MM') AS mes, 
                                            SUM(COSTO) AS ingresos_mensuales
                                        FROM TRANSACCION
                                        GROUP BY TO_CHAR(FECHATRANSACCION, 'YYYY-MM')
                                        ORDER BY mes
                                        """)
    for data in datas:
        
        mes = int(data[0][-2:])

        meses.append(calendar.month_name[mes])
        costo.append(data[1])
    return [meses,costo]

def ingresos_tipo():
    tipo = []
    monto = []
    datas = Transaccion.query("""
                    SELECT TIPOTRANSACCION, 
                        COUNT(DISTINCT IDCLIENTE) AS cantidad_clientes
                    FROM 
                        TRANSACCION
                    GROUP BY 
                        TIPOTRANSACCION  """)
    for data in datas:
        tipo.append(data[0])
        monto.append(data[1])
    return [tipo,monto]

@ingresos_bp.route("/ingresos/dashboard")
def dashboard():
    tipo_cambio_actual  = TipoCambio.query("""
                                            SELECT * 
                                            FROM (
                                                SELECT valordolar 
                                                FROM tipo_cambio 
                                                ORDER BY fechatipocambio DESC
                                            ) 
                                            WHERE ROWNUM <= 1                       
                                            """)
    cliente_activos = TipoCambio.query("SELECT COUNT(idcliente) FROM transaccion")
    total_transacciones = Transaccion.query("SELECT COUNT(*) FROM TRANSACCION")
    ingresos = Transaccion.query("""
                SELECT SUM(COSTO) AS total_ingresos
                    FROM TRANSACCION
                    WHERE FECHATRANSACCION BETWEEN ADD_MONTHS(SYSDATE, -5) AND SYSDATE
                """)
    dash_header = {
        "tipo_cambio":tipo_cambio_actual[0][0],
        "cliente_activos":cliente_activos[0][0],
        "total_transaccionnes":total_transacciones[0][0],
        "ingresos_total":ingresos[0][0]
    }

    ingresos_mensuales = ingresos_men()
    ingr_tipo = ingresos_tipo()
    
    print(ingresos_mensuales)
    # ,mensual=ingresos_mensuales,tipo=ingr_tipo
    return render_template("ingresos/dashboard.html",header=dash_header,meses=ingresos_mensuales,tipo=ingr_tipo)

@ingresos_bp.route("/tipocambio/register",methods=["POST"])
def tipo_cambio_registrar():
    id = TipoCambio.query("SELECT COUNT(*) FROM TIPO_CAMBIO")
    fecha_str = request.form["fechaTipoCambio"]
    valor_dolar = request.form["valorDolar"]
    fecha = datetime.strptime(fecha_str, "%Y-%m-%d")
    
    tipo_cambio = TipoCambio(id_tipo_cambio=id[0][0],fecha_tipo_cambio=fecha,valor_dolar=valor_dolar)
    sw = tipo_cambio.create()

    if sw is True:
        flash("Se registro correctamente","success")
    else:
        flash("NO se registro","error")
    return redirect(url_for("ingresos.index"))

@ingresos_bp.route("/transacciones/register",methods=["POST"])
def tranasccion_register():
    id_cliente = request.form["idCliente"]
    tipo_transaccion = request.form["tipoTransaccion"]
    fecha_transaccion_str = request.form["fechaTransaccion"] 
    costo = request.form["costo"]
    id_tipo_cambio = request.form["idTipoCambio"]

    id = Transaccion.query("SELECT COUNT(*) FROM TRANSACCION")

    transaccion = Transaccion(id=id[0][0],id_cliente=id_cliente,
                            fecha_transaccion=datetime.strptime(fecha_transaccion_str, "%Y-%m-%d"),
                            tipo_transaccion= tipo_transaccion,
                            costo=costo,
                            id_tipo_cambio=id_tipo_cambio)
    if transaccion.create():
        flash("Se registro correctamente","success")
    else:
        flash("NO se registro","error")
    return redirect(url_for("ingresos.index"))
