1. **Procedimiento que inserta un nuevo cliente con su información personal, dirección y detalles de contacto**

DELIMITER //

CREATE PROCEDURE insertarNuevoCliente(IN CEDULA INT, IN TELEFONO VARCHAR(15), IN EMAIL VARCHAR(255), IN ESTADO VARCHAR(15), IN GENERO VARCHAR(15), IN FEC_NAC DATETIME, IN FEC_AFI DATETIME, IN TIPO_PAGO VARCHAR(15), IN USUARIO_ID INT, IN DIRECCION_ID INT)
BEGIN
    INSERT INTO CLIENTE(cc_cliente, telefono, email, estado, genero, fecha_nacimiento, fecha_afiliacion, tipo_pago, usuario_id, direccion_id)
    VALUES(CEDULA, TELEFONO, EMAIL, ESTADO, GENERO, FEC_NAC, FEC_AFI, TIPO_PAGO, USUARIO_ID, DIRECCION_ID);
END //

DELIMITER ;

2. **Procedimiento que permite actualizar el teléfono de un empleado existente**

DELIMITER //

CREATE PROCEDURE actualizarTelefonoEmpleado(IN CEDULA INT, IN TELEFONO VARCHAR(15))
BEGIN
    UPDATE EMPLEADO
    SET telefono = TELEFONO
    WHERE cc_empleado = CEDULA;
END //

DELIMITER ;

3. **Procedimiento que elimina un cliente y todos los registros asociados, como visitas**

DELIMITER //

CREATE PROCEDURE eliminarCLiente(IN CEDULA INT)
BEGIN
	UPDATE CLIENTE
    SET estado = 'Inactivo'
    WHERE cc_cliente = CEDULA;
    
    DELETE FROM VISITAS
    WHERE cc_cliente = CEDULA;
END //

DELIMITER ;

4. **Procedimiento que devuelve una lista de productos cuyo inventario está por debajo de un nivel mínimo definido**

DELIMITER //

CREATE PROCEDURE alertaProductosBajoInventario()
BEGIN
	SELECT nombre, cantidad FROM PRODUCTO WHERE cantidad < 10;
END //

DELIMITER ;

5. **Procedimiento que registra una nueva venta, asociando los productos vendidos y actualizando el inventario**

DELIMITER //

CREATE PROCEDURE nuevaVenta(IN VENTA_ID INT, IN DETALLE VARCHAR(255), IN CED_CLIENTE INT, IN CED_EMPLEADO INT, IN PRODUCTO_ID INT, IN FECHA DATETIME, IN CANTIDAD INT)
BEGIN
	INSERT INTO VENTA (venta_id, detalle, subtotal, cc_cliente, cc_empleado)
    VALUES(VENTA_ID, DETALLE, (CANTIDAD * (SELECT precio FROM PRODUCTO WHERE producto_id = PRODUCTO_ID)), CED_CLIENTE, CED_EMPLEADO);
    
    INSERT INTO VENTA_PRODUCTO (venta_id, producto_id, fecha, cantidad)
    VALUES(VENTA_ID, PRODUCTO_ID, FECHA, CANTIDAD);
    
    UPDATE PRODUCTO
    SET cantidad = (cantidad - CANTIDAD)
    WHERE producto_id = PRODUCTO_ID;
END //

DELIMITER ;

6. **Procedimiento que genera un informe con todas las ventas realizadas por un empleado en un período de tiempo específico**

DELIMITER //

CREATE PROCEDURE informeVentasEmpleado(IN CEDULA INT, IN FECHA DATETIME)
BEGIN
	SELECT detalle, subtotal, VENTA_PRODUCTO.cantidad FROM VENTA
    INNER JOIN VENTA_PRODUCTO
    ON VENTA.venta_id = VENTA_PRODUCTO.venta_id
    WHERE VENTA.cc_empleado = CEDULA AND VENTA_PRODUCTO.fecha BETWEEN FECHA AND NOW();
END //

DELIMITER ;

7. **Procedimiento que actualiza la fecha de siembra de un cultivo**

DELIMITER //

CREATE PROCEDURE actualizarFechaSiembraCultivo(IN CULTIVO_ID INT, IN FECHA DATETIME)
BEGIN
	UPDATE CULTIVO
    SET fecha_siembra = FECHA
    WHERE cultivo_id = CULTIVO_ID;
END //

DELIMITER ;

8. **Procedimiento que toma en cuenta bonos y salario base para calcular el salario neto de un empleado**

DELIMITER //

CREATE PROCEDURE salarioEmpleado(IN CEDULA INT)
BEGIN
	SELECT (monto * salario) AS SueldoTotal FROM SALARIO
    WHERE cc_empleado = CEDULA;
END //

DELIMITER ;

9. **Procedimiento que registra una compra de insumos y actualiza el inventario de dichos insumos**

DELIMITER //

CREATE PROCEDURE comprarInsumos(IN CEDULA_CLI INT, IN CEDULA_EMP INT, IN NIT INT, IN INSUMO_ID INT, IN FECHA DATETIME, IN DETALLE VARCHAR(500), IN CANTIDAD_COM INT, IN PRECIO_UNI INT, IN OBSERVACIONES VARCHAR(45), IN CANTIDAD_INS INT)
BEGIN
	INSERT INTO COMPRA(detalle, cc_empleado)
    VALUES(DETALLE, CEDULA_EMP);
    
    SET @compra_id = LAST_INSERT_ID();
    
    INSERT INTO PROVEEDOR_COMPRA(proveedor_id, compra_id, fecha, cantidad, precio_uni)
    VALUES(NIT, compra_id, FECHA, CANTIDAD_COM, PRECIO_UNI);
    
    INSERT INTO PROVEEDOR_COMPRA_INSUMOS(proveedor_id, compra_id, insumos_id, fecha, observaciones, cantidad)
    VALUES(NIT, compra_id, INSUMO_ID, FECHA, OBSERVACIONES, CANTIDAD_INS);
    
    UPDATE INSUMOS
    SET cantidad = (cantidad + CANTIDAD_INS)
    WHERE idINSUMOS = INSUMO_ID;
END //

DELIMITER ;

10. **Procedimiento que devuelve una lista de clientes que viven en una ciudad específica**

DELIMITER //

CREATE PROCEDURE clientesDeUnaCiudad(IN CITY VARCHAR(255))
BEGIN
	SELECT USUARIO.primer_nombre, USUARIO.segundo_nombre, USUARIO.primer_apellido, USUARIO.segundo_apellido FROM CLIENTE
    INNER JOIN DIRECCION
    ON CLIENTE.direccion_id = DIRECCION.ciudad_id
    INNER JOIN CIUDAD
    ON DIRECCION.ciudad_id = CIUDAD.id
    INNER JOIN USUARIO
    ON CLIENTE.usuario_id = USUARIO.usuario_id
    WHERE CIUDAD.ciudad = CITY;
END //

DELIMITER ;

11. **Procedimiento que actualiza el precio de un producto existente, tomando en cuenta la inflación o cambios de mercado**

DELIMITER //

CREATE PROCEDURE actualizarPrecioProducto(IN PRODUCTO_ID INT, IN PRECIO INT)
BEGIN
	IF PRECIO > 0 THEN
		UPDATE PRODUCTO
        SET precio = PRECIO
        WHERE producto_id = PRODUCTO_ID;
    END IF;
END //

DELIMITER ;

12. **Procedimiento que permite insertar un nuevo proveedor con su información de contacto, dirección y detalles de la empresa**

DELIMITER //

CREATE PROCEDURE insertarProveedor(IN NIT INT, IN EMPRESA VARCHAR(255), IN TELEFONO VARCHAR(15), IN EMAIL VARCHAR(255), IN RAZON_SOCIAL VARCHAR(45), IN ESTADO VARCHAR(15), IN DIRECCION_ID INT)
BEGIN

	IF DIRECCION_ID IN (SELECT id FROM DIRECCION) THEN
		INSERT INTO PROVEEDOR(nit, empresa, fecha_asociacion, telefono, email, razon_social, estado, direccion_id)
		VALUES(NIT, EMPRESA, NOW(), TELEFONO, EMAIL, RAZON_SOCIAL, ESTADO, DIRECCION_ID);
    END IF;
END //

DELIMITER ;

13. **Procedimiento que devuelve el historial completo de eventos relacionados con un empleado, como promociones o sanciones**

DELIMITER //

CREATE PROCEDURE historialEmpleado(IN CEDULA INT)
BEGIN
	SELECT evento, descripcion, tipo, fecha FROM HISTORIAL_EMPLEADO WHERE cc_empleado = CEDULA;
END //

DELIMITER ;

14. **Procedimiento que genera un informe del inventario actual, incluyendo productos e insumos**

DELIMITER //

CREATE PROCEDURE informeInventario()
BEGIN
	SELECT SUM(cantidad) AS CantidadProducto FROM PRODUCTO;
    SELECT SUM(cantidad) AS CantidadInsumos FROM INSUMOS;
    SELECT SUM(cantidad) AS CantidadSemillas FROM SEMILLAS;
    SELECT SUM(cantidad) AS CantidadMaquinaria FROM MAQUINARIA;
    SELECT SUM(cantidad) AS CantidadHerramientas FROM HERRAMIENTAS;
    SELECT SUM(cantidad) AS CantidadHerbicidas FROM HERBICIDAS;
    SELECT SUM(cantidad) AS CantidadFertilizantes FROM FERTILIZANTES;
END //

DELIMITER ;

15. **Procedimiento que verifica si hay suficientes existencias de un producto antes de realizar una venta**

DELIMITER //

CREATE PROCEDURE verificarCantidadProducto(IN PRODUCTO_ID INT)
BEGIN
	SELECT cantidad AS CantidadProducto FROM PRODUCTO 
    WHERE producto_id = PRODUCTO_ID;
END //

DELIMITER ;

16. **Procedimiento que permite registrar una devolución de producto y actualizar el estado de la venta original**

DELIMITER //

CREATE PROCEDURE ObtenerProductosPorStock(IN categoria VARCHAR(45), IN stockLimite INT)
BEGIN
    
    EN ESTA PARTE HAY QUE CAMBIAR EL MODELO DE LA BASE DE DATOS, TOCA CAMBIAR LA RELACION ENTRE DEVOLUCIONES Y VENTA, DEBE SER DE MUCHOS A MUCHOS.

END //

DELIMITER ;

17. **Procedimiento que devuelve una lista de proveedores que están actualmente activos en el sistema**

DELIMITER //

CREATE PROCEDURE proveedoresDisponibles()
BEGIN
	SELECT empresa, telefono FROM PROVEEDOR 
    WHERE estado = 'Activo' OR 'Disponible';
END //

DELIMITER ;

18. **Procedimiento que asigna herramientas específicas a un empleado para realizar un trabajo y actualiza la disponibilidad de esas herramientas en el inventario**

DELIMITER //

CREATE PROCEDURE utilizarHerramientas(IN HERRAMIENTA_ID INT, IN CULTIVO_ID INT, IN FECHA DATETIME, IN CANTIDAD INT)
BEGIN
	IF CANTIDAD > 0 THEN
		INSERT INTO HERRAMIENTAS_CULT(herramienta_id, cultivo_id, fecha_uso, cantidad)
		VALUES(HERRAMIENTA_ID, CULTIVO_ID, FECHA, CANTIDAD);
		
		UPDATE HERRAMIENTAS
		SET cantidad = (cantidad - CANTIDAD)
		WHERE herramienta_id = HERRAMIENTA_ID;
    END IF;
END //

DELIMITER ;

19. **Procedimiento que devuelve todos los cultivos activos junto con su estado y fechas de cosecha previstas**

DELIMITER //

CREATE PROCEDURE informeCultivo()
BEGIN
	SELECT cultivo_id, fecha_siembra, fecha_cose_estimada, fecha_cosecha FROM CULTIVOS
    WHERE estado = 'Activo' OR 'Disponible';
END //

DELIMITER ;

20. **Procedimiento que permite registrar la entrada de nueva maquinaria en el inventario, junto con sus especificaciones y cantidad disponible**

DELIMITER //

CREATE PROCEDURE ingresarMaquinaria(IN TIPO VARCHAR(45), IN MARCA VARCHAR(45), IN MODELO VARCHAR(45), IN NUM_SERIE VARCHAR(45), IN INSUMOS_ID INT, IN CANTIDAD INT)
BEGIN
    INSERT INTO MAQUINARIA(tipo, marca, modelo, numero_serie, insumos_id, cantidad)
    VALUES(TIPO, MARCA, MODELO, NUM_SERIE, INSUMOS_ID, CANTIDAD);
END //

DELIMITER ;
