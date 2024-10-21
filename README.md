# 🖲️ TABLA DE CONTENIDO 🖲️

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

# PROYECTO MySQL

El proyecto busca crear una base de datos que permita organizar y manejar de manera eficiente todas las actividades de una finca agrícola. Esta incluye la producción de diferentes productos (aguacates, maíz, leche, etc.) y la gestión de empleados, maquinaria, ventas, inventarios, proveedores y clientes. La meta es desarrollar un sistema que facilite el acceso y manejo de la información clave para asegurar el buen funcionamiento de la finca.

# UML

La siguiente imágen :camera: es la representación grafica del diseño de la base de datos representada por entidades principales y entidades secundarias:

![image](https://github.com/user-attachments/assets/b55c2be8-24d9-4f72-964b-a8519595954f)

## REQUISITOS

- MySQL :triangular_flag_on_post:
- Workbench  :pushpin:

## INSTALACIÓN

para instalar...

# ENTIDADES

En esta sección se encontrara la descripción especifica de cada entidad, permitiendo conocer el modelo de negocio de la base de datos.

- CARGO: Define cargos o roles de empleados.

- CATEGORIA_INS: Categoriza insumos.

- CATEGORIA_PRO: Categoriza productos con un ID y un nombre.

- CIUDAD :cityscape:: Contiene datos de las ciudades, cada una con un ID único y un nombre, asociada a un país de la tabla PAIS.

- CLIENTE 🙋: Incluye los datos de los cliente como los son email, telefono y se relaciona con la tabla USUARIO.

- COMPRA: Registra compras hechas por empleados.

- CONTINENTE 🌍: Comprende los datos del continente como nombre, además de un identificador unico.

- CULTIVOS: Información sobre cultivos, vinculados a tipo de cultivo, producción y semillas.

- DEVOLUCIONES: Registra devoluciones vinculadas a ventas.

- DIRECCION :house_with_garden:: Almacena detalles de las direcciones, incluyendo calle, carrera, transversal, relacionada con la tabla CIUDAD.

- EMPLEADO 🔨: Contiene el tipo de empleado y se relaciona con la tabla USUARIO.

- EMPLEADO_CULTI: Relaciona empleados con cultivos.

- FERTILIZANTES: Registra fertilizantes, vinculados a insumos.

- FERTILIZANTES_CULTI: Relaciona fertilizantes con cultivos.

- HERBICIDAS: Detalla herbicidas, enlazados a insumos.

- HERBICIDAS_CULTI: Relaciona herbicidas con cultivos.

- HERRAMIENTAS: Detalla herramientas, enlazadas a insumos.

- HERRAMIENTAS_CULTI: Vincula herramientas con cultivos.

- HISTORIAL_EMPLEADO: Registra eventos históricos de empleados.

- HORARIO: Define horarios de trabajo.

- HORARIO_EMPLEADO: Relaciona horarios con empleados.

- INFORME: Registra informes de eventos.

- INFORME_EMPLEADO: Relaciona informes con empleados.

- INFORME_PRO: Relaciona informes con proveedores.

- INSUMOS: Detalla insumos, enlazados a una categoría de insumos.

- MAQUINARIA: Guarda datos de maquinaria, vinculada a insumos.

- MAQUINARIA_CULTI: Vincula maquinaria con cultivos.

- PAIS 🗼: Engloba los datos de los paises como nombre y un identificador unico.

- PRO_VENTA: Relaciona productos con ventas.

- PRODUCTO 💎: Engloba los datos de los productos como categoria, precio y cantidad. Ademàs tiene una relaciòn de muchos a muchos con la tabla PRODUCTO y VENTA, y una relaciòn de uno a uno con las tablas VIDEOJUEGO y CONSOLA.

- PROVEEDOR 📆: Contiene datos como nombre de la empresa, telefono, ademàs se relaciona con la tabla DIRECCION.
 
- PROVEEDOR_COMPRA: Relaciona proveedores con compras.

- PROVEEDOR_COMPRA_INSUMOS: Vincula compras de proveedores con insumos.

- SALARIO: Registra salarios pagados a empleados.

- SEMILLAS: Registra semillas, enlazadas a insumos.

- TIPO_CULTIVO: Categoriza tipos de cultivos.

- TIPO_PRODUCCIÓN: Define tipos de producción.

- USUARIO :memo:: Guarda los nombres completos de las personas, incluyendo primer y segundo nombre, así como primer y segundo apellido, junto con el tipo de persona (e.g., aficionado, entrenador).

- VENTA 💰: Comprende los datos de las ventas como la fecha en la que se realizo, ademàs del CLIENTE que realizo dicha compra y del EMPLEADO que realizo la venta.

- VENTA_PRODUCTO: Contiene los identificadores de las tablas PRODUCTO y VENTA.

- VISITAS: Registra visitas de clientes.

# CONSULTAS

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

# PROCEDIMIENTOS

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

# FUNCIONES

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

## ROLES

roles de la bd

## AUTORES

- Victor Andres Marimon Mendoza -- (3reehuy@gmail.com)
- Gean Franco Jacome Laguna -- (deepagmf710@gmail.com)

## LICENCIA

Este proyecto está bajo la Licencia :white_check_mark: MIT.
