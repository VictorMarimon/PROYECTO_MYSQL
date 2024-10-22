## 💚 TABLA DE CONTENIDO 💚

- [UML](#UML)
- [REQUISITOS](#REQUISITOS)
- [INSTALACIÓN](#INSTALACIÓN)
- [ENTIDADES](#ENTIDADES)
- [CONSULTAS](#CONSULTAS)
- [PROCEDIMIENTOS](#PROCEDIMIENTOS)
- [FUNCIONES](#FUNCIONES)
- [EVENTOS](#EVENTOS)
- [TRIGGERS](#TRIGGERS)
- [ROLES](#ROLES)
- [AUTORES](#AUTORES)
- [LICENCIA](#LICENCIA)

## PROYECTO MySQL

El proyecto busca crear una base de datos que permita organizar y manejar de manera eficiente 📈 todas las actividades de una finca agrícola. Esta incluye la producción de diferentes productos (aguacates, maíz 🌽, leche, etc.) y la gestión de empleados 👤, maquinaria, ventas, inventarios, proveedores y clientes 👤. La meta es desarrollar un sistema que facilite el acceso y manejo de la información clave para asegurar el buen funcionamiento de la finca.

## UML

La siguiente imágen :camera: es la representación grafica del diseño de la base de datos representada por entidades principales y entidades secundarias:

![UML](https://github.com/user-attachments/assets/3a4688d8-0453-48f3-bf0a-c133ad2442b8)

## REQUISITOS

- MySQL :triangular_flag_on_post:
- Workbench  :pushpin:

## INSTALACIÓN

para instalar...

## ENTIDADES

En esta sección se encontrara la descripción especifica de cada entidad, permitiendo conocer el modelo de negocio de la base de datos.

- CARGO 👲: Define cargos o roles de empleados.

- CATEGORIA_INS 📝: Categoriza insumos.

- CATEGORIA_PRO 📕: Categoriza productos con un ID y un nombre.

- CIUDAD :cityscape:: Contiene datos de las ciudades, cada una con un ID único y un nombre, asociada a un país de la tabla PAIS.

- CLIENTE 🙋: Incluye los datos de los cliente como los son email, telefono y se relaciona con la tabla USUARIO.

- COMPRA 💰: Registra compras hechas por empleados.

- CONTINENTE 🌍: Comprende los datos del continente como nombre, además de un identificador unico.

- CULTIVOS 🔨: Información sobre cultivos, vinculados a tipo de cultivo, producción y semillas.

- DEVOLUCIONES 💸: Registra devoluciones vinculadas a ventas.

- DIRECCION :house_with_garden:: Almacena detalles de las direcciones, incluyendo calle, carrera, transversal, relacionada con la tabla CIUDAD.

- EMPLEADO 🔨: Contiene el tipo de empleado y se relaciona con la tabla USUARIO.

- EMPLEADO_CULTI: Relaciona empleados con cultivos.

- FERTILIZANTES 💯: Registra fertilizantes, vinculados a insumos.

- FERTILIZANTES_CULTI: Relaciona fertilizantes con cultivos.

- HERBICIDAS 🔴: Detalla herbicidas, enlazados a insumos.

- HERBICIDAS_CULTI ✳️: Relaciona herbicidas con cultivos.

- HERRAMIENTAS 🔧: Detalla herramientas, enlazadas a insumos.

- HERRAMIENTAS_CULTI 🔱: Vincula herramientas con cultivos.

- HISTORIAL_EMPLEADO: Registra eventos históricos de empleados.

- HORARIO 🕜: Define horarios de trabajo.

- HORARIO_EMPLEADO ⏰: Relaciona horarios con empleados.

- INFORME ℹ️: Registra informes de eventos.

- INFORME_EMPLEADO 📊: Relaciona informes con empleados.

- INFORME_PRO 📄: Relaciona informes con proveedores.

- INSUMOS 🚰: Detalla insumos, enlazados a una categoría de insumos.

- MAQUINARIA 🚜: Guarda datos de maquinaria, vinculada a insumos.

- MAQUINARIA_CULTI: Vincula maquinaria con cultivos.

- PAIS 🗼: Engloba los datos de los paises como nombre y un identificador unico.

- PRO_VENTA 💟: Relaciona productos con ventas.

- PRODUCTO 💎: Engloba los datos de los productos como categoria, precio y cantidad. Ademàs tiene una relaciòn de muchos a muchos con la tabla PRODUCTO y VENTA, y una relaciòn de uno a uno con las tablas VIDEOJUEGO y CONSOLA.

- PROVEEDOR 📆: Contiene datos como nombre de la empresa, telefono, ademàs se relaciona con la tabla DIRECCION.
 
- PROVEEDOR_COMPRA: Relaciona proveedores con compras.

- PROVEEDOR_COMPRA_INSUMOS 🔗: Vincula compras de proveedores con insumos.

- SALARIO 💵: Registra salarios pagados a empleados.

- SEMILLAS 🌱: Registra semillas, enlazadas a insumos.

- TIPO_CULTIVO: Categoriza tipos de cultivos.

- TIPO_PRODUCCIÓN 🍞: Define tipos de producción.

- USUARIO :memo:: Guarda los nombres completos de las personas, incluyendo primer y segundo nombre, así como primer y segundo apellido, junto con el tipo de persona (e.g., aficionado, entrenador).

- VENTA 💰: Comprende los datos de las ventas como la fecha en la que se realizo, ademàs del CLIENTE que realizo dicha compra y del EMPLEADO que realizo la venta.

- VENTA_PRODUCTO: Contiene los identificadores de las tablas PRODUCTO y VENTA.

- VISITAS ✅: Registra visitas de clientes.

## CONSULTAS

Listado de consultas que permiten obtener información especifica de la base de datos.

1. **Listar todos los videojuegos de una plataforma específica (por ejemplo, "PlayStation").**

```sql
DELIMITER //

CREATE PROCEDURE ObtenerProductosPorStock(IN categoria VARCHAR(45), IN stockLimite INT)
BEGIN
    SELECT * 
    FROM PRODUCTOS 
    WHERE Categoria = categoria AND Cantidad < stockLimite;
END //

DELIMITER ;
```

## PROCEDIMIENTOS

Listado de procedimientos que permiten obtener información especifica de la base de datos.

1. **Procedimiento que inserta un nuevo cliente con su información personal, dirección y detalles de contacto**

```sql
DELIMITER //

CREATE PROCEDURE insertarNuevoCliente(IN CEDULA INT, IN TELEFONO VARCHAR(15), IN EMAIL VARCHAR(255), IN ESTADO VARCHAR(15), IN GENERO VARCHAR(15), IN FEC_NAC DATETIME, IN FEC_AFI DATETIME, IN TIPO_PAGO VARCHAR(15), IN USUARIO_ID INT, IN DIRECCION_ID INT)
BEGIN
    INSERT INTO CLIENTE(cc_cliente, telefono, email, estado, genero, fecha_nacimiento, fecha_afiliacion, tipo_pago, usuario_id, direccion_id)
    VALUES(CEDULA, TELEFONO, EMAIL, ESTADO, GENERO, FEC_NAC, FEC_AFI, TIPO_PAGO, USUARIO_ID, DIRECCION_ID);
END //

DELIMITER ;
```

2. **Procedimiento que permite actualizar el teléfono de un empleado existente**

```sql
DELIMITER //

CREATE PROCEDURE actualizarTelefonoEmpleado(IN CEDULA INT, IN TELEFONO VARCHAR(15))
BEGIN
    UPDATE EMPLEADO
    SET telefono = TELEFONO
    WHERE cc_empleado = CEDULA;
END //

DELIMITER ;
```

3. **Procedimiento que elimina un cliente y todos los registros asociados, como visitas**

```sql
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
```

4. **Procedimiento que devuelve una lista de productos cuyo inventario está por debajo de un nivel mínimo definido**

```sql
DELIMITER //

CREATE PROCEDURE alertaProductosBajoInventario()
BEGIN
	SELECT nombre, cantidad FROM PRODUCTO WHERE cantidad < 10;
END //

DELIMITER ;
```

5. **Procedimiento que registra una nueva venta, asociando los productos vendidos y actualizando el inventario**

```sql
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
```

6. **Procedimiento que genera un informe con todas las ventas realizadas por un empleado en un período de tiempo específico**

```sql
DELIMITER //

CREATE PROCEDURE informeVentasEmpleado(IN CEDULA INT, IN FECHA DATETIME)
BEGIN
	SELECT detalle, subtotal, VENTA_PRODUCTO.cantidad FROM VENTA
    INNER JOIN VENTA_PRODUCTO
    ON VENTA.venta_id = VENTA_PRODUCTO.venta_id
    WHERE VENTA.cc_empleado = CEDULA AND VENTA_PRODUCTO.fecha BETWEEN FECHA AND NOW();
END //

DELIMITER ;
```

7. **Procedimiento que actualiza la fecha de siembra de un cultivo**

```sql
DELIMITER //

CREATE PROCEDURE actualizarFechaSiembraCultivo(IN CULTIVO_ID INT, IN FECHA DATETIME)
BEGIN
	UPDATE CULTIVO
    SET fecha_siembra = FECHA
    WHERE cultivo_id = CULTIVO_ID;
END //

DELIMITER ;
```

8. **Procedimiento que toma en cuenta bonos y salario base para calcular el salario neto de un empleado**

```sql
DELIMITER //

CREATE PROCEDURE salarioEmpleado(IN CEDULA INT)
BEGIN
	SELECT (monto * salario) AS SueldoTotal FROM SALARIO
    WHERE cc_empleado = CEDULA;
END //

DELIMITER ;
```

9. **Procedimiento que registra una compra de insumos y actualiza el inventario de dichos insumos**

```sql
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
```

10. **Procedimiento que devuelve una lista de clientes que viven en una ciudad específica**

```sql
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
```
11. **Procedimiento que actualiza el precio de un producto existente, tomando en cuenta la inflación o cambios de mercado**

```sql
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
```

12. **Procedimiento que permite insertar un nuevo proveedor con su información de contacto, dirección y detalles de la empresa**

```sql
DELIMITER //

CREATE PROCEDURE insertarProveedor(IN NIT INT, IN EMPRESA VARCHAR(255), IN TELEFONO VARCHAR(15), IN EMAIL VARCHAR(255), IN RAZON_SOCIAL VARCHAR(45), IN ESTADO VARCHAR(15), IN DIRECCION_ID INT)
BEGIN

	IF DIRECCION_ID IN (SELECT id FROM DIRECCION) THEN
		INSERT INTO PROVEEDOR(nit, empresa, fecha_asociacion, telefono, email, razon_social, estado, direccion_id)
		VALUES(NIT, EMPRESA, NOW(), TELEFONO, EMAIL, RAZON_SOCIAL, ESTADO, DIRECCION_ID);
    END IF;
END //

DELIMITER ;
```

13. **Procedimiento que devuelve el historial completo de eventos relacionados con un empleado, como promociones o sanciones**

```sql
DELIMITER //

CREATE PROCEDURE historialEmpleado(IN CEDULA INT)
BEGIN
	SELECT evento, descripcion, tipo, fecha FROM HISTORIAL_EMPLEADO WHERE cc_empleado = CEDULA;
END //

DELIMITER ;
```

14. **Procedimiento que genera un informe del inventario actual, incluyendo productos e insumos**

```sql
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
```

15. **Procedimiento que verifica si hay suficientes existencias de un producto antes de realizar una venta**

```sql
DELIMITER //

CREATE PROCEDURE verificarCantidadProducto(IN PRODUCTO_ID INT)
BEGIN
	SELECT cantidad AS CantidadProducto FROM PRODUCTO 
    WHERE producto_id = PRODUCTO_ID;
END //

DELIMITER ;
```

16. **Procedimiento que permite registrar una devolución de producto y actualizar el estado de la venta original**

```sql
DELIMITER //

CREATE PROCEDURE ObtenerProductosPorStock(IN categoria VARCHAR(45), IN stockLimite INT)
BEGIN
    SELECT * 
    FROM PRODUCTOS 
    WHERE Categoria = categoria AND Cantidad < stockLimite;
END //

DELIMITER ;
```

17. **Procedimiento que devuelve una lista de proveedores que están actualmente activos en el sistema**

```sql
DELIMITER //

CREATE PROCEDURE proveedoresDisponibles()
BEGIN
	SELECT empresa, telefono FROM PROVEEDOR 
    WHERE estado = 'Activo' OR 'Disponible';
END //

DELIMITER ;
```

18. **Procedimiento que asigna herramientas específicas a un empleado para realizar un trabajo y actualiza la disponibilidad de esas herramientas en el inventario**

```sql
DELIMITER //

CREATE PROCEDURE ObtenerProductosPorStock(IN categoria VARCHAR(45), IN stockLimite INT)
BEGIN
    SELECT * 
    FROM PRODUCTOS 
    WHERE Categoria = categoria AND Cantidad < stockLimite;
END //

DELIMITER ;
```

19. **Procedimiento que devuelve todos los cultivos activos junto con su estado y fechas de cosecha previstas**

```sql
DELIMITER //

CREATE PROCEDURE informeCultivo()
BEGIN
	SELECT cultivo_id, fecha_siembra, fecha_cose_estimada, fecha_cosecha FROM CULTIVOS
    WHERE estado = 'Activo' OR 'Disponible';
END //

DELIMITER ;
```

20. **Procedimiento que permite registrar la entrada de nueva maquinaria en el inventario, junto con sus especificaciones y cantidad disponible**

```sql
DELIMITER //

CREATE PROCEDURE ObtenerProductosPorStock(IN categoria VARCHAR(45), IN stockLimite INT)
BEGIN
    SELECT * 
    FROM PRODUCTOS 
    WHERE Categoria = categoria AND Cantidad < stockLimite;
END //

DELIMITER ;
```


## FUNCIONES

Listado de funciones que permiten obtener información especifica de la base de datos.

1. **Listar todos los videojuegos de una plataforma específica (por ejemplo, "PlayStation").**

```sql
DELIMITER //

CREATE PROCEDURE ObtenerProductosPorStock(IN categoria VARCHAR(45), IN stockLimite INT)
BEGIN
    SELECT * 
    FROM PRODUCTOS 
    WHERE Categoria = categoria AND Cantidad < stockLimite;
END //

DELIMITER ;
```

## EVENTOS

Listado de eventos que permiten obtener información especifica de la base de datos.

1. **Listar todos los videojuegos de una plataforma específica (por ejemplo, "PlayStation").**

```sql
DELIMITER //

CREATE PROCEDURE ObtenerProductosPorStock(IN categoria VARCHAR(45), IN stockLimite INT)
BEGIN
    SELECT * 
    FROM PRODUCTOS 
    WHERE Categoria = categoria AND Cantidad < stockLimite;
END //

DELIMITER ;
```

## TRIGGERS

Listado de triggers que permiten obtener información especifica de la base de datos.

1. **Cuando se inserta un nuevo cliente, si su estado es inactivo, actualizar automáticamente la fecha de afiliación a NULL**

```sql
DELIMITER //

CREATE TRIGGER actualizarFechaAfiliacionCliente
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN
  IF NEW.estado = 0 THEN
    SET NEW.fecha_afiliacion = '0000-00-00';
  END IF;
END //

DELIMITER ;
```

2. **Antes de insertar una nueva venta en VENTA_PRODUCTO, verificar si la cantidad disponible en PRODUCTO es suficiente para realizar la venta**

```sql
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
```

3. **Después de una venta, disminuir la cantidad del producto en la tabla PRODUCTO**

```sql
DELIMITER //

CREATE TRIGGER disminuirCantidadProducto
AFTER INSERT ON VENTA_PRODUCTO FOR EACH ROW
BEGIN
  UPDATE PRODUCTO
  SET cantidad = (cantidad - NEW.cantidad)
  WHERE producto_id = NEW.producto_id;
END //

DELIMITER ;
```

4. **Cuando se elimina un empleado de la tabla EMPLEADO, actualizar automáticamente su estado en la tabla HISTORIAL_EMPLEADO como "Inactivo"**

```sql
DELIMITER //

CREATE TRIGGER eliminarHistorialEmpleado
AFTER DELETE ON EMPLEADO FOR EACH ROW
BEGIN
  DELETE FROM HISTORIAL_EMPLEADO
  WHERE cc_empleado = OLD.cc_empleado;
END //

DELIMITER ;
```

5. **Antes de insertar un nuevo producto, verificar que su fecha de vencimiento no sea anterior a la fecha actual**

```sql
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
```

6. **Cuando un se inserte o actualice la información personal de un cliente, el sistema se debe asegurar de que la dirección del cliente reflejada sea correcta**

```sql
DELIMITER //

CREATE TRIGGER direccionDefaultCliente
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN
  IF NEW.direccion_id IS NULL THEN
    SET NEW.direccion_id = 1;
  END IF;
END //

DELIMITER ;
```

7. **Antes de actualizar la fecha de cosecha en CULTIVOS, verificar que no sea anterior a la fecha de siembra**

```sql
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
```

8. **Antes de insertar un nuevo salario en SALARIO, verificar que el monto del salario sea mayor a 0 y que el empleado esté activo**

```sql
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
```

9. **Después de eliminar un cliente, eliminar automáticamente las visitas asociadas en la tabla VISITAS**

```sql
DELIMITER //

CREATE TRIGGER eliminarVisitasClienteEliminado
AFTER DELETE ON CLIENTE FOR EACH ROW
BEGIN
  DELETE FROM VISITAS
  WHERE cc_cliente = OLD.cc_cliente;
END //

DELIMITER ;
```

10. **Antes de insertar una nueva compra en PROVEEDOR_COMPRA, verificar que el proveedor tenga el estado "Activo"**

```sql
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
```

11. **Al insertar una devolución en la tabla DEVOLUCIONES, actualizar automáticamente el estado de la venta correspondiente en VENTA a "Devuelto"**

```sql
DELIMITER //

CREATE TRIGGER actualizarVentaDevuelta
AFTER INSERT ON DEVOLUCIONES FOR EACH ROW
BEGIN
  UPDATE VENTA
  SET detalle = 'Producto devuelto'
  WHERE venta_id = NEW.venta_id;
END //

DELIMITER ;
```

12. **Después de insertar el uso de maquinaria en MAQUINARIA_CULT, reducir su disponibilidad en la tabla MAQUINARIA**

```sql
DELIMITER //

CREATE TRIGGER actualizarInventarioMaquinaria
AFTER INSERT ON MAQUINARIA_CULT FOR EACH ROW
BEGIN
  UPDATE MAQUINARIA
  SET cantidad = (cantidad - NEW.cantidad)
  WHERE maquinaria_id = NEW.maquinaria_id;
END //

DELIMITER ;
```

13. **Después de insertar una nueva compra de insumos, actualizar el stock en la tabla INSUMOS correspondiente**

```sql
DELIMITER //

CREATE TRIGGER actualizarInventarioInsumos
AFTER INSERT ON PROVEEDOR_COMPRA_INSUMOS FOR EACH ROW
BEGIN
  UPDATE INSUMOS
  SET cantidad = (cantidad + NEW.cantidad)
  WHERE idINSUMOS = NEW.insumos_id;
END //

DELIMITER ;
```

14. **Antes de insertar un registro en HERBICIDAS_CULT, verificar que la fecha de uso no sea posterior a la fecha actual**

```sql
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
```

15. **Antes de insertar una nueva maquinaria en MAQUINARIA, generar automáticamente un número de serie único si no se proporciona**

```sql
DELIMITER //

CREATE TRIGGER verificarNumeroSerieMaquinaria
BEFORE INSERT ON MAQUINARIA FOR EACH ROW
BEGIN
  IF NEW.numero_serie IS NULL THEN
	SET NEW.numero_serie = '1111';
  END IF;
END //

DELIMITER ;
```

16. **Cuando se actualice el estado de un empleado a "Inactivo" en EMPLEADO, insertar automáticamente un evento en la tabla HISTORIAL_EMPLEADO**

```sql
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
```

17. **Antes de insertar un nuevo uso de herramientas en HERRAMIENTAS_CULT, verificar si la herramienta está disponible en el inventario**

```sql
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
```

18. **Antes de insertar o actualizar el correo electrónico en las tablas CLIENTE, PROVEEDOR o EMPLEADO, validar que el formato del correo sea correcto**

```sql
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
```

19. **Después de actualizar cualquier detalle en la tabla PRODUCTO, insertar un registro en una tabla de historial de productos para tener un seguimiento de los cambios**

```sql
DELIMITER //

CREATE TRIGGER actualizacionProductoLOG
AFTER UPDATE ON PRODUCTO FOR EACH ROW
BEGIN
  INSERT INTO log(descripcion, fecha)
  VALUES (CONCAT('El producto: ', NEW.nombre , 'fue actualizado.'), NOW());
END //

DELIMITER ;
```

20. **Antes de insertar un nuevo registro en PROVEEDOR_COMPRA, calcular automáticamente el subtotal multiplicando cantidad por el precio unitario**

```sql
DELIMITER //

CREATE TRIGGER calculoSubtotalCompra
BEFORE INSERT ON PROVEEDOR_COMPRA FOR EACH ROW
BEGIN
  SET NEW.subtotal = (NEW.cantidad * NEW.precio_uni);
END //

DELIMITER ;
```

## ROLES

Los siguientes roles componen la estructura general de la base de datos:

- ADMINISTRADOR:

- PROVEEDOR:
  
- EMPLEADO:
  
- VENDEDOR:
  
- CLIENTE:

## AUTORES

- Victor Andres Marimon Mendoza -- (3reehuy@gmail.com)
- Gean Franco Jacome Laguna -- (deepagmf710@gmail.com)

## LICENCIA

Este proyecto está bajo la Licencia :white_check_mark: MIT.
