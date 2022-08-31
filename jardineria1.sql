SELECT codigo_oficina, ciudad FROM oficina;

SELECT ciudad, telefono FROM oficina WHERE pais = 'España';

SELECT nombre, apellido1, apellido2, email FROM empleado WHERE codigo_jefe = '7';

select * from empleado where codigo_jefe is null;

SELECT nombre, apellido1, apellido2, puesto FROM empleado 
WHERE puesto <> 'Representante Ventas';

SELECT nombre_cliente FROM cliente WHERE pais= 'Spain';

SELECT distinct estado FROM pedido;

-- fechas del 2008
select distinct codigo_cliente FROM pago
WHERE (SELECT year(fecha_pago) = '2008');
-- op 2
select distinct codigo_cliente FROM pago 
WHERE fecha_pago between '2008-00-00' and '2008-12-31';
-- op 3 con date_format
-- no salio

SELECT * FROM pedido 
WHERE (SELECT year(fecha_pedido) = '2009')
and estado = 'Rechazado';

SELECT * FROM pedido WHERE estado = 'Entregado'
and (SELECT month(fecha_entrega) = '01');

SELECT * FROM pago WHERE forma_pago = 'Paypal' 
and (SELECT year(fecha_pago) = '2008')
order by total desc;

SELECT distinct forma_pago FROM pago;

SELECT * FROM gama_producto WHERE gama = 'Ornamentales';

SELECT * FROM cliente 
WHERE ciudad = 'Madrid'
having codigo_empleado_rep_ventas in ('11','30');

SELECT c.nombre_cliente, e.nombre, e.apellido1 FROM cliente c inner join empleado e
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado;

SELECT c.nombre_cliente, e.nombre 
FROM cliente c inner join empleado e inner join pago p 
WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado
and p.codigo_cliente = c.codigo_cliente;

SELECT c.nombre_cliente, e.nombre 
FROM cliente c inner join empleado e
WHERE not exists( SELECT p.codigo_cliente 
FROM pago p
WHERE c.codigo_cliente = p.codigo_cliente);


-- -------------------------------------------------------
-- ultimos ejercicios - resumen

SELECT count(*) FROM empleado;

SELECT pais, count(*) from cliente group by pais;

SELECT round(avg(total))  FROM pago
WHERE (SELECT year(fecha_pago) = '2009');

SELECT estado, count(*) FROM pedido 
group by estado ;

SELECT  MAX(precio_venta), MIN(precio_venta) FROM producto;

SELECT count(*) FROM cliente;

SELECT ciudad, count(*) FROM cliente WHERE ciudad = 'Madrid';

SELECT  ciudad, count(*) FROM cliente WHERE ciudad LIKE 'M%'
group by ciudad;

select e.nombre, count(*) FROM empleado e, cliente c 
WHERE e.codigo_empleado = c.codigo_empleado_rep_ventas
group by e.nombre;

SELECT count(*) FROM cliente 
WHERE codigo_empleado_rep_ventas is null;

(SELECT c.nombre_cliente, c.apellido_contacto, p.fecha_pago
FROM cliente c, pago p
WHERE c.codigo_cliente = p.codigo_cliente
order by p.fecha_pago asc)
union 
(SELECT c.nombre_cliente, c.apellido_contacto, p.fecha_pago
FROM cliente c, pago p
WHERE c.codigo_cliente = p.codigo_cliente
order by p.fecha_pago desc);

SELECT d.codigo_producto as producto, count(*) FROM detalle_pedido d, pedido p
where d.codigo_pedido = p.codigo_pedido
group by d.codigo_producto;

SELECT * FROM cliente
WHERE limite_credito = any (SELECT max(limite_credito) FROM cliente);









