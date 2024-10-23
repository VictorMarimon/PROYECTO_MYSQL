1. **Retorna la cantidad total de insumos disponibles**

DELIMITER //

CREATE FUNCTION calcularStockInsumos() 
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN (SELECT NUM(cantidad) FROM INSUMOS);

END //
DELIMITER ;


2. **Calcula la edad de un cliente usando su fecha de nacimiento registrada**

DELIMITER //

CREATE FUNCTION calcularEdadCliente(CEDULA INT) 
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN((SELECT YEAR(fecha_nacimiento) FROM CLIENTE WHERE cc_cliente = CEDULA) - YEAR(NOW()));

END //
DELIMITER ;

3. **Calcula la edad de un empleado usando su fecha de nacimiento registrada**

DELIMITER //

CREATE FUNCTION calcularEdadEmpleado(CEDULA INT) 
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN((SELECT YEAR(fecha_nacimiento) FROM EMPLEADO WHERE cc_empleado = CEDULA) - YEAR(NOW()));

END //
DELIMITER ;

4. **Retorna el producto con mayor cantidad de ventas de la tabla VENTA_PRODUCTO**

DELIMITER //

CREATE FUNCTION obtenerProductoMasVendido() 
RETURNS VARCHAR(100)
DETERMINISTIC 
BEGIN

    RETURN(SELECT PRODUCTO.nombre FROM VENTA_PRODUCTO INNER JOIN PRODUCTO ON VENTA_PRODUCTO.producto_id = PRODUCTO.producto_id ORDER BY VENTA_PRODUCTO.cantidad ASC LIMIT 1);

END //
DELIMITER ;

5. **Devuelve el proveedor que ha realizado más transacciones**

DELIMITER //

CREATE FUNCTION obtenerProveedorFrecuente()
RETURNS VARCHAR(100)
DETERMINISTIC 
BEGIN

    RETURN(SELECT PROVEEDOR.nombre FROM PROVEEDOR_COMPRA INNER JOIN PROVEEDOR ON PROVEEDOR_COMPRA.proveedor_nit = PROVEEDOR.nit ORDER BY COUNT(PROVEEDOR_COMPRA.proveedor_nit) LIMIT 1);

END //
DELIMITER ;

6. **Revisa si el stock de un producto específico es suficiente (por encima de un mínimo)**

DELIMITER //

CREATE FUNCTION verificarStockProducto(PRODUCTO_ID INT)
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN(SELECT cantidad FROM PRODUCTO WHERE producto_id = PRODUCTO_ID AND cantidad > 10);

END //
DELIMITER ;

7. **Devuelve la cantidad de cultivos que corresponden a un tipo específico de cultivo**

DELIMITER //

CREATE FUNCTION obtenerCantidadCultivosPorTipo(TIPO_CULTIVO_ID INT)
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN(SELECT COUNT(*) FROM CULTIVOS WHERE tipo_cultivo_id = TIPO_CULTIVO_ID);

END //
DELIMITER ;

8. **Calcula el promedio de ventas mensuales**

DELIMITER //

CREATE FUNCTION calcularPromedioVentasMensuales()
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN(SELECT AVG(cantidad) FROM VENTA_PRODUCTO WHERE fecha BETWEEN (MONTH(NOW()) -1) AND MONTH(NOW()));

END //
DELIMITER ;

9. **Retorna una lista de los clientes cuyo estado sea "Activo"**

DELIMITER //

CREATE FUNCTION obtenerClientesActivos()
RETURNS VARCHAR(10000)
DETERMINISTIC 
BEGIN

    RETURN(SELECT cc_cliente FROM CLIENTE WHERE estado = 'Activo');

END //
DELIMITER ;

10. **Calcula la duración (en años y meses) desde la fecha de contrato de un empleado hasta la fecha actual**

DELIMITER //

CREATE FUNCTION calcularDuracionContratoEmpleado(CEDULA INT)
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN((SELECT YEAR(fecha_contrato) FROM EMPLEADO WHERE cc_empleado = CEDULA AND estado = 'Activo') - YEAR(NOW()));

END //
DELIMITER ;

11. **Retorna la cantidad de insumos cuya fecha de vencimiento es anterior a la fecha actual**

DELIMITER //

CREATE FUNCTION obtenerCantidadInsumosVencidos() 
RETURNS VARCHAR(1000)
DETERMINISTIC 
BEGIN

    RETURN(SELECT * FROM INSUMOS WHERE fecha_exp < NOW());

END //
DELIMITER ;

12. **Calcula el salario total recibido por un empleado, sumando los bonos**

DELIMITER //

CREATE FUNCTION calcularSalarioTotalEmpleado(CEDULA INT)
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN(SELECT SUM(monto + bono) FROM SALARIO WHERE cc_empleado = CEDULA);

END //
DELIMITER ;

13. **Devuelve una lista de empleados que ocupan un cargo específico**

DELIMITER //

CREATE FUNCTION obtenerEmpleadosPorCargo(CARGO_ID INT)
RETURNS VARCHAR(1000)
DETERMINISTIC 
BEGIN

    RETURN(SELECT cc_empleado FROM EMPLEADO WHERE cargo_id = CARGO_ID);

END //
DELIMITER ;

14. **Retorna todas las ventas que ha realizado un cliente específico**

DELIMITER //

CREATE FUNCTION obtenerVentasPorCliente(CEDULA INT)
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN(SELECT COUNT(*) FROM VENTA WHERE cc_cliente = CEDULA);

END //
DELIMITER ;

15. **Devuelve una lista de maquinarias que requieren mantenimiento en los próximos 30 días según su registro en la tabla MAQUINARIA**

DELIMITER //

CREATE FUNCTION obtenerProximasFechasMantenimientoMaquinaria()
RETURNS VARCHAR(1000)
DETERMINISTIC 
BEGIN

    RETURN(SELECT HOLA FROM HOLA WHERE HOLA = 'hola');

END //
DELIMITER ;

16. **Retorna los detalles de un producto específico, incluyendo su nombre, cantidad y precio**

DELIMITER //

CREATE FUNCTION obtenerDetallesProducto(PRODUCTO_ID INT)
RETURNS VARCHAR(1000)
DETERMINISTIC 
BEGIN

    RETURN(SELECT nombre AS Producto, cantidad AS StockDisponible, precio AS CostoUnitario FROM PRODUCTO WHERE producto_id = PRODUCTO_ID);

END //
DELIMITER ;

17. **Calcula el total que un cliente ha gastado en la tienda sumando todas sus compras registradas**

DELIMITER //

CREATE FUNCTION calcularGastoTotalCliente(CEDULA INT)
RETURNS INT
DETERMINISTIC 
BEGIN

    RETURN(SELECT SUM(subtotal) FROM VENTA WHERE cc_cliente = CEDULA);

END //
DELIMITER ;

18. **Retorna una lista de empleados que han recibido bonos en su salario**

DELIMITER //

CREATE FUNCTION obtenerEmpleadosConBonos()
RETURNS VARCHAR(1000)
DETERMINISTIC 
BEGIN

    RETURN(SELECT cc_empleado FROM SALARIO WHERE bono > 0);

END //
DELIMITER ;

19. **Retorna si un producto está disponible en el inventario**

DELIMITER //

CREATE FUNCTION verificarExistenciaProducto(PRODUCTO_ID INT)
RETURNS VARCHAR(100)
DETERMINISTIC 
BEGIN

    RETURN(SELECT nombre FROM PRODUCTO WHERE producto_id = PRODUCTO_ID AND cantidad > 0);

END //
DELIMITER ;

20. **Devuelve una lista de fertilizantes aplicados a un cultivo específico**

DELIMITER //

CREATE FUNCTION obtenerFertilizantesPorCultivo(CULTIVO_ID INT)
RETURNS VARCHAR(1000)
DETERMINISTIC 
BEGIN

    RETURN(SELECT FERTILIZANTES.tipo, FERTILIZANTES.composicion FROM FERTILIZANTES_CULT INNER JOIN FERTILIZANTES ON FERTILIZANTES_CULT.fertilizante_id = FERTILIZANTES.fertilizante_id WHERE FERTILIZANTES_CULT.cultivo_id = CULTIVO_ID);

END //
DELIMITER ;
