from flask import render_template

def create():
      return render_template('create_reserva.html');

def reservas(reservas):
      return render_template('reservas.html',reservas=reservas)

def reserva(reserva):
      return render_template('reserva.html',reserva=reserva)


def delete():
      return "SE elimino correctamente"