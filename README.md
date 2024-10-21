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

6. **Al insertar o actualizar la dirección de un cliente en la tabla DIRECCION, asegurarse de que se actualice la misma dirección en CLIENTE**

```sql
DELIMITER //

CREATE TRIGGER TIGRE
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN

END //

DELIMITER ;
```

7. **Antes de actualizar la fecha de cosecha en CULTIVOS, verificar que no sea anterior a la fecha de siembra**

```sql
DELIMITER //

CREATE TRIGGER verificarFechaSiembra
BEFORE UPDATE ON CULTIVOS FOR EACH ROW
BEGIN
  IF NEW.fecha_siembra < OLD.fecha_siembra THEN
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
  IF (SELECT estado FROM PROVEEDOR WHERE nit = NEW.proveedor_nit) LIKE '%nactivo' THEN
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

CREATE TRIGGER TIGRE
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN

END //

DELIMITER ;
```

13. **Después de insertar una nueva compra de insumos, actualizar el stock en la tabla INSUMOS correspondiente**

```sql
DELIMITER //

CREATE TRIGGER TIGRE
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN

END //

DELIMITER ;
```

14. **Antes de insertar un registro en HERBICIDAS_CULT, verificar que la fecha de uso no sea posterior a la fecha actual**

```sql
DELIMITER //

CREATE TRIGGER TIGRE
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN

END //

DELIMITER ;
```

15. **Antes de insertar una nueva maquinaria en MAQUINARIA, generar automáticamente un número de serie único si no se proporciona**

```sql
DELIMITER //

CREATE TRIGGER TIGRE
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN

END //

DELIMITER ;
```

16. **Cuando se actualice el estado de un empleado a "Inactivo" en EMPLEADO, insertar automáticamente un evento en la tabla HISTORIAL_EMPLEADO**

```sql
DELIMITER //

CREATE TRIGGER TIGRE
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN

END //

DELIMITER ;
```

17. **Antes de insertar un nuevo uso de herramientas en HERRAMIENTAS_CULT, verificar si la herramienta está disponible en el inventario**

```sql
DELIMITER //

CREATE TRIGGER TIGRE
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN

END //

DELIMITER ;
```

18. **Antes de insertar o actualizar el correo electrónico en las tablas CLIENTE, PROVEEDOR o EMPLEADO, validar que el formato del correo sea correcto**

```sql
DELIMITER //

CREATE TRIGGER TIGRE
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN

END //

DELIMITER ;
```

19. **Después de actualizar cualquier detalle en la tabla PRODUCTO, insertar un registro en una tabla de historial de productos para tener un seguimiento de los cambios**

```sql
DELIMITER //

CREATE TRIGGER TIGRE
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN

END //

DELIMITER ;
```

20. **Antes de insertar un nuevo registro en PROVEEDOR_COMPRA, calcular automáticamente el subtotal multiplicando cantidad por el precio unitario**

```sql
DELIMITER //

CREATE TRIGGER TIGRE
BEFORE INSERT ON CLIENTE FOR EACH ROW
BEGIN

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
