-- Inserción de datos en la tabla PERSONA
INSERT INTO PERSONA (idPersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento) VALUES
(1023, 'Luis', 'Martinez', 'Soto', 'Calle 5, La Paz', '71234567', 'luis.martinez@example.com', TO_DATE('1990-05-12', 'YYYY-MM-DD'));
INSERT INTO PERSONA (idPersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento) VALUES
(1056, 'Andrea', 'Lopez', 'Rios', 'Calle 12, Cochabamba', '71234890', 'andrea.lopez@example.com', TO_DATE('1988-07-22', 'YYYY-MM-DD'));
INSERT INTO PERSONA (idPersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento) VALUES
(1129, 'Carlos', 'Gomez', 'Torrez', 'Av. Blanco, Sucre', '72345678', 'carlos.gomez@example.com', TO_DATE('1992-10-03', 'YYYY-MM-DD'));
INSERT INTO PERSONA (idPersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento) VALUES
(1004, 'Maria', 'Perez', 'Sanchez', 'Calle Flores, Oruro', '78901234', 'maria.perez@example.com', TO_DATE('1985-12-01', 'YYYY-MM-DD'));
INSERT INTO PERSONA (idPersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento) VALUES
(1088, 'Diego', 'Salazar', 'Garcia', 'Av. Sucre, Potosi', '71230678', 'diego.salazar@example.com', TO_DATE('1995-03-14', 'YYYY-MM-DD'));
INSERT INTO PERSONA (idPersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento) VALUES
(1203, 'Ana', 'Fernandez', 'Romero', 'Calle Colon, Tarija', '78905432', 'ana.fernandez@example.com', TO_DATE('1987-06-09', 'YYYY-MM-DD'));
INSERT INTO PERSONA (idPersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento) VALUES
(1145, 'Jorge', 'Vargas', 'Mendoza', 'Av. Blanco Galindo, Cochabamba', '71239876', 'jorge.vargas@example.com', TO_DATE('1993-04-27', 'YYYY-MM-DD'));
INSERT INTO PERSONA (idPersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento) VALUES
(1112, 'Raquel', 'Paredes', 'Gutierrez', 'Calle 10, Santa Cruz', '75432109', 'raquel.paredes@example.com', TO_DATE('1989-02-17', 'YYYY-MM-DD'));
INSERT INTO PERSONA (idPersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento) VALUES
(1039, 'Oscar', 'Rivero', 'Perez', 'Av. San Martin, La Paz', '76789012', 'oscar.rivero@example.com', TO_DATE('1991-08-22', 'YYYY-MM-DD'));
INSERT INTO PERSONA (idPersona, nombre, paterno, materno, direccion, telefono, email, fecha_nacimiento) VALUES
(1075, 'Carla', 'Mendoza', 'Alvarez', 'Calle Bolivar, Beni', '77123456', 'carla.mendoza@example.com', TO_DATE('1986-11-30', 'YYYY-MM-DD'));

-- Inserción de datos en la tabla CLIENTE
INSERT INTO CLIENTE (idCliente, idPersona, fecha_registro) VALUES
(120, 1023, TO_DATE('2021-04-15', 'YYYY-MM-DD'));
INSERT INTO CLIENTE (idCliente, idPersona, fecha_registro) VALUES
(135, 1056, TO_DATE('2020-11-20', 'YYYY-MM-DD'));
INSERT INTO CLIENTE (idCliente, idPersona, fecha_registro) VALUES
(142, 1129, TO_DATE('2019-07-10', 'YYYY-MM-DD'));
INSERT INTO CLIENTE (idCliente, idPersona, fecha_registro) VALUES
(150, 1004, TO_DATE('2022-03-30', 'YYYY-MM-DD'));
INSERT INTO CLIENTE (idCliente, idPersona, fecha_registro) VALUES
(118, 1088, TO_DATE('2021-09-15', 'YYYY-MM-DD'));
INSERT INTO CLIENTE (idCliente, idPersona, fecha_registro) VALUES
(126, 1203, TO_DATE('2023-01-25', 'YYYY-MM-DD'));
INSERT INTO CLIENTE (idCliente, idPersona, fecha_registro) VALUES
(139, 1145, TO_DATE('2021-08-17', 'YYYY-MM-DD'));
INSERT INTO CLIENTE (idCliente, idPersona, fecha_registro) VALUES
(147, 1112, TO_DATE('2020-02-05', 'YYYY-MM-DD'));
INSERT INTO CLIENTE (idCliente, idPersona, fecha_registro) VALUES
(131, 1039, TO_DATE('2022-06-01', 'YYYY-MM-DD'));
INSERT INTO CLIENTE (idCliente, idPersona, fecha_registro) VALUES
(155, 1075, TO_DATE('2023-07-14', 'YYYY-MM-DD'));

-- Inserción de datos en la tabla EMPLEADO
INSERT INTO EMPLEADO (idEmpleado, idPersona, email, ci, comisionES) VALUES
(210, 1023, 'luis.empresa@example.com', '12345678', '5%');
INSERT INTO EMPLEADO (idEmpleado, idPersona, email, ci, comisionES) VALUES
(205, 1056, 'andrea.empresa@example.com', '87654321', '10%');
INSERT INTO EMPLEADO (idEmpleado, idPersona, email, ci, comisionES) VALUES
(220, 1129, 'carlos.empresa@example.com', '11223344', '15%');
INSERT INTO EMPLEADO (idEmpleado, idPersona, email, ci, comisionES) VALUES
(212, 1004, 'maria.empresa@example.com', '22334455', '8%');
INSERT INTO EMPLEADO (idEmpleado, idPersona, email, ci, comisionES) VALUES
(219, 1088, 'diego.empresa@example.com', '33445566', '12%');
INSERT INTO EMPLEADO (idEmpleado, idPersona, email, ci, comisionES) VALUES
(211, 1203, 'ana.empresa@example.com', '44556677', '7%');
INSERT INTO EMPLEADO (idEmpleado, idPersona, email, ci, comisionES) VALUES
(214, 1145, 'jorge.empresa@example.com', '55667788', '9%');
INSERT INTO EMPLEADO (idEmpleado, idPersona, email, ci, comisionES) VALUES
(218, 1112, 'raquel.empresa@example.com', '66778899', '11%');
INSERT INTO EMPLEADO (idEmpleado, idPersona, email, ci, comisionES) VALUES
(213, 1039, 'oscar.empresa@example.com', '77889900', '6%');
INSERT INTO EMPLEADO (idEmpleado, idPersona, email, ci, comisionES) VALUES
(215, 1075, 'carla.empresa@example.com', '88990011', '4%');

-- Inserción de datos en la tabla USUARIO
INSERT INTO USUARIO (idUsuario, idEmpleado, nombreUsuario, contrasena, rolUsuario) VALUES
(301, 210, 'luis_m', 'pass123', 'Admin');
INSERT INTO USUARIO (idUsuario, idEmpleado, nombreUsuario, contrasena, rolUsuario) VALUES
(302, 205, 'andrea_l', 'pass456', 'User');
INSERT INTO USUARIO (idUsuario, idEmpleado, nombreUsuario, contrasena, rolUsuario) VALUES
(303, 220, 'carlos_g', 'pass789', 'Supervisor');
INSERT INTO USUARIO (idUsuario, idEmpleado, nombreUsuario, contrasena, rolUsuario) VALUES
(304, 212, 'maria_p', 'pass321', 'Admin');
INSERT INTO USUARIO (idUsuario, idEmpleado, nombreUsuario, contrasena, rolUsuario) VALUES
(305, 219, 'diego_s', 'pass654', 'User');
INSERT INTO USUARIO (idUsuario, idEmpleado, nombreUsuario, contrasena, rolUsuario) VALUES
(306, 211, 'ana_f', 'pass987', 'Supervisor');
INSERT INTO USUARIO (idUsuario, idEmpleado, nombreUsuario, contrasena, rolUsuario) VALUES
(307, 214, 'jorge_v', 'pass234', 'User');
INSERT INTO USUARIO (idUsuario, idEmpleado, nombreUsuario, contrasena, rolUsuario) VALUES
(308, 218, 'raquel_p', 'pass765', 'Admin');
INSERT INTO USUARIO (idUsuario, idEmpleado, nombreUsuario, contrasena, rolUsuario) VALUES
(309, 213, 'oscar_r', 'pass876', 'User');
INSERT INTO USUARIO (idUsuario, idEmpleado, nombreUsuario, contrasena, rolUsuario) VALUES
(310, 215, 'carla_m', 'pass098', 'Supervisor');

-- Inserción de datos en la tabla RESERVA
INSERT INTO RESERVA (idReserva, idCliente, idEmpleado, fechaInicio, fechaFin, contrato) VALUES
(401, 120, 210, TO_DATE('2024-05-15', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'R-001');
INSERT INTO RESERVA (idReserva, idCliente, idEmpleado, fechaInicio, fechaFin, contrato) VALUES
(402, 135, 205, TO_DATE('2023-12-01', 'YYYY-MM-DD'), TO_DATE('2023-12-20', 'YYYY-MM-DD'), 'R-002');
INSERT INTO RESERVA (idReserva, idCliente, idEmpleado, fechaInicio, fechaFin, contrato) VALUES
(403, 142, 220, TO_DATE('2023-07-10', 'YYYY-MM-DD'), TO_DATE('2023-07-25', 'YYYY-MM-DD'), 'R-003');
INSERT INTO RESERVA (idReserva, idCliente, idEmpleado, fechaInicio, fechaFin, contrato) VALUES
(404, 150, 212, TO_DATE('2024-02-10', 'YYYY-MM-DD'), TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'R-004');
INSERT INTO RESERVA (idReserva, idCliente, idEmpleado, fechaInicio, fechaFin, contrato) VALUES
(405, 118, 219, TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-01-30', 'YYYY-MM-DD'), 'R-005');
INSERT INTO RESERVA (idReserva, idCliente, idEmpleado, fechaInicio, fechaFin, contrato) VALUES
(406, 126, 211, TO_DATE('2023-09-05', 'YYYY-MM-DD'), TO_DATE('2023-09-15', 'YYYY-MM-DD'), 'R-006');
INSERT INTO RESERVA (idReserva, idCliente, idEmpleado, fechaInicio, fechaFin, contrato) VALUES
(407, 139, 214, TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 'R-007');
INSERT INTO RESERVA (idReserva, idCliente, idEmpleado, fechaInicio, fechaFin, contrato) VALUES
(408, 147, 218, TO_DATE('2023-05-15', 'YYYY-MM-DD'), TO_DATE('2023-05-25', 'YYYY-MM-DD'), 'R-008');
INSERT INTO RESERVA (idReserva, idCliente, idEmpleado, fechaInicio, fechaFin, contrato) VALUES
(409, 131, 213, TO_DATE('2023-06-10', 'YYYY-MM-DD'), TO_DATE('2023-06-20', 'YYYY-MM-DD'), 'R-009');
INSERT INTO RESERVA (idReserva, idCliente, idEmpleado, fechaInicio, fechaFin, contrato) VALUES
(410, 155, 215, TO_DATE('2024-08-05', 'YYYY-MM-DD'), TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'R-010');

-- Inserción de datos en la tabla FIDELIZACION
INSERT INTO FIDELIZACION (idFidelizacion, idCliente, puntos, nivel) VALUES
(501, 120, 150, 'Bronce');
INSERT INTO FIDELIZACION (idFidelizacion, idCliente, puntos, nivel) VALUES
(502, 135, 250, 'Plata');
INSERT INTO FIDELIZACION (idFidelizacion, idCliente, puntos, nivel) VALUES
(503, 142, 350, 'Oro');
INSERT INTO FIDELIZACION (idFidelizacion, idCliente, puntos, nivel) VALUES
(504, 150, 100, 'Bronce');
INSERT INTO FIDELIZACION (idFidelizacion, idCliente, puntos, nivel) VALUES
(505, 118, 200, 'Plata');
INSERT INTO FIDELIZACION (idFidelizacion, idCliente, puntos, nivel) VALUES
(506, 126, 400, 'Oro');
INSERT INTO FIDELIZACION (idFidelizacion, idCliente, puntos, nivel) VALUES
(507, 139, 180, 'Bronce');
INSERT INTO FIDELIZACION (idFidelizacion, idCliente, puntos, nivel) VALUES
(508, 147, 280, 'Plata');
INSERT INTO FIDELIZACION (idFidelizacion, idCliente, puntos, nivel) VALUES
(509, 131, 320, 'Oro');
INSERT INTO FIDELIZACION (idFidelizacion, idCliente, puntos, nivel) VALUES
(510, 155, 220, 'Plata');


-- Inserciones para la tabla MARCA
INSERT INTO MARCA (idMarca, nombreMarca, descripcion, paisMarca) VALUES
(1, 'Toyota', 'Marca japonesa de vehículos confiable y popular', 'Japón');
INSERT INTO MARCA (idMarca, nombreMarca, descripcion, paisMarca) VALUES
(2, 'Ford', 'Pionera en la industria automotriz', 'Estados Unidos');
INSERT INTO MARCA (idMarca, nombreMarca, descripcion, paisMarca) VALUES
(3, 'BMW', 'Fabricante alemán de autos de lujo', 'Alemania');
INSERT INTO MARCA (idMarca, nombreMarca, descripcion, paisMarca) VALUES
(4, 'Chevrolet', 'Marca estadounidense de autos y camionetas', 'Estados Unidos');
INSERT INTO MARCA (idMarca, nombreMarca, descripcion, paisMarca) VALUES
(5, 'Hyundai', 'Marca de vehículos coreana', 'Corea del Sur');
INSERT INTO MARCA (idMarca, nombreMarca, descripcion, paisMarca) VALUES
(6, 'Honda', 'Marca japonesa con una gran variedad de vehículos', 'Japón');
INSERT INTO MARCA (idMarca, nombreMarca, descripcion, paisMarca) VALUES
(7, 'Kia', 'Fabricante surcoreano de vehículos', 'Corea del Sur');
INSERT INTO MARCA (idMarca, nombreMarca, descripcion, paisMarca) VALUES
(8, 'Audi', 'Marca alemana de autos de lujo', 'Alemania');
INSERT INTO MARCA (idMarca, nombreMarca, descripcion, paisMarca) VALUES
(9, 'Nissan', 'Marca japonesa conocida por sus modelos económicos', 'Japón');
INSERT INTO MARCA (idMarca, nombreMarca, descripcion, paisMarca) VALUES
(10, 'Volkswagen', 'Fabricante alemán de vehículos confiable', 'Alemania');

-- Inserciones para la tabla ESTADO_VEHICULO
INSERT INTO ESTADO_VEHICULO (idEstadoVehiculo, nombre_estado, descripcion) VALUES
(1, 'Disponible', 'Vehículo disponible para reserva o venta');
INSERT INTO ESTADO_VEHICULO (idEstadoVehiculo, nombre_estado, descripcion) VALUES
(2, 'En Mantenimiento', 'Vehículo en revisión o reparación');
INSERT INTO ESTADO_VEHICULO (idEstadoVehiculo, nombre_estado, descripcion) VALUES
(3, 'Alquilado', 'Vehículo actualmente alquilado');
INSERT INTO ESTADO_VEHICULO (idEstadoVehiculo, nombre_estado, descripcion) VALUES
(4, 'Vendido', 'Vehículo vendido, no disponible');
INSERT INTO ESTADO_VEHICULO (idEstadoVehiculo, nombre_estado, descripcion) VALUES
(5, 'Reservado', 'Vehículo reservado por un cliente');
INSERT INTO ESTADO_VEHICULO (idEstadoVehiculo, nombre_estado, descripcion) VALUES
(6, 'En Traslado', 'Vehículo en transporte hacia una ubicación');
INSERT INTO ESTADO_VEHICULO (idEstadoVehiculo, nombre_estado, descripcion) VALUES
(7, 'Pendiente de Inspección', 'Requiere inspección antes de alquiler o venta');
INSERT INTO ESTADO_VEHICULO (idEstadoVehiculo, nombre_estado, descripcion) VALUES
(8, 'En Exhibición', 'Vehículo en exposición para venta');
INSERT INTO ESTADO_VEHICULO (idEstadoVehiculo, nombre_estado, descripcion) VALUES
(9, 'Retirado de Inventario', 'Vehículo no disponible para operaciones');
INSERT INTO ESTADO_VEHICULO (idEstadoVehiculo, nombre_estado, descripcion) VALUES
(10, 'En Reparación', 'Vehículo siendo reparado por daño');

-- Inserciones para la tabla VEHICULO
INSERT INTO VEHICULO (idVehiculo, anio, modelo, precioDiario, precioDolar, caracteristicas, idEstadoVehiculo, idMarca) VALUES
(1, 2020, 'Corolla', 55.00, 15000.00, 'Compacto, eficiente en combustible', 1, 1);
INSERT INTO VEHICULO (idVehiculo, anio, modelo, precioDiario, precioDolar, caracteristicas, idEstadoVehiculo, idMarca) VALUES
(2, 2019, 'Focus', 50.00, 14000.00, 'Compacto, motor turbo', 3, 2);
INSERT INTO VEHICULO (idVehiculo, anio, modelo, precioDiario, precioDolar, caracteristicas, idEstadoVehiculo, idMarca) VALUES
(3, 2022, 'X5', 120.00, 60000.00, 'SUV de lujo, gran capacidad', 8, 3);
INSERT INTO VEHICULO (idVehiculo, anio, modelo, precioDiario, precioDolar, caracteristicas, idEstadoVehiculo, idMarca) VALUES
(4, 2018, 'Cruze', 45.00, 13000.00, 'Sedán, económico y espacioso', 1, 4);
INSERT INTO VEHICULO (idVehiculo, anio, modelo, precioDiario, precioDolar, caracteristicas, idEstadoVehiculo, idMarca) VALUES
(5, 2021, 'Elantra', 53.00, 15500.00, 'Compacto, tecnología avanzada', 1, 5);
INSERT INTO VEHICULO (idVehiculo, anio, modelo, precioDiario, precioDolar, caracteristicas, idEstadoVehiculo, idMarca) VALUES
(6, 2019, 'Civic', 55.00, 14500.00, 'Compacto deportivo', 2, 6);
INSERT INTO VEHICULO (idVehiculo, anio, modelo, precioDiario, precioDolar, caracteristicas, idEstadoVehiculo, idMarca) VALUES
(7, 2020, 'Sportage', 70.00, 18000.00, 'SUV, gran espacio', 1, 7);
INSERT INTO VEHICULO (idVehiculo, anio, modelo, precioDiario, precioDolar, caracteristicas, idEstadoVehiculo, idMarca) VALUES
(8, 2021, 'A4', 115.00, 55000.00, 'Sedán de lujo', 3, 8);
INSERT INTO VEHICULO (idVehiculo, anio, modelo, precioDiario, precioDolar, caracteristicas, idEstadoVehiculo, idMarca) VALUES
(9, 2017, 'Sentra', 42.00, 12000.00, 'Compacto asequible', 4, 9);
INSERT INTO VEHICULO (idVehiculo, anio, modelo, precioDiario, precioDolar, caracteristicas, idEstadoVehiculo, idMarca) VALUES
(10, 2018, 'Jetta', 50.00, 16000.00, 'Compacto confiable', 5, 10);


-- Inserciones para la tabla SEGUIMIENTO_VEHICULO
INSERT INTO SEGUIMIENTO_VEHICULO (id, idVehiculo, ubicacionActual, ultimaFechaActualizacion) VALUES
(1, 1, 'Sede Principal', TO_DATE('2024-10-15', 'YYYY-MM-DD'));
INSERT INTO SEGUIMIENTO_VEHICULO (id, idVehiculo, ubicacionActual, ultimaFechaActualizacion) VALUES
(2, 2, 'Sucursal Norte', TO_DATE('2024-10-14', 'YYYY-MM-DD'));
INSERT INTO SEGUIMIENTO_VEHICULO (id, idVehiculo, ubicacionActual, ultimaFechaActualizacion) VALUES
(3, 3, 'Sucursal Oeste', TO_DATE('2024-10-13', 'YYYY-MM-DD'));
INSERT INTO SEGUIMIENTO_VEHICULO (id, idVehiculo, ubicacionActual, ultimaFechaActualizacion) VALUES
(4, 4, 'Sucursal Sur', TO_DATE('2024-10-12', 'YYYY-MM-DD'));
INSERT INTO SEGUIMIENTO_VEHICULO (id, idVehiculo, ubicacionActual, ultimaFechaActualizacion) VALUES
(5, 5, 'Sede Principal', TO_DATE('2024-10-11', 'YYYY-MM-DD'));
INSERT INTO SEGUIMIENTO_VEHICULO (id, idVehiculo, ubicacionActual, ultimaFechaActualizacion) VALUES
(6, 6, 'Sucursal Este', TO_DATE('2024-10-10', 'YYYY-MM-DD'));
INSERT INTO SEGUIMIENTO_VEHICULO (id, idVehiculo, ubicacionActual, ultimaFechaActualizacion) VALUES
(7, 7, 'Sucursal Norte', TO_DATE('2024-10-09', 'YYYY-MM-DD'));
INSERT INTO SEGUIMIENTO_VEHICULO (id, idVehiculo, ubicacionActual, ultimaFechaActualizacion) VALUES
(8, 8, 'Sucursal Oeste', TO_DATE('2024-10-08', 'YYYY-MM-DD'));
INSERT INTO SEGUIMIENTO_VEHICULO (id, idVehiculo, ubicacionActual, ultimaFechaActualizacion) VALUES
(9, 9, 'Sede Principal', TO_DATE('2024-10-07', 'YYYY-MM-DD'));
INSERT INTO SEGUIMIENTO_VEHICULO (id, idVehiculo, ubicacionActual, ultimaFechaActualizacion) VALUES
(10, 10, 'Sucursal Sur', TO_DATE('2024-10-06', 'YYYY-MM-DD'));


-- Inserciones para la tabla MANTENIMIENTO
INSERT INTO MANTENIMIENTO (idMantenimiento, idVehiculo, descripcion, estado, fechaMantenimiento) VALUES
(1, 1, 'Cambio de aceite y filtros', 'Completado', TO_DATE('2024-10-10', 'YYYY-MM-DD'));
INSERT INTO MANTENIMIENTO (idMantenimiento, idVehiculo, descripcion, estado, fechaMantenimiento) VALUES
(2, 2, 'Reparación del sistema de frenos', 'Pendiente', TO_DATE('2024-10-12', 'YYYY-MM-DD'));
INSERT INTO MANTENIMIENTO (idMantenimiento, idVehiculo, descripcion, estado, fechaMantenimiento) VALUES
(3, 3, 'Mantenimiento de transmisión', 'En progreso', TO_DATE('2024-10-14', 'YYYY-MM-DD'));
INSERT INTO MANTENIMIENTO (idMantenimiento, idVehiculo, descripcion, estado, fechaMantenimiento) VALUES
(4, 4, 'Alineación de ruedas', 'Completado', TO_DATE('2024-10-15', 'YYYY-MM-DD'));
INSERT INTO MANTENIMIENTO (idMantenimiento, idVehiculo, descripcion, estado, fechaMantenimiento) VALUES
(5, 5, 'Revisión general', 'En espera', TO_DATE('2024-10-16', 'YYYY-MM-DD'));
INSERT INTO MANTENIMIENTO (idMantenimiento, idVehiculo, descripcion, estado, fechaMantenimiento) VALUES
(6, 6, 'Reparación de suspensión', 'En progreso', TO_DATE('2024-10-17', 'YYYY-MM-DD'));
INSERT INTO MANTENIMIENTO (idMantenimiento, idVehiculo, descripcion, estado, fechaMantenimiento) VALUES
(7, 7, 'Cambio de bujías', 'Completado', TO_DATE('2024-10-18', 'YYYY-MM-DD'));
INSERT INTO MANTENIMIENTO (idMantenimiento, idVehiculo, descripcion, estado, fechaMantenimiento) VALUES
(8, 8, 'Revisión del sistema de escape', 'Pendiente', TO_DATE('2024-10-19', 'YYYY-MM-DD'));
INSERT INTO MANTENIMIENTO (idMantenimiento, idVehiculo, descripcion, estado, fechaMantenimiento) VALUES
(9, 9, 'Inspección de carrocería', 'En espera', TO_DATE('2024-10-20', 'YYYY-MM-DD'));
INSERT INTO MANTENIMIENTO (idMantenimiento, idVehiculo, descripcion, estado, fechaMantenimiento) VALUES
(10, 10, 'Revisión eléctrica', 'Completado', TO_DATE('2024-10-21', 'YYYY-MM-DD'));

-- Inserciones para la tabla REPUESTOS
INSERT INTO REPUESTOS (idRepuestos, nombre, descripcion) VALUES
(1, 'Filtro de aire', 'Filtro de aire para motor');
INSERT INTO REPUESTOS (idRepuestos, nombre, descripcion) VALUES
(2, 'Pastillas de freno', 'Pastillas de freno delanteras y traseras');
INSERT INTO REPUESTOS (idRepuestos, nombre, descripcion) VALUES
(3, 'Bujías', 'Bujías para motor de 4 cilindros');
INSERT INTO REPUESTOS (idRepuestos, nombre, descripcion) VALUES
(4, 'Aceite sintético', 'Aceite de motor 5W-30');
INSERT INTO REPUESTOS (idRepuestos, nombre, descripcion) VALUES
(5, 'Filtro de aceite', 'Filtro de aceite para motor');
INSERT INTO REPUESTOS (idRepuestos, nombre, descripcion) VALUES
(6, 'Amortiguador', 'Amortiguador delantero');
INSERT INTO REPUESTOS (idRepuestos, nombre, descripcion) VALUES
(7, 'Correa de distribución', 'Correa para el sistema de distribución');
INSERT INTO REPUESTOS (idRepuestos, nombre, descripcion) VALUES
(8, 'Batería', 'Batería para sistema de encendido');
INSERT INTO REPUESTOS (idRepuestos, nombre, descripcion) VALUES
(9, 'Neumático', 'Neumático radial 195/65 R15');
INSERT INTO REPUESTOS (idRepuestos, nombre, descripcion) VALUES
(10, 'Espejo lateral', 'Espejo lateral derecho');

-- Inserciones para la tabla MANTENIMIENTO_REPUESTOS
INSERT INTO MANTENIMIENTO_REPUESTOS (id, idMantenimiento, idRepuestos, cantidad) VALUES
(1, 1, 1, 1);
INSERT INTO MANTENIMIENTO_REPUESTOS (id, idMantenimiento, idRepuestos, cantidad) VALUES
(2, 2, 2, 1);
INSERT INTO MANTENIMIENTO_REPUESTOS (id, idMantenimiento, idRepuestos, cantidad) VALUES
(3, 3, 3, 4);
INSERT INTO MANTENIMIENTO_REPUESTOS (id, idMantenimiento, idRepuestos, cantidad) VALUES
(4, 4, 4, 3);
INSERT INTO MANTENIMIENTO_REPUESTOS (id, idMantenimiento, idRepuestos, cantidad) VALUES
(5, 5, 5, 2);
INSERT INTO MANTENIMIENTO_REPUESTOS (id, idMantenimiento, idRepuestos, cantidad) VALUES
(6, 6, 6, 1);
INSERT INTO MANTENIMIENTO_REPUESTOS (id, idMantenimiento, idRepuestos, cantidad) VALUES
(7, 7, 7, 1);
INSERT INTO MANTENIMIENTO_REPUESTOS (id, idMantenimiento, idRepuestos, cantidad) VALUES
(8, 8, 8, 1);
INSERT INTO MANTENIMIENTO_REPUESTOS (id, idMantenimiento, idRepuestos, cantidad) VALUES
(9, 9, 9, 4);
INSERT INTO MANTENIMIENTO_REPUESTOS (id, idMantenimiento, idRepuestos, cantidad) VALUES
(10, 10, 10, 1);

-- Inserciones para la tabla TIPO_CAMBIO
INSERT INTO TIPO_CAMBIO (idTipoCambio, fechaTipoCambio, valorDolar) VALUES
(1, TO_DATE('2024-10-10', 'YYYY-MM-DD'), 6.91);
INSERT INTO TIPO_CAMBIO (idTipoCambio, fechaTipoCambio, valorDolar) VALUES
(2, TO_DATE('2024-10-11', 'YYYY-MM-DD'), 6.89);
INSERT INTO TIPO_CAMBIO (idTipoCambio, fechaTipoCambio, valorDolar) VALUES
(3, TO_DATE('2024-10-12', 'YYYY-MM-DD'), 6.92);
INSERT INTO TIPO_CAMBIO (idTipoCambio, fechaTipoCambio, valorDolar) VALUES
(4, TO_DATE('2024-10-13', 'YYYY-MM-DD'), 6.90);
INSERT INTO TIPO_CAMBIO (idTipoCambio, fechaTipoCambio, valorDolar) VALUES
(5, TO_DATE('2024-10-14', 'YYYY-MM-DD'), 6.93);
INSERT INTO TIPO_CAMBIO (idTipoCambio, fechaTipoCambio, valorDolar) VALUES
(6, TO_DATE('2024-10-15', 'YYYY-MM-DD'), 6.94);
INSERT INTO TIPO_CAMBIO (idTipoCambio, fechaTipoCambio, valorDolar) VALUES
(7, TO_DATE('2024-10-16', 'YYYY-MM-DD'), 6.95);
INSERT INTO TIPO_CAMBIO (idTipoCambio, fechaTipoCambio, valorDolar) VALUES
(8, TO_DATE('2024-10-17', 'YYYY-MM-DD'), 6.90);
INSERT INTO TIPO_CAMBIO (idTipoCambio, fechaTipoCambio, valorDolar) VALUES
(9, TO_DATE('2024-10-18', 'YYYY-MM-DD'), 6.89);
INSERT INTO TIPO_CAMBIO (idTipoCambio, fechaTipoCambio, valorDolar) VALUES
(10, TO_DATE('2024-10-19', 'YYYY-MM-DD'), 6.88);


-- Inserciones para la tabla TRANSACCION
INSERT INTO TRANSACCION (idTransaccion, idCliente, tipoTransaccion, fechaTransaccion, costo, idTipoCambio) VALUES
(1, 120, 'Alquiler', TO_DATE('2024-10-10', 'YYYY-MM-DD'), 550.00, 1);
INSERT INTO TRANSACCION (idTransaccion, idCliente, tipoTransaccion, fechaTransaccion, costo, idTipoCambio) VALUES
(2, 135, 'Venta', TO_DATE('2024-10-12', 'YYYY-MM-DD'), 15000.00, 2);
INSERT INTO TRANSACCION (idTransaccion, idCliente, tipoTransaccion, fechaTransaccion, costo, idTipoCambio) VALUES
(3, 142, 'Alquiler', TO_DATE('2024-10-14', 'YYYY-MM-DD'), 650.00, 3);
INSERT INTO TRANSACCION (idTransaccion, idCliente, tipoTransaccion, fechaTransaccion, costo, idTipoCambio) VALUES
(4, 150, 'Venta', TO_DATE('2024-10-15', 'YYYY-MM-DD'), 18000.00, 4);
INSERT INTO TRANSACCION (idTransaccion, idCliente, tipoTransaccion, fechaTransaccion, costo, idTipoCambio) VALUES
(5, 118, 'Alquiler', TO_DATE('2024-10-16', 'YYYY-MM-DD'), 500.00, 5);
INSERT INTO TRANSACCION (idTransaccion, idCliente, tipoTransaccion, fechaTransaccion, costo, idTipoCambio) VALUES
(6, 126, 'Alquiler', TO_DATE('2024-10-17', 'YYYY-MM-DD'), 720.00, 6);
INSERT INTO TRANSACCION (idTransaccion, idCliente, tipoTransaccion, fechaTransaccion, costo, idTipoCambio) VALUES
(7, 139, 'Venta', TO_DATE('2024-10-18', 'YYYY-MM-DD'), 21000.00, 7);
INSERT INTO TRANSACCION (idTransaccion, idCliente, tipoTransaccion, fechaTransaccion, costo, idTipoCambio) VALUES
(8, 147, 'Alquiler', TO_DATE('2024-10-19', 'YYYY-MM-DD'), 450.00, 8);
INSERT INTO TRANSACCION (idTransaccion, idCliente, tipoTransaccion, fechaTransaccion, costo, idTipoCambio) VALUES
(9, 131, 'Venta', TO_DATE('2024-10-20', 'YYYY-MM-DD'), 13000.00, 9);
INSERT INTO TRANSACCION (idTransaccion, idCliente, tipoTransaccion, fechaTransaccion, costo, idTipoCambio) VALUES
(10, 155, 'Alquiler', TO_DATE('2024-10-21', 'YYYY-MM-DD'), 400.00, 10);


-- Inserciones para la tabla ASEGURADORA
INSERT INTO ASEGURADORA (idAseguradora, nombreAseguradora, contactoAseguradora) VALUES
(1, 'Allianz', 'allianz@contacto.com');
INSERT INTO ASEGURADORA (idAseguradora, nombreAseguradora, contactoAseguradora) VALUES
(2, 'Mapfre', 'mapfre@contacto.com');
INSERT INTO ASEGURADORA (idAseguradora, nombreAseguradora, contactoAseguradora) VALUES
(3, 'AXA', 'axa@contacto.com');
INSERT INTO ASEGURADORA (idAseguradora, nombreAseguradora, contactoAseguradora) VALUES
(4, 'Liberty Seguros', 'liberty@contacto.com');
INSERT INTO ASEGURADORA (idAseguradora, nombreAseguradora, contactoAseguradora) VALUES
(5, 'Zurich', 'zurich@contacto.com');

-- Inserciones para la tabla SEGURO
INSERT INTO SEGURO (idSeguro, idVehiculo, idAseguradora, fechaInicio, fechaFin, tipoSeguro, costo) VALUES
(1, 1, 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'Cobertura Completa', 1500.00);
INSERT INTO SEGURO (idSeguro, idVehiculo, idAseguradora, fechaInicio, fechaFin, tipoSeguro, costo) VALUES
(2, 2, 2, TO_DATE('2024-02-15', 'YYYY-MM-DD'), TO_DATE('2025-02-15', 'YYYY-MM-DD'), 'Responsabilidad Civil', 1200.00);
INSERT INTO SEGURO (idSeguro, idVehiculo, idAseguradora, fechaInicio, fechaFin, tipoSeguro, costo) VALUES
(3, 3, 3, TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2025-03-10', 'YYYY-MM-DD'), 'Cobertura Total', 1800.00);
INSERT INTO SEGURO (idSeguro, idVehiculo, idAseguradora, fechaInicio, fechaFin, tipoSeguro, costo) VALUES
(4, 4, 4, TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2025-04-05', 'YYYY-MM-DD'), 'Cobertura Completa', 1700.00);
INSERT INTO SEGURO (idSeguro, idVehiculo, idAseguradora, fechaInicio, fechaFin, tipoSeguro, costo) VALUES
(5, 5, 5, TO_DATE('2024-05-20', 'YYYY-MM-DD'), TO_DATE('2025-05-20', 'YYYY-MM-DD'), 'Riesgo de Daños', 1300.00);
INSERT INTO SEGURO (idSeguro, idVehiculo, idAseguradora, fechaInicio, fechaFin, tipoSeguro, costo) VALUES
(6, 6, 1, TO_DATE('2024-06-15', 'YYYY-MM-DD'), TO_DATE('2025-06-15', 'YYYY-MM-DD'), 'Cobertura Completa', 1400.00);
INSERT INTO SEGURO (idSeguro, idVehiculo, idAseguradora, fechaInicio, fechaFin, tipoSeguro, costo) VALUES
(7, 7, 2, TO_DATE('2024-07-01', 'YYYY-MM-DD'), TO_DATE('2025-07-01', 'YYYY-MM-DD'), 'Responsabilidad Civil', 1150.00);
INSERT INTO SEGURO (idSeguro, idVehiculo, idAseguradora, fechaInicio, fechaFin, tipoSeguro, costo) VALUES
(8, 8, 3, TO_DATE('2024-08-10', 'YYYY-MM-DD'), TO_DATE('2025-08-10', 'YYYY-MM-DD'), 'Cobertura Completa', 1650.00);
INSERT INTO SEGURO (idSeguro, idVehiculo, idAseguradora, fechaInicio, fechaFin, tipoSeguro, costo) VALUES
(9, 9, 4, TO_DATE('2024-09-12', 'YYYY-MM-DD'), TO_DATE('2025-09-12', 'YYYY-MM-DD'), 'Cobertura Completa', 1550.00);
INSERT INTO SEGURO (idSeguro, idVehiculo, idAseguradora, fechaInicio, fechaFin, tipoSeguro, costo) VALUES
(10, 10, 5, TO_DATE('2024-10-20', 'YYYY-MM-DD'), TO_DATE('2025-10-20', 'YYYY-MM-DD'), 'Cobertura Completa', 1450.00);