1. **Programar un evento para verificar el estado de las maquinarias registradas en la tabla MAQUINARIA y realizar su mantenimiento.**

CREATE EVENT estadoMaquinaria 
ON SCHEDULE EVERY 6 MONTH 
STARTS '2024-01-01 00:00:00' 
DO 
    INSERT INTO log(descripcion, fecha) 
    VALUES(CONCAT('Reporte mensual del estado de inventario de la maquinaria', '(SELECT SUM(cantidad) FROM MAQUINARIA)'), NOW()); 

2. **Verificar las cantidades de insumos en la tabla INSUMOS para asegurar que no caigan por debajo del nivel mínimo.**

CREATE EVENT cantidadInsumos
ON SCHEDULE EVERY 1 MONTH 
STARTS '2024-01-01 00:00:00' 
DO 
    INSERT INTO log (descripcion, fecha)
    SELECT CONCAT('La cantidad mínima de insumos fue superada, se recomienda revisar urgentemente el inventario', (SELECT SUM(cantidad) FROM INSUMOS)), NOW()
    WHERE (SELECT SUM(cantidad) FROM INSUMOS) < 100;

3. **Programar un evento para la revisión y actualización de los permisos de las maquinarias en la tabla MAQUINARIA**

CREATE EVENT ObtenerProductosPorStock
ON SCHEDULE EVERY 1 MONTH 
STARTS '2024-01-10 00:00:00'
DO
    SELECT * 
    FROM PRODUCTOS 
    WHERE Categoria = categoria AND Cantidad < stockLimite;

4. **Generar automáticamente un evento para revisar la tabla FERTILIZANTES y asegurar que estén en buen estado antes de su uso en los cultivos.**

CREATE EVENT evaluacionFertilizantes
ON SCHEDULE EVERY 1 WEEK 
STARTS '2024-01-10 00:00:00'
DO
    INSERT INTO log(descripcion, fecha)
    SELECT 'El fertilizante debe ser revisado y cambiado, debido a que presenta vencimiento' , NOW()
    WHERE (SELECT fecha_exp FROM FERTILIZANTES) < NOW();

5. **Revisar los productos en la tabla PRODUCTO para detectar productos cercanos a su fecha de vencimiento y emitir alertas.**

CREATE EVENT estadoProductos
ON SCHEDULE EVERY 1 WEEK
STARTS '2024-01-01 00:00:00'
DO 
    INSERT INTO log (descripcion, fecha)
    SELECT 'El producto se encuentra vencido, se debe realizar un cambio' , NOW()
    WHERE (SELECT fecha_vencimiento FROM PRODUCTO) < NOW();

6. **Generar un reporte mensual sobre las ventas registradas en la tabla VENTA y enviar un resumen al equipo de ventas.**

CREATE EVENT estadoProductos
ON SCHEDULE EVERY 1 MONTH
STARTS '2024-01-01 00:00:00'
DO 
    INSERT INTO log (descripcion, fecha)
    SELECT ('Las ventas del anterior mes fueron las siguientes: ', (SELECT SUM(VENTA.subtotal) FROM VENTA INNER JOIN VENTA_PRODUCTO ON VENTA.venta_id = VENTA_PRODUCTO.venta_id WHERE VENTA_PRODUCTO.fecha BETWEEN (MONTH(NOW())-1) AND NOW())) , NOW();

7. **Programar un evento para evaluar el desempeño de los empleados de acuerdo con los registros de la tabla HISTORIAL_EMPLEADO.**

CREATE EVENT evaluacionEmpleado
ON SCHEDULE EVERY 1 MONTH
STARTS '2024-01-10 00:00:00'
DO
    INSERT INTO log(descripcion, fecha)
    SELECT 'El desempeño del empleado ha sido pesimo, se recomienda realizar una intervención con el empleado para mejorar ' , NOW()
    WHERE (SELECT tipo FROM HISTORIAL_EMPLEADO) = 'Grave' OR 'Pesimo';

8. **Programar la revisión periódica de las semillas almacenadas en la tabla SEMILLAS para verificar su viabilidad y calidad.**

CREATE EVENT evaluacionSemillas
ON SCHEDULE EVERY 1 WEEK 
STARTS '2024-01-10 00:00:00'
DO
    INSERT INTO log(descripcion, fecha)
    SELECT 'La semilla debe ser revisada y cambiada, debido a que presenta vencimiento' , NOW()
    WHERE (SELECT fecha_exp FROM SEMILLAS) < NOW();

9. **Verificar el uso de herbicidas en los cultivos registrados en la tabla HERBICIDAS_CULT para asegurar su aplicación correcta.**

CREATE EVENT evaluacionUsoHerbicidas
ON SCHEDULE EVERY 1 MONTH 
STARTS '2024-01-10 00:00:00'
DO
    INSERT INTO log(descripcion, fecha)
    SELECT 'El uso del herbicida no esta completo o no contiene información, se recomienda verificar los datos' , NOW()
    WHERE (SELECT modo_uso FROM HERBICIDAS) IS NULL;

10. **Revisar los precios en la tabla PRODUCTO y ajustar automáticamente según las condiciones del mercado.**

CREATE EVENT precioProductos
ON SCHEDULE EVERY 1 MONTH 
STARTS '2024-01-10 00:00:00'
DO
    UPDATE PRODUCTO
    SET precio = 0
    WHERE cantidad < 0;

11. **Programar una auditoría de las herramientas almacenadas en la tabla HERRAMIENTAS para verificar su estado y disponibilidad.**

CREATE EVENT evaluacionHerramientas
ON SCHEDULE EVERY 1 WEEK 
STARTS '2024-01-10 00:00:00'
DO
    INSERT INTO log(descripcion, fecha)
    SELECT 'El inventario de las herramientas es bajo, se deben tomar acciones' , NOW()
    WHERE (SELECT SUM(cantidad) FROM HERRAMIENTAS) < 100;

12. **Programar la generación automática de informes financieros basados en las compras y ventas registradas en COMPRA y VENTA.**

CREATE EVENT informeCompraVenta
ON SCHEDULE EVERY 1 MONTH 
STARTS '2024-01-10 00:00:00'
DO
    INSERT INTO log(descripcion, fecha)
    VALUES (CONCAT('Informe mensual ', NOW() ,' compras: ', (SELECT SUM(subtotal) FROM PROVEEDOR_COMPRA WHERE fecha BETWEEN (MONTH(NOW())-1) AND NOW()), 
                   'Informe mensual ', NOW() ,' ventas: ', (SELECT SUM(subtotal) FROM VENTA INNER JOIN VENTA_PRODUCTO ON VENTA.venta_id = VENTA_PRODUCTO.venta_id WHERE VENTA_PRODUCTO.fecha BETWEEN (MONTH(NOW())-1) AND NOW())), 
                    NOW());

13. **Programar el mantenimiento de herramientas en la tabla HERRAMIENTAS para asegurar su correcto funcionamiento.**

DELIMITER //

CREATE EVENT ObtenerProductosPorStock
ON SCHEDULE EVERY 1 MONTH 
STARTS '2024-01-10 00:00:00'
DO
    SELECT * 
    FROM PRODUCTOS 
    WHERE Categoria = categoria AND Cantidad < stockLimite;

14. **Automatizar la verificación de la fecha de vencimiento de los insumos en la tabla INSUMOS y generar alertas cuando se acerque la fecha límite.**

CREATE EVENT evaluacionInsumos
ON SCHEDULE EVERY 1 WEEK 
STARTS '2024-01-10 00:00:00'
DO
    INSERT INTO log(descripcion, fecha)
    SELECT 'El insumo presenta esta vencido, se recomienda cambiarlo' , NOW()
    WHERE (SELECT fecha_exp FROM INSUMOS) < NOW();

15. **Revisar los registros de la tabla PROVEEDOR para asegurar la calidad y cumplimiento de los proveedores**

DELIMITER //

CREATE EVENT ObtenerProductosPorStock
ON SCHEDULE EVERY 1 MONTH 
STARTS '2024-01-10 00:00:00'
DO
    SELECT * 
    FROM PRODUCTOS 
    WHERE Categoria = categoria AND Cantidad < stockLimite;

16. **Programar la generación de un informe basado en los registros de la tabla CULTIVOS al final de cada ciclo de cultivo, incluyendo fechas de siembra y cosecha.**

CREATE EVENT informeCultivo
ON SCHEDULE EVERY 3 WEEK
STARTS '2024-01-10 00:00:00'
DO
    SELECT cultivo_id AS Cultivo, fecha_siembra AS FechaSembrado, fecha_cosecha AS FechaRecoleccion, observaciones, TIPO_CULTIVO.nombre AS TipoCultivo
    FROM CULTIVOS
    INNER JOIN TIPO_CULTIVO
    ON CULTIVOS.tipo_cultivo_id = TIPO_CULTIV.tipo_cultivo_id;

17. **Enviar recordatorios automáticos a los clientes registrados en la tabla CLIENTE sobre pagos pendientes.**

CREATE EVENT recordatorioPagoCliente
ON SCHEDULE EVERY 1 WEEK
STARTS '2024-01-01 00:00:00'
DO 
    INSERT INTO log (descripcion, fecha)
    SELECT 'El cliente no ha cancelado la compra, se realiza el siguiente recordatorio para tener un control personalizado de este caso' , NOW()
    WHERE (SELECT estado FROM VENTA) = 'Pendiente' OR 'Sin Pagar';

18. **Revisar y actualizar la información en la tabla HISTORIAL_EMPLEADO para reflejar cambios en el estado o desempeño del personal.**

CREATE EVENT actualizacionHistorialEmpleado
ON SCHEDULE EVERY 1 MONTH
STARTS '2024-01-01 00:00:00'
DO 
    INSERT INTO HISTORIAL_EMPLEADO(evento, descripcion, tipo, fecha, cc_empleado)
    VALUES( 'Inicio mes', 'Se inicia un nuevo mes, el historial del empleado es actualizado', 'Informe', NOW(), (SELECT cc_empleado FROM EMPLEADO WHERE estado = 'Activo'));

19. **Revisar el estado de los herbicidas registrados en HERBICIDAS antes de su uso en los cultivos.**

DELIMITER //

CREATE EVENT ObtenerProductosPorStock
ON SCHEDULE EVERY 1 MONTH 
STARTS '2024-01-10 00:00:00'
DO
    SELECT * 
    FROM PRODUCTOS 
    WHERE Categoria = categoria AND Cantidad < stockLimite;

20. **Verificar los datos de contacto y el estado de los proveedores en la tabla PROVEEDOR para mantener la información actualizada.**

CREATE EVENT estadoProveedores
ON SCHEDULE EVERY 3 MONTH
STARTS '2024-01-01 00:00:00'
DO 
    INSERT INTO log (descripcion, fecha)
    SELECT 'El proveedor no tiene su telefono actualizado, además no se encuentra activo' , NOW()
    WHERE (SELECT telefono FROM PROVEEDOR) IS NULL AND (SELECT telefono FROM PROVEEDOR) = 'Inactivo' OR 'Desactivado';

    UPDATE PROVEEDOR
    SET telefono = '000000'
    WHERE nit IN(SELECT nit FROM PROVEEDOR WHERE telefono IS NULL); // ACA TOCA ARREGLA EL WHERE
