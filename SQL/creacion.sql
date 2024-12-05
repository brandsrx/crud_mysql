-- Tabla PERSONA (supratipo)
CREATE TABLE PERSONA (
    idPersona INTEGER PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    paterno VARCHAR(50) NOT NULL,
    materno VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(0015),
    fecha_nacimiento DATE NOT NULL
);

-- Tabla CLIENTE (subtipo de PERSONA)
CREATE TABLE CLIENTE (
    idCliente INTEGER PRIMARY KEY,
    idPersona INTEGER NOT NULL,
    fecha_registro DATE NOT NULL,
    FOREIGN KEY (idPersona) REFERENCES PERSONA(idPersona)
    ON DELETE CASCADE
);

-- Tabla EMPLEADO (subtipo de PERSONA)
CREATE TABLE EMPLEADO (
    idEmpleado INTEGER PRIMARY KEY,
    idPersona INTEGER NOT NULL,
    email VARCHAR(100),
    ci VARCHAR(20),
    comisionES VARCHAR(50),
    FOREIGN KEY (idPersona) REFERENCES PERSONA(idPersona)
    ON DELETE CASCADE
);

-- Tabla USUARIO (relación 1.1 con EMPLEADO)
CREATE TABLE USUARIO (
    idUsuario INTEGER PRIMARY KEY,
    idEmpleado INTEGER NOT NULL,
    nombreUsuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(50) NOT NULL,
    rolUsuario VARCHAR(50),
    FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO(idEmpleado)
    ON DELETE CASCADE
);

-- Tabla RESERVA (relación 1.N con CLIENTE y EMPLEADO)
CREATE TABLE RESERVA (
    idReserva INTEGER PRIMARY KEY,
    idCliente INTEGER NOT NULL,
    idEmpleado INTEGER NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    contrato VARCHAR(50),
    FOREIGN KEY (idCliente) REFERENCES CLIENTE(idCliente) ON DELETE CASCADE,
    FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO(idEmpleado) ON DELETE CASCADE
);

-- Tabla FIDELIZACION (relación 1.1 con CLIENTE)
CREATE TABLE FIDELIZACION (
    idFidelizacion INTEGER PRIMARY KEY,
    idCliente INTEGER NOT NULL,
    puntos INTEGER NOT NULL,
    nivel VARCHAR(50),
    FOREIGN KEY (idCliente) REFERENCES CLIENTE(idCliente)
    ON DELETE CASCADE
);

-- Tabla MARCA
CREATE TABLE MARCA (
    idMarca INTEGER PRIMARY KEY,
    nombreMarca VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100),
    paisMarca VARCHAR(50) NOT NULL
);

-- Tabla ESTADO_VEHICULO
CREATE TABLE ESTADO_VEHICULO (
    idEstadoVehiculo INTEGER PRIMARY KEY,
    nombre_estado VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL
);

-- Tabla VEHICULO
CREATE TABLE VEHICULO (
    idVehiculo INTEGER PRIMARY KEY,
    anio INTEGER NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    precioDiario NUMERIC(10, 2) NOT NULL,
    precioDolar NUMERIC(10, 2) NOT NULL,
    caracteristicas VARCHAR(200),
    idEstadoVehiculo INTEGER NOT NULL,
    idMarca INTEGER NOT NULL,
    FOREIGN KEY (idEstadoVehiculo) REFERENCES ESTADO_VEHICULO(idEstadoVehiculo) ON DELETE CASCADE,
    FOREIGN KEY (idMarca) REFERENCES MARCA(idMarca) ON DELETE CASCADE
);

-- Tabla SEGUIMIENTO_VEHICULO (relación 1.N con VEHICULO)
CREATE TABLE SEGUIMIENTO_VEHICULO (
    id INTEGER PRIMARY KEY,
    idVehiculo INTEGER NOT NULL,
    ubicacionActual VARCHAR(100),
    ultimaFechaActualizacion DATE NOT NULL,
    FOREIGN KEY (idVehiculo) REFERENCES VEHICULO(idVehiculo) ON DELETE CASCADE
);

-- Tabla MANTENIMIENTO (relación 1.N con VEHICULO)
CREATE TABLE MANTENIMIENTO (
    idMantenimiento INTEGER PRIMARY KEY,
    idVehiculo INTEGER NOT NULL,
    descripcion VARCHAR(200),
    estado VARCHAR(50),
    fechaMantenimiento DATE NOT NULL,
    FOREIGN KEY (idVehiculo) REFERENCES VEHICULO(idVehiculo) ON DELETE CASCADE
);

-- Tabla REPUESTOS
CREATE TABLE REPUESTOS (
    idRepuestos INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200)
);

-- Tabla MANTENIMIENTO_REPUESTOS (relación 1.N con MANTENIMIENTO y N.1 con REPUESTOS)
CREATE TABLE MANTENIMIENTO_REPUESTOS (
    id INTEGER PRIMARY KEY,
    idMantenimiento INTEGER NOT NULL,
    idRepuestos INTEGER NOT NULL,
    cantidad INTEGER NOT NULL,
    FOREIGN KEY (idMantenimiento) REFERENCES MANTENIMIENTO(idMantenimiento) ON DELETE CASCADE,
    FOREIGN KEY (idRepuestos) REFERENCES REPUESTOS(idRepuestos) ON DELETE CASCADE
);

-- Tabla TIPO_CAMBIO (relación N.1 con TRANSACCION)
CREATE TABLE TIPO_CAMBIO (
    idTipoCambio INTEGER PRIMARY KEY,
    fechaTipoCambio DATE NOT NULL,
    valorDolar NUMERIC(10, 2) NOT NULL
);

-- Tabla TRANSACCION (relación 1.N entre CLIENTE y TRANSACCION)
CREATE TABLE TRANSACCION (
    idTransaccion INTEGER PRIMARY KEY,
    idCliente INTEGER NOT NULL,
    tipoTransaccion VARCHAR(50) NOT NULL,
    fechaTransaccion DATE NOT NULL,
    costo NUMERIC(10, 2) NOT NULL,
    idTipoCambio INTEGER NOT NULL,
    FOREIGN KEY (idCliente) REFERENCES CLIENTE(idCliente) ON DELETE CASCADE,
    FOREIGN KEY (idTipoCambio) REFERENCES TIPO_CAMBIO(idTipoCambio) ON DELETE CASCADE
);

-- Tabla ASEGURADORA
CREATE TABLE ASEGURADORA (
    idAseguradora INTEGER PRIMARY KEY,
    nombreAseguradora VARCHAR(100) NOT NULL,
    contactoAseguradora VARCHAR(100)
);

-- Tabla SEGURO (relación 1.N con VEHICULO y N.1 con ASEGURADORA)
CREATE TABLE SEGURO (
    idSeguro INTEGER PRIMARY KEY,
    idVehiculo INTEGER NOT NULL,
    idAseguradora INTEGER NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL,
    tipoSeguro VARCHAR(50),
    costo NUMERIC(10, 2),
    FOREIGN KEY (idVehiculo) REFERENCES VEHICULO(idVehiculo) ON DELETE CASCADE,
    FOREIGN KEY (idAseguradora) REFERENCES ASEGURADORA(idAseguradora) ON DELETE CASCADE
);

-- Tabla intermedia REALIZA (relación N.N entre CLIENTE y VEHICULO)
CREATE TABLE REALIZA (
    idCliente INTEGER NOT NULL,
    idVehiculo INTEGER NOT NULL,
    idTransaccion INTEGER NOT NULL,
    monto NUMERIC(10, 2) NOT NULL,
    fecha DATE NOT NULL,
    PRIMARY KEY (idCliente, idVehiculo, idTransaccion),
    FOREIGN KEY (idCliente) REFERENCES CLIENTE(idCliente) ON DELETE CASCADE,
    FOREIGN KEY (idVehiculo) REFERENCES VEHICULO(idVehiculo) ON DELETE CASCADE,
    FOREIGN KEY (idTransaccion) REFERENCES TRANSACCION(idTransaccion) ON DELETE CASCADE
);

