1. **Cuando se inserta un nuevo cliente, si su estado es inactivo, actualizar automáticamente la fecha de afiliación a NULL**

DELIMITER //

CREATE TRIGGER actualizarFechaAfiliacionCliente
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN
  IF NEW.estado = 0 THEN
    SET NEW.fecha_afiliacion = '0000-00-00';
  END IF;
END //

DELIMITER ;

2. **Antes de insertar una nueva venta, verificar si la cantidad disponible en PRODUCTO es suficiente para realizar la venta**

DELIMITER //

CREATE TRIGGER verificarCantidadProductos
BEFORE INSERT ON VENTA_PRODUCTO FOR EACH ROW
BEGIN
  IF (SELECT cantidad FROM producto WHERE producto_id = NEW.producto_id) < NEW.cantidad THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede vender este producto, debido a que no tiene existencias';
  END IF;
END //

DELIMITER ;

3. **Después de una venta, disminuir la cantidad del producto**

DELIMITER //

CREATE TRIGGER disminuirCantidadProducto
AFTER INSERT ON VENTA_PRODUCTO FOR EACH ROW
BEGIN
  UPDATE PRODUCTO
  SET cantidad = (cantidad - NEW.cantidad)
  WHERE producto_id = NEW.producto_id;
END //

DELIMITER ;

4. **Cuando se elimina un empleado, actualizar automáticamente su estado en la tabla HISTORIAL_EMPLEADO como "Inactivo"**

DELIMITER //

CREATE TRIGGER eliminarHistorialEmpleado
AFTER DELETE ON EMPLEADO FOR EACH ROW
BEGIN
  DELETE FROM HISTORIAL_EMPLEADO
  WHERE cc_empleado = OLD.cc_empleado;
END //

DELIMITER ;

5. **Antes de insertar un nuevo producto, verificar que su fecha de vencimiento no sea anterior a la fecha actual**

DELIMITER //

CREATE TRIGGER verificarFechaVencimientoProducto
BEFORE INSERT ON PRODUCTO FOR EACH ROW
BEGIN
  IF NEW.fecha_vencimiento < NOW() THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede insertar un producto vencido';
  END IF;
END //

DELIMITER ;

6. **Cuando un se inserte o actualice la información personal de un cliente, el sistema se debe asegurar de que la dirección del cliente reflejada sea correcta**

DELIMITER //

CREATE TRIGGER direccionDefaultCliente
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN
  IF NEW.direccion_id IS NULL THEN
    SET NEW.direccion_id = 1;
  END IF;
END //

DELIMITER ;

7. **Antes de actualizar la fecha de cosecha en CULTIVOS, verificar que no sea anterior a la fecha de siembra**

DELIMITER //

CREATE TRIGGER verificarFechaSiembra
BEFORE UPDATE ON CULTIVOS FOR EACH ROW
BEGIN
  IF NEW.fecha_cosecha < NEW.fecha_siembra THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede actualizar una fecha de siembra, debido a que es menor a la anterior';
  END IF;
END //

DELIMITER ;

8. **Antes de insertar un nuevo salario en SALARIO, verificar que el monto del salario sea mayor a 0 y que el empleado esté activo**

DELIMITER //

CREATE TRIGGER verificarNuevoSalario
BEFORE INSERT ON SALARIO FOR EACH ROW
BEGIN
  IF NEW.monto < 0 OR (SELECT estado FROM EMPLEADO WHERE cc_empleado = NEW.cc_empleado) = 0 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede actualizar el salario, debido a que el salario es menor a cero o el empleado está inactivo';
  END IF;
END //

DELIMITER ;

9. **Después de eliminar un cliente, eliminar automáticamente las visitas asociadas en la tabla VISITAS**

DELIMITER //

CREATE TRIGGER eliminarVisitasClienteEliminado
AFTER DELETE ON CLIENTE FOR EACH ROW
BEGIN
  DELETE FROM VISITAS
  WHERE cc_cliente = OLD.cc_cliente;
END //

DELIMITER ;

10. **Antes de insertar una nueva compra en PROVEEDOR_COMPRA, verificar que el proveedor tenga el estado "Activo"**

DELIMITER //

CREATE TRIGGER verificarProveedorActivo
BEFORE INSERT ON PROVEEDOR_COMPRA FOR EACH ROW
BEGIN
  IF (SELECT estado FROM PROVEEDOR WHERE nit = NEW.proveedor_nit) LIKE 'Inactivo' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede agregar la compra, debido a que el proveedor está inactivo';
  END IF;
END //

DELIMITER ;

11. **Al insertar una devolución en la tabla DEVOLUCIONES, actualizar automáticamente el estado de la venta correspondiente en VENTA a "Devuelto"**

DELIMITER //

CREATE TRIGGER actualizarVentaDevuelta
AFTER INSERT ON DEVOLUCIONES FOR EACH ROW
BEGIN
  UPDATE VENTA
  SET detalle = 'Producto devuelto'
  WHERE venta_id = NEW.venta_id;
END //

DELIMITER ;

12. **Después de insertar el uso de maquinaria en MAQUINARIA_CULT, reducir su disponibilidad en la tabla MAQUINARIA**

DELIMITER //

CREATE TRIGGER actualizarInventarioMaquinaria
AFTER INSERT ON MAQUINARIA_CULT FOR EACH ROW
BEGIN
  UPDATE MAQUINARIA
  SET cantidad = (cantidad - NEW.cantidad)
  WHERE maquinaria_id = NEW.maquinaria_id;
END //

DELIMITER ;

13. **Después de insertar una nueva compra de insumos, actualizar el stock en la tabla INSUMOS correspondiente**

DELIMITER //

CREATE TRIGGER actualizarInventarioInsumos
AFTER INSERT ON PROVEEDOR_COMPRA_INSUMOS FOR EACH ROW
BEGIN
  UPDATE INSUMOS
  SET cantidad = (cantidad + NEW.cantidad)
  WHERE idINSUMOS = NEW.insumos_id;
END //

DELIMITER ;

14. **Antes de insertar un registro en HERBICIDAS_CULT, verificar que la fecha de uso no sea posterior a la fecha actual**

DELIMITER //

CREATE TRIGGER verificarFechaUsoHerbicidas
BEFORE INSERT ON HERBICIDAS_CULT FOR EACH ROW
BEGIN
  IF NEW.fecha_uso > NOW() THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede relizar la insercción, debido a que la fecha de uso ya paso';
  END IF;
END //

DELIMITER ;

15. **Antes de insertar una nueva maquinaria en MAQUINARIA, generar automáticamente un número de serie único si no se proporciona**

DELIMITER //

CREATE TRIGGER verificarNumeroSerieMaquinaria
BEFORE INSERT ON MAQUINARIA FOR EACH ROW
BEGIN
  IF NEW.numero_serie IS NULL THEN
	SET NEW.numero_serie = '1111';
  END IF;
END //

DELIMITER ;

16. **Cuando se actualice el estado de un empleado a "Inactivo" en EMPLEADO, insertar automáticamente un evento en la tabla HISTORIAL_EMPLEADO**

DELIMITER //

CREATE TRIGGER enventoUsuarioInactivo
AFTER UPDATE ON EMPLEADO FOR EACH ROW
BEGIN
  IF NEW.estado LIKE 'Inactivo' THEN
    INSERT INTO HISTORIAL_EMPLEADO(evento, descripcion, tipo, fecha, cc_empleado)
    VALUES ('Inactividad', 'El usuario fue declarado inactivo del sistema', 'novedad', NOW(), NEW.cc_empleado);
  END IF;
END //

DELIMITER ;

17. **Antes de insertar un nuevo uso de herramientas en HERRAMIENTAS_CULT, verificar si la herramienta está disponible en el inventario**

DELIMITER //

CREATE TRIGGER verificarDisponibilidadHerramientas
BEFORE INSERT ON HERRAMIENTAS_CULT FOR EACH ROW
BEGIN
  IF (SELECT cantidad FROM HERRAMIENTAS WHERE herramienta_id = NEW.herramienta_id) < NEW.cantidad THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede utilizar las herramientas, debido a que no disponibilidad de unidades';
  END IF;
END //

DELIMITER ;

18. **Antes de insertar o actualizar el correo electrónico en las tablas CLIENTE, PROVEEDOR o EMPLEADO, validar que el formato del correo sea correcto**

DELIMITER //

CREATE TRIGGER confirmarCorreoCliente
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN
  IF NEW.email NOT LIKE '%@%.%' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede agregar el email, debido a que no cumple con el formato correcto';
  END IF;
END //

DELIMITER ;

DELIMITER //

CREATE TRIGGER confirmarCorreoClienteActualizado
BEFORE UPDATE ON CLIENTE FOR EACH ROW
BEGIN
  IF NEW.email NOT LIKE '%@%.%' THEN
	SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede agregar el email, debido a que no cumple con el formato correcto';
  END IF;
END //

DELIMITER ;

19. **Después de actualizar cualquier detalle en la tabla PRODUCTO, insertar un registro en una tabla de historial de productos para tener un seguimiento de los cambios**

DELIMITER //

CREATE TRIGGER actualizacionProductoLOG
AFTER UPDATE ON PRODUCTO FOR EACH ROW
BEGIN
  INSERT INTO log(descripcion, fecha)
  VALUES (CONCAT('El producto: ', NEW.nombre , 'fue actualizado.'), NOW());
END //

DELIMITER ;

20. **Antes de insertar un nuevo registro en PROVEEDOR_COMPRA, calcular automáticamente el subtotal multiplicando cantidad por el precio unitario**


DELIMITER //

CREATE TRIGGER calculoSubtotalCompra
BEFORE INSERT ON PROVEEDOR_COMPRA FOR EACH ROW
BEGIN
  SET NEW.subtotal = (NEW.cantidad * NEW.precio_uni);
END //

DELIMITER ;
