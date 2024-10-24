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

El proyecto busca crear una **base de datos** que permita organizar y manejar de manera eficiente 📈 todas las actividades de una **finca agrícola**. Esta incluye la producción de diferentes productos (aguacates, maíz 🌽, leche, etc.) y la gestión de empleados 👤, maquinaria, ventas, inventarios, proveedores y clientes 👤. La meta es **desarrollar** un sistema que facilite el acceso y manejo de la información clave para asegurar el buen **funcionamiento** de la finca.

## UML

La siguiente imágen :camera: es la representación grafica del **diseño** de la base de datos representada por entidades principales y entidades secundarias:

![ERD con entidades coloreadas (notación UML) (27)](https://github.com/user-attachments/assets/d9c21125-995f-4145-a290-d5f24e38892d)

## REQUISITOS

- MySQL :triangular_flag_on_post:
- Workbench  :pushpin:

## INSTALACIÓN

Una vez instaladas las aplicaciones anteriormente especificadas en los requisitos, se recomienda ingresar al usuario de mysql, luego de eso realizar los siguientes pasos:

1. Realizar la respectiva configuración del usuario de MySql.
   
2. Ingresar o iniciar sesión al workbench con el nuevo usuario.
   
3. Abrir una query o archivo query en el workbench.
   
4. Copiar el codigo del archivo DDL y pegarlo en la query de workbench, luego ejecutarlo.
   
5. Posteriormente se recomienda copiar los datos del archivo DML y realizar el mismo proceso; copiar y ejecutar.
   
6. Se recomienda realizar las diferentes consultas realizadas en el archivo DQL_SELECT.SQL para obtener datos importantes de la finca.

## ENTIDADES

En esta sección se encontrara la descripción especifica de cada entidad, permitiendo conocer el **modelo** de negocio de la base de datos.

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

-- 39. Obtén el número de órdenes por categoría de producto.
```sql
SELECT CATEGORIA_PRO.nombre_categoria, COUNT(*) AS num_orders
FROM PEDIDOS
JOIN PRODUCTO ON PEDIDOS.id_producto = PRODUCTO.id_producto
JOIN CATEGORIA_PRO ON PRODUCTO.id_categoria = CATEGORIA_PRO.id_categoria
GROUP BY CATEGORIA_PRO.nombre_categoria;
```

-- 40. Lista todas las transacciones por tipo de pago.
```sql
SELECT * FROM TRANSACCIONES WHERE tipo_pago = 'Tarjeta de crédito';
```

-- 41. Obtén el valor total de transacciones para un tipo de pago específico.
```sql
SELECT SUM(valor_transaccion) FROM TRANSACCIONES WHERE tipo_pago = 'Efectivo';
```

-- 42.  Lista todos los clientes que realizaron transacciones en los últimos 6 meses.
```sql
SELECT DISTINCT CLIENTE.cc_cliente, CLIENTE.nombre
FROM TRANSACCIONES
JOIN CLIENTE ON TRANSACCIONES.cc_cliente = CLIENTE.cc_cliente
WHERE TRANSACCIONES.fecha_transaccion > (CURDATE() - INTERVAL 6 MONTH);
```

-- 43. Obtén el conteo de transacciones por mes.
```sql
SELECT MONTH(fecha_transaccion) AS month, COUNT(*) AS num_transactions
FROM TRANSACCIONES
GROUP BY month;
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

## FUNCIONES

Listado de funciones que permiten obtener información especifica de la base de datos.

1. **Retorna la cantidad total de insumos disponibles**

```sql
DELIMITER //

CREATE FUNCTION calcularStockInsumos() 
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN (SELECT NUM(cantidad) FROM INSUMOS);

END //
DELIMITER ;
```

2. **Calcula la edad de un cliente usando su fecha de nacimiento registrada**

```sql
DELIMITER //

CREATE FUNCTION calcularEdadCliente(CEDULA INT) 
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN((SELECT YEAR(fecha_nacimiento) FROM CLIENTE WHERE cc_cliente = CEDULA) - YEAR(NOW()));

END //
DELIMITER ;
```

3. **Calcula la edad de un empleado usando su fecha de nacimiento registrada**

```sql
DELIMITER //

CREATE FUNCTION calcularEdadEmpleado(CEDULA INT) 
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN((SELECT YEAR(fecha_nacimiento) FROM EMPLEADO WHERE cc_empleado = CEDULA) - YEAR(NOW()));

END //
DELIMITER ;
```

4. **Retorna el producto con mayor cantidad de ventas de la tabla VENTA_PRODUCTO**

```sql
DELIMITER //

CREATE FUNCTION obtenerProductoMasVendido() 
RETURNS VARCHAR(100)
DETERMINISTIC 
BEGIN

    RETURN(SELECT PRODUCTO.nombre FROM VENTA_PRODUCTO INNER JOIN PRODUCTO ON VENTA_PRODUCTO.producto_id = PRODUCTO.producto_id ORDER BY VENTA_PRODUCTO.cantidad ASC LIMIT 1);

END //
DELIMITER ;
```

5. **Devuelve el proveedor que ha realizado más transacciones**

```sql
DELIMITER //

CREATE FUNCTION obtenerProveedorFrecuente()
RETURNS VARCHAR(100)
DETERMINISTIC 
BEGIN

    RETURN(SELECT PROVEEDOR.nombre FROM PROVEEDOR_COMPRA INNER JOIN PROVEEDOR ON PROVEEDOR_COMPRA.proveedor_nit = PROVEEDOR.nit ORDER BY COUNT(PROVEEDOR_COMPRA.proveedor_nit) LIMIT 1);

END //
DELIMITER ;
```



## EVENTOS

Listado de eventos que permiten obtener información especifica de la base de datos.

1. **Programar un evento para verificar el estado de las maquinarias registradas en la tabla MAQUINARIA y realizar su mantenimiento.**

```sql

CREATE EVENT estadoMaquinaria 
ON SCHEDULE EVERY 6 MONTH 
STARTS '2024-01-01 00:00:00' 
DO 
    INSERT INTO log(descripcion, fecha) 
    VALUES(CONCAT('Reporte mensual del estado de inventario de la maquinaria', '(SELECT SUM(cantidad) FROM MAQUINARIA)'), NOW()); 

```

2. **Verificar las cantidades de insumos en la tabla INSUMOS para asegurar que no caigan por debajo del nivel mínimo.**

```sql
CREATE EVENT cantidadInsumos
ON SCHEDULE EVERY 1 MONTH 
STARTS '2024-01-01 00:00:00' 
DO 
    INSERT INTO log (descripcion, fecha)
    SELECT CONCAT('La cantidad mínima de insumos fue superada, se recomienda revisar urgentemente el inventario', (SELECT SUM(cantidad) FROM INSUMOS)), NOW()
    WHERE (SELECT SUM(cantidad) FROM INSUMOS) < 100;
```

3. **Programar un evento para la revisión y actualización de los permisos de las maquinarias en la tabla MAQUINARIA**

```sql

CREATE EVENT ObtenerProductosPorStock
ON SCHEDULE EVERY 1 MONTH 
STARTS '2024-01-10 00:00:00'
DO
    SELECT * 
    FROM PRODUCTOS 
    WHERE Categoria = categoria AND Cantidad < stockLimite;
```

4. **Generar automáticamente un evento para revisar la tabla FERTILIZANTES y asegurar que estén en buen estado antes de su uso en los cultivos.**

```sql
CREATE EVENT evaluacionFertilizantes
ON SCHEDULE EVERY 1 WEEK 
STARTS '2024-01-10 00:00:00'
DO
    INSERT INTO log(descripcion, fecha)
    SELECT 'El fertilizante debe ser revisado y cambiado, debido a que presenta vencimiento' , NOW()
    WHERE (SELECT fecha_exp FROM FERTILIZANTES) < NOW();
```

5. **Revisar los productos en la tabla PRODUCTO para detectar productos cercanos a su fecha de vencimiento y emitir alertas.**

```sql
CREATE EVENT estadoProductos
ON SCHEDULE EVERY 1 WEEK
STARTS '2024-01-01 00:00:00'
DO 
    INSERT INTO log (descripcion, fecha)
    SELECT 'El producto se encuentra vencido, se debe realizar un cambio' , NOW()
    WHERE (SELECT fecha_vencimiento FROM PRODUCTO) < NOW();
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

## ROLES

Los siguientes roles componen la estructura general de la base de datos:

- **ADMINISTRADOR** 💻: El usuario administrador es el **gestor** 🅰️ de la base de datos y tiene acceso a todos los permisos.

- **FINANZAS** 📥: El usuario de finanzas tiene permisos de consulta 🔍, ademas de actualización de sus datos e inserción.
  
- **AGRONOMO** 💼: El usuario agronomo tiene permisos de 🔍 consulta en la base de datos, además tienen el poder de actualizar e insertar 📝 datos.
  
- **LOGISTICA** 📍: El usuario de logistica tiene permisos de consulta 🔍, ademas de actualización, creación y eliminación 📝 de los datos.
  
- **SERVICIO AL CLIENTE** 🙋: El usuario de atención cliente tiene permisos de 🔍 consulta, ademas de 📝 actualización, eliminación y creación datos.

## AUTORES

- Victor Andres Marimon Mendoza -- (3reehuy@gmail.com)
- Gean Franco Jacome Laguna -- (deepagmf710@gmail.com)

## LICENCIA

Este proyecto está bajo la **Licencia** :white_check_mark: MIT.
