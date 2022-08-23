SELECT * FROM empleado;
SELECT * FROM departamento;

SELECT nombre, cargo FROM empleado WHERE cargo = 'Secretaria';

SELECT * FROM empleado WHERE cargo = 'Vendedor'order by nombre;

SELECT nombre, cargo, salario FROM empleado order by salario desc;

SELECT nombre, salario, comision FROM empleado WHERE id_depto = 2000
order by comision desc;

SELECT nombre, salario, comision FROM empleado WHERE id_depto = 3000;

SELECT nombre, salario + (comision+500) FROM empleado WHERE id_depto = '3000';
 
SELECT nombre, SUM(salario) FROM empleado WHERE id_depto = 3000
 GROUP BY nombre;

SELECT nombre FROM empleado WHERE nombre LIKE 'j%';

SELECT nombre, SUM(salario + comision) FROM empleado WHERE comision > 1000 ; 
 
SELECT nombre, salario FROM empleado WHERE comision =  0 ; 
 
SELECT nombre, salario, comision FROM empleado WHERE comision > salario; 

SELECT nombre, salario, comision FROM empleado WHERE comision <= ((salario * 30) / 100 ) ;

SELECT nombre FROM empleado WHERE nombre NOT LIKE '%ma&';

SELECT nombre_depto, id_depto FROM departamento WHERE nombre_depto IN ('VENTAS' , 'INVESTIGACION', 'MANTENIMIENTO');

SELECT nombre_depto, id_depto FROM departamento WHERE nombre_depto != 'VENTAS' and nombre_depto !='INVESTIGACION' and nombre_depto != 'MANTENIMIENTO';

SELECT nombre, MAX(salario) FROM empleado;

SELECT MAX(nombre) FROM empleado order by nombre asc;

SELECT max(salario), min(salario),  abs( max(salario) - min(salario) ) from empleado;

SELECT AVG(salario), cargo FROM empleado group by cargo;

SELECT cargo, COUNT(*) FROM empleado group by cargo
having count(*) > 2; 

SELECT cargo, COUNT(*) FROM empleado group by cargo
having count(*) = 0;

SELECT nombre, salario FROM empleado WHERE salario > (SELECT AVG(salario) FROM
empleado);

