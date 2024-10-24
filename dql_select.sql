-- 1.
SELECT * FROM CATEGORIA_PRO;

-- 2. 
SELECT COUNT(*) FROM CATEGORIA_PRO;

-- 3.
SELECT * FROM CONTINENTE;

-- 4. 
SELECT pais FROM PAIS WHERE continente_id = 1;

-- 5. 
SELECT continente_id, COUNT(*) AS num_countries FROM PAIS GROUP BY continente_id;

-- 6.
SELECT ciudad FROM CIUDAD WHERE pais_id = 1;

-- 7. 
SELECT * FROM CLIENTE WHERE cc_cliente = 123456;

-- 8. 
SELECT * FROM CLIENTE WHERE fecha_afiliacion > '2023-01-01';

-- 9. 
SELECT genero, COUNT(*) FROM CLIENTE GROUP BY genero;

-- 10. 
SELECT CLIENTE.cc_cliente, CLIENTE.telefono, CLIENTE.email, DIRECCION.calle, DIRECCION.carrera, DIRECCION.numero
FROM CLIENTE
JOIN DIRECCION ON CLIENTE.direccion_id = DIRECCION.id;

-- 11. 
SELECT USUARIO.nombre, CARGO.nombre_cargo
FROM USUARIO
JOIN CARGO ON USUARIO.cargo_id = CARGO.cargo_id;

-- 12. 
SELECT CARGO.nombre_cargo, COUNT(*) AS num_employees
FROM USUARIO
JOIN CARGO ON USUARIO.cargo_id = CARGO.cargo_id
GROUP BY CARGO.nombre_cargo;

-- 13. 
SELECT * FROM USUARIO WHERE fecha_contratacion > '2022-01-01';

-- 14. 
SELECT nombre, telefono, email FROM USUARIO WHERE usuario_id = 1;

-- 15. 
SELECT * FROM FERTILIZANTES;

-- 16. 
SELECT tipo_fertilizante, COUNT(*) FROM FERTILIZANTES GROUP BY tipo_fertilizante;

-- 17. 
SELECT * FROM HERRAMIENTAS;

-- 18.
SELECT tipo_herramienta, COUNT(*) FROM HERRAMIENTAS GROUP BY tipo_herramienta;

-- 19. 
SELECT * FROM HERRAMIENTAS WHERE id_herramienta = 1;

-- 20. 
SELECT * FROM SEMILLAS;

-- 21. 
SELECT tipo_semilla, COUNT(*) FROM SEMILLAS GROUP BY tipo_semilla;

-- 22. 
SELECT * FROM SEMILLAS WHERE id_semilla = 1;

-- 23. 
SELECT * FROM VENTAS WHERE cc_cliente = 123456;

-- 24. 
SELECT SUM(valor_venta) FROM VENTAS WHERE cc_cliente = 123456;

-- 25. 
SELECT * FROM VENTAS WHERE MONTH(fecha_venta) = 10;

-- 26. 
SELECT CATEGORIA_PRO.nombre_categoria, SUM(VENTAS.valor_venta) AS total_sales
FROM VENTAS
JOIN PRODUCTO ON VENTAS.id_producto = PRODUCTO.id_producto
JOIN CATEGORIA_PRO ON PRODUCTO.id_categoria = CATEGORIA_PRO.id_categoria
GROUP BY CATEGORIA_PRO.nombre_categoria;

-- 27. 
SELECT PRODUCTO.nombre_producto, SUM(VENTAS.valor_venta) AS total_sales
FROM VENTAS
JOIN PRODUCTO ON VENTAS.id_producto = PRODUCTO.id_producto
GROUP BY PRODUCTO.nombre_producto
ORDER BY total_sales DESC
LIMIT 5;

-- 28. 
SELECT SUM(valor_venta) AS total_revenue
FROM VENTAS
WHERE YEAR(fecha_venta) = YEAR(CURDATE());

-- 29.
SELECT COUNT(*) AS num_customers FROM CLIENTE;

-- 30.
SELECT MONTH(fecha_afiliacion) AS month, COUNT(*) AS num_customers
FROM CLIENTE
GROUP BY month;

-- 31. 
SELECT * FROM CLIENTE WHERE estado = 'inactivo';

-- 32. 
SELECT * FROM CLIENTE WHERE estado = 'activo';

-- 33. 
SELECT * FROM CLIENTE WHERE tipo_pago = 'Tarjeta de crédito';

-- 34. 
SELECT PRODUCTO.nombre_producto, CATEGORIA_PRO.nombre_categoria
FROM PRODUCTO
JOIN CATEGORIA_PRO ON PRODUCTO.id_categoria = CATEGORIA_PRO.id_categoria;

-- 35. 
SELECT nombre_producto, stock FROM PRODUCTO;

-- 36. 
SELECT nombre_producto, stock FROM PRODUCTO WHERE stock < 10;

-- 37. 
SELECT * FROM PEDIDOS WHERE cc_cliente = 123456;

-- 38. 
SELECT COUNT(*) FROM PEDIDOS WHERE fecha_pedido > (CURDATE() - INTERVAL 1 MONTH);

-- 39. 
SELECT CATEGORIA_PRO.nombre_categoria, COUNT(*) AS num_orders
FROM PEDIDOS
JOIN PRODUCTO ON PEDIDOS.id_producto = PRODUCTO.id_producto
JOIN CATEGORIA_PRO ON PRODUCTO.id_categoria = CATEGORIA_PRO.id_categoria
GROUP BY CATEGORIA_PRO.nombre_categoria;

-- 40. 
SELECT * FROM TRANSACCIONES WHERE tipo_pago = 'Tarjeta de crédito';

-- 41.
SELECT SUM(valor_transaccion) FROM TRANSACCIONES WHERE tipo_pago = 'Efectivo';

-- 42. 
SELECT DISTINCT CLIENTE.cc_cliente, CLIENTE.nombre
FROM TRANSACCIONES
JOIN CLIENTE ON TRANSACCIONES.cc_cliente = CLIENTE.cc_cliente
WHERE TRANSACCIONES.fecha_transaccion > (CURDATE() - INTERVAL 6 MONTH);

-- 43. 
SELECT MONTH(fecha_transaccion) AS month, COUNT(*) AS num_transactions
FROM TRANSACCIONES
GROUP BY month;

-- 44. 
SELECT * FROM RETROALIMENTACION_CLIENTES;

-- 45. 
SELECT * FROM RETROALIMENTACION_CLIENTES WHERE calificacion = 5;

-- 46.
SELECT * FROM MANTENIMIENTO_HERRAMIENTAS;

-- 47. 
SELECT SUM(costo_mantenimiento) FROM MANTENIMIENTO_HERRAMIENTAS WHERE YEAR(fecha_mantenimiento) = YEAR(CURDATE());

-- 48. 
SELECT PROVEEDORES.nombre_proveedor
FROM PROVEEDORES
JOIN PRODUCTO ON PROVEEDORES.id_proveedor = PRODUCTO.id_proveedor
WHERE PRODUCTO.id_producto = 1;

-- 49. 
SELECT CATEGORIA_PRO.nombre_categoria, COUNT(DISTINCT PROVEEDORES.id_proveedor) AS num_suppliers
FROM PRODUCTO
JOIN CATEGORIA_PRO ON PRODUCTO.id_categoria = CATEGORIA_PRO.id_categoria
JOIN PROVEEDORES ON PRODUCTO.id_proveedor = PROVEEDORES.id_proveedor
GROUP BY CATEGORIA_PRO.nombre_categoria;

-- 50. 
SELECT COUNT(*) AS num_suppliers FROM PROVEEDORES;


-- 51. 
SELECT * FROM CLIENTE
WHERE cc_cliente NOT IN (SELECT cc_cliente FROM VENTAS WHERE fecha_venta > (CURDATE() - INTERVAL 1 YEAR));

-- 52.
SELECT cc_cliente, SUM(valor_venta) AS total_sales
FROM VENTAS
GROUP BY cc_cliente;

-- 53.
SELECT MONTH(fecha_venta) AS month, SUM(valor_venta) AS total_sales
FROM VENTAS
GROUP BY month;

-- 54.
SELECT * FROM FERTILIZANTES WHERE tipo_fertilizante = 'Orgánico';

-- 55. 
SELECT fabricante, COUNT(*) AS num_fertilizers
FROM FERTILIZANTES
GROUP BY fabricante;

-- 56.
SELECT * FROM MANTENIMIENTO_HERRAMIENTAS
WHERE fecha_proximo_mantenimiento BETWEEN CURDATE() AND (CURDATE() + INTERVAL 30 DAY);

-- 57.
SELECT SUM(stock) AS total_seed_stock FROM SEMILLAS;

-- 58. 
SELECT nombre_producto, stock FROM PRODUCTO WHERE stock > 50;

-- 59. 
SELECT * FROM HERRAMIENTAS WHERE fecha_compra > '2023-01-01';

-- 60.
SELECT PRODUCTO.nombre_producto, SUM(VENTAS.cantidad) AS total_sold
FROM VENTAS
JOIN PRODUCTO ON VENTAS.id_producto = PRODUCTO.id_producto
WHERE fecha_venta > (CURDATE() - INTERVAL 1 YEAR)
GROUP BY PRODUCTO.nombre_producto
ORDER BY total_sold DESC
LIMIT 1;

-- 61. ENTAS.cantidad) AS total_sold
FROM VENTAS
JOIN PRODUCTO ON VENTAS.id_producto = PRODUCTO.id_producto
WHERE fecha_venta > (CURDATE() - INTERVAL 1 YEAR)
GROUP BY PRODUCTO.nombre_producto
ORDER BY total_sold ASC
LIMIT 1;

-- 62. 
SELECT * FROM CLIENTE WHERE email LIKE '%gmail.com';

-- 63.
SELECT * FROM USUARIO WHERE fecha_fin_contrato BETWEEN CURDATE() AND (CURDATE() + INTERVAL 3 MONTH);

-- 64. 
SELECT 
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) < 20 THEN 'Under 20'
        WHEN TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) BETWEEN 20 AND 30 THEN '20-30'
        WHEN TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) BETWEEN 31 AND 40 THEN '31-40'
        ELSE 'Above 40'
    END AS age_group,
    COUNT(*) AS num_customers
FROM CLIENTE
GROUP BY age_group;

-- 65. 
SELECT PRODUCTO.nombre_producto, VENTAS.valor_venta, VENTAS.descuento
FROM VENTAS
JOIN PRODUCTO ON VENTAS.id_producto = PRODUCTO.id_producto
WHERE VENTAS.descuento > 0;

-- 66. 
SELECT SUM(valor_venta - (valor_venta * descuento / 100)) AS total_discounted_revenue
FROM VENTAS
WHERE descuento > 0;

-- 67. 
SELECT CLIENTE.cc_cliente, SUM(VENTAS.valor_venta) AS lifetime_sales
FROM CLIENTE
JOIN VENTAS ON CLIENTE.cc_cliente = VENTAS.cc_cliente
GROUP BY CLIENTE.cc_cliente
ORDER BY lifetime_sales DESC
LIMIT 3;

-- 68. 
SELECT CARGO.nombre_cargo, COUNT(*) AS num_employees
FROM USUARIO
JOIN CARGO ON USUARIO.cargo_id = CARGO.cargo_id
GROUP BY CARGO.nombre_cargo;

-- 69. 
SELECT USUARIO.nombre, SUM(VENTAS.valor_venta) AS total_sales
FROM USUARIO
JOIN VENTAS ON USUARIO.usuario_id = VENTAS.usuario_id
GROUP BY USUARIO.nombre;

-- 70. 
SELECT CLIENTE.cc_cliente, RETROALIMENTACION_CLIENTES.calificacion, RETROALIMENTACION_CLIENTES.comentario
FROM CLIENTE
JOIN RETROALIMENTACION_CLIENTES ON CLIENTE.cc_cliente = RETROALIMENTACION_CLIENTES.cc_cliente
WHERE RETROALIMENTACION_CLIENTES.calificacion >= 4;

-- 71. 
SELECT SUM(valor_total) AS total_order_value
FROM PEDIDOS
WHERE fecha_pedido > (CURDATE() - INTERVAL 6 MONTH);

-- 72. 
SELECT cc_cliente, COUNT(*) AS num_orders
FROM PEDIDOS
WHERE fecha_pedido > (CURDATE() - INTERVAL 1 YEAR)
GROUP BY cc_cliente
HAVING num_orders > 3;

-- 73. 
SELECT tipo_pago, AVG(valor_transaccion) AS avg_transaction_value
FROM TRANSACCIONES
GROUP BY tipo_pago;

-- 74. 
SELECT * FROM USUARIO
WHERE fecha_ultimo_login < (CURDATE() - INTERVAL 30 DAY);

-- 75.
SELECT CLIENTE.cc_cliente, RETROALIMENTACION_CLIENTES.calificacion, RETROALIMENTACION_CLIENTES.comentario
FROM CLIENTE
JOIN RETROALIMENTACION_CLIENTES ON CLIENTE.cc_cliente = RETROALIMENTACION_CLIENTES.cc_cliente;

-- 76. 
SELECT cc_cliente, COUNT(*) AS num_transactions
FROM TRANSACCIONES
GROUP BY cc_cliente;

-- 77.
SELECT cc_cliente, SUM(valor_venta) AS total_spent
FROM VENTAS
WHERE fecha_venta > (CURDATE() - INTERVAL 1 YEAR)
GROUP BY cc_cliente
HAVING total_spent > 1000;

-- 78.
SELECT nombre_producto, stock FROM PRODUCTO WHERE stock < 10;

-- 79.
SELECT id_herramienta, COUNT(*) AS num_maintenance
FROM MANTENIMIENTO_HERRAMIENTAS
WHERE fecha_mantenimiento > (CURDATE() - INTERVAL 1 YEAR)
GROUP BY id_herramienta
HAVING num_maintenance > 2;

-- 80. 
SELECT DISTINCT PROVEEDORES.nombre_proveedor
FROM PROVEEDORES
JOIN PRODUCTO ON PROVEEDORES.id_proveedor = PRODUCTO.id_proveedor
JOIN VENTAS ON PRODUCTO.id_producto = VENTAS.id_producto
WHERE VENTAS.fecha_venta > (CURDATE() - INTERVAL 6 MONTH);

-- 81. 
SELECT SUM(valor_transaccion) FROM TRANSACCIONES WHERE tipo_pago = 'Tarjeta de crédito';

-- 82. 
SELECT HERRAMIENTAS.nombre_herramienta, SUM(MANTENIMIENTO_HERRAMIENTAS.costo_mantenimiento) AS total_maintenance_cost
FROM HERRAMIENTAS
JOIN MANTENIMIENTO_HERRAMIENTAS ON HERRAMIENTAS.id_herramienta = MANTENIMIENTO_HERRAMIENTAS.id_herramienta
GROUP BY HERRAMIENTAS.nombre_herramienta
ORDER BY total_maintenance_cost DESC
LIMIT 3;

-- 83.
SELECT * FROM FERTILIZANTES WHERE id_proveedor = 1;

-- 84. 
SELECT cc_cliente, COUNT(*) AS num_orders
FROM PEDIDOS
WHERE fecha_pedido > (CURDATE() - INTERVAL 1 YEAR)
GROUP BY cc_cliente;

-- 85.
SELECT AVG(stock) AS avg_stock FROM PRODUCTO;

-- 86. 
SELECT nombre_producto FROM PRODUCTO
WHERE id_producto NOT IN (SELECT DISTINCT id_producto FROM VENTAS);

-- 87. 
SELECT cc_cliente, COUNT(*) AS num_discounts
FROM VENTAS
WHERE descuento > 0
GROUP BY cc_cliente
HAVING num_discounts > 1;

-- 88. 
SELECT tipo_contrato, COUNT(*) AS total_empleados
FROM EMPLEADO
GROUP BY tipo_contrato;

-- 89.
SELECT e.nombre, SUM(h.horas) AS total_horas
FROM EMPLEADO e
JOIN HORAS_TRABAJO h ON e.empleado_id = h.empleado_id
WHERE h.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY e.nombre;

-- 90.
SELECT a.nombre_area, SUM(e.salario) AS costo_total
FROM EMPLEADO e
JOIN AREA a ON e.area_id = a.area_id
GROUP BY a.nombre_area;

--91.
SELECT p.nombre_producto, SUM(v.cantidad) AS total_vendido
FROM VENTA v
JOIN PRODUCTO p ON v.producto_id = p.producto_id
WHERE v.fecha_venta >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY p.nombre_producto;


-- 92.
SELECT p.nombre_producto, SUM(v.cantidad) AS total_vendido
FROM VENTA v
JOIN PRODUCTO p ON v.producto_id = p.producto_id
WHERE v.tipo_mercado = 'Local'
GROUP BY p.nombre_producto
ORDER BY total_vendido DESC;


-- 93.
SELECT p.nombre_producto, SUM(v.cantidad * v.precio_unitario) AS ingreso_total
FROM VENTA v
JOIN PRODUCTO p ON v.producto_id = p.producto_id
GROUP BY p.nombre_producto;


-- 94. 
SELECT c.nombre_cliente
FROM CLIENTE c
LEFT JOIN VENTA v ON c.cliente_id = v.cliente_id
WHERE v.fecha_venta < DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
   OR v.fecha_venta IS NULL;


-- 95. 
SELECT c.nombre_cliente, SUM(v.cantidad) AS total_vendido
FROM CLIENTE c
JOIN VENTA v ON c.cliente_id = v.cliente_id
GROUP BY c.nombre_cliente;


--96.

SELECT c.nombre_cliente, p.nombre_producto, SUM(v.cantidad) AS total_vendido
FROM CLIENTE c
JOIN VENTA v ON c.cliente_id = v.cliente_id
JOIN PRODUCTO p ON v.producto_id = p.producto_id
GROUP BY c.nombre_cliente, p.nombre_producto
ORDER BY c.nombre_cliente, total_vendido DESC;


-- 97.
SELECT 
    DATE_FORMAT(v.fecha_venta, '%Y-%m') AS mes,
    SUM(v.precio_total) AS total_ingresos,
    (SELECT SUM(g.monto_gasto) 
     FROM GASTOS g 
     WHERE DATE_FORMAT(g.fecha_gasto, '%Y-%m') = DATE_FORMAT(v.fecha_venta, '%Y-%m')) AS total_gastos
FROM VENTA v
GROUP BY mes;


-- 98.
SELECT p.nombre_producto, SUM(c.costo) AS costo_produccion
FROM PRODUCTO p
JOIN COSTOS_PRODUCCION c ON p.producto_id = c.producto_id
GROUP BY p.nombre_producto;


-- 99. 
SELECT p.nombre_producto, 
       SUM(v.precio_total) - SUM(c.costo) AS margen_ganancia
FROM PRODUCTO p
JOIN VENTA v ON p.producto_id = v.producto_id
JOIN COSTOS_PRODUCCION c ON p.producto_id = c.producto_id
GROUP BY p.nombre_producto;



-- 100.
SELECT MONTH(fecha_afiliacion) AS month, COUNT(*) AS num_customers
FROM CLIENTE
GROUP BY month;
