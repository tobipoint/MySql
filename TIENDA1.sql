SELECT * FROM producto;
SELECT * FROM fabricante;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, round(precio) FROM producto;

SELECT F.codigo , P.nombre 
FROM fabricante F, producto P 
WHERE F.codigo = P.codigo_fabricante;

SELECT DISTINCT F.codigo, P.nombre
FROM fabricante F, producto P 
WHERE F.codigo = P.codigo_fabricante
order by F.codigo;

SELECT nombre FROM fabricante order by nombre asc;

SELECT nombre, precio FROM producto
order by nombre, precio;

SELECT *  FROM fabricante LIMIT 5;

SELECT nombre, precio FROM producto
order by precio LIMIT 1;

SELECT nombre, precio FROM producto
order by precio desc LIMIT 1;

SELECT nombre, precio FROM producto
WHERE precio <= 120;

SELECT *  FROM producto
WHERE precio between 60 and 200 ;

SELECT *  FROM producto
WHERE codigo_fabricante IN (1,3, 5) ;

SELECT * FROM producto WHERE nombre LIKE '%Portatil%';

SELECT p.codigo, p.nombre , f.codigo, f.nombre
FROM fabricante f, producto p
WHERE  f.codigo = p.codigo_fabricante;

SELECT f.nombre, p.nombre, p.precio FROM producto p, fabricante f
WHERE  f.codigo = p.codigo_fabricante
order by f.nombre;

SELECT f.nombre, p.nombre, p.precio FROM producto p, fabricante f 
WHERE f.codigo = p.codigo_fabricante
AND p.precio 
order by p.precio
LIMIT 1;

SELECT f.nombre, p.nombre FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante 
and f.nombre = 'Lenovo';

SELECT f.nombre, p.nombre, p.precio FROM producto p, fabricante f
WHERE  f.codigo = p.codigo_fabricante
AND f.nombre = 'Crucial' and p.precio > 200;

SELECT f.nombre, p.nombre, p.precio FROM producto p, fabricante f
WHERE  f.codigo = p.codigo_fabricante
AND f.nombre IN ('Asus','Hewlett-Packard') order by f.nombre;

SELECT  p.precio, p.nombre, f.nombre FROM producto p, fabricante f
WHERE  f.codigo = p.codigo_fabricante
AND p.precio >= '180' order by p.precio desc, p.nombre asc;

/*
trae todos los fabricantes tengan o no productos
*/
SELECT *
FROM producto p
right outer join fabricante f
on f.codigo = p.codigo_fabricante;

-- fabricantes que no tienen productos relacionados

Select * From fabricante f
where not exists(Select p.codigo
From producto p
Where f.codigo = p.codigo_fabricante);

SELECT f.nombre, p.nombre, p.precio FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante 
and f.nombre = 'Lenovo';  


  /*
  Devuelve todos los datos de los productos que tienen el mismo precio que el producto
más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
*/ 
-- INTENTO
SELECT p.nombre, max(precio) FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante 
and f.nombre = 'Lenovo'; 
-- CORRECTO
SELECT  *  FROM producto 
WHERE precio = ( SELECT max(precio) FROM producto p, fabricante f 
WHERE f.codigo = p.codigo_fabricante 
and f.nombre = 'Lenovo');

SELECT *, max(precio) FROM producto p, fabricante f
WHERE f.codigo = p.codigo_fabricante AND f.nombre = 'Lenovo';

/*
4. Lista todos los productos del fabricante Asus que tienen un precio superior al precio
medio de todos sus productos.
*/

SELECT * FROM producto p, fabricante f 
WHERE f.codigo = p.codigo_fabricante 
and f.nombre = 'Asus' 
 and precio >= (SELECT avg(precio)
 FROM producto p, fabricante f  
 WHERE f.codigo = p.codigo_fabricante 
 and f.nombre = 'Asus');

SELECT f.nombre FROM producto p, fabricante f
WHERE p.codigo_fabricante in (f.codigo);

SELECT f.nombre FROM fabricante f, producto p   
WHERE f.codigo NOT IN (p.codigo_fabricante);
 
 /*
 Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número
de productos que el fabricante Lenovo.
 */
SELECT f.nombre, COUNT(p.codigo)
FROM fabricante f, producto p 
WHERE f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING COUNT(p.codigo) >= (
    SELECT COUNT(p.codigo)
    FROM fabricante f INNER JOIN producto p
    ON f.codigo = p.codigo_fabricante
    WHERE f.nombre = 'Lenovo');


 