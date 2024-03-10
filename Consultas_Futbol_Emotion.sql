-- tabla Tienda
select ciudad from Tienda where hora_apertura = '09'; 

select ciudad from Tienda where hora_cierre = '22';

select * from Tienda order by id_tienda desc;

-- tabla Trabajador
select nombre,gana from Trabajador order by gana desc;

select nombre,cargo from Trabajador;

select dni from Trabajador where edad >=30; 

-- tabla Producto
select nombre, precio from Producto order by precio asc;

select id_producto,marca from Producto where marca = 'Adidas';

select round(avg(precio),2) as precio_medio from Producto;

-- tabla Cliente
select round(avg(edad)) as edad_media from Cliente;

select nombre,apellidos from Cliente where edad < 30;

select id from Cliente where apellidos like '%z';

-- consultas nivel global 
select tra.nombre, tra.cargo , traba.inicio_contrato, traba.fin_contrato, tie.ciudad from Trabajador tra
	join trabaja traba on tra.DNI = traba.DNI
    join Tienda tie on traba.id_tienda = tie.id_tienda;

select tie.ciudad, round(count(pro.id_producto)) as venta_media from Tiene tien
	join Producto pro on pro.id_producto = tien.id_producto
    join Tienda tie on tien.id_tienda = tie.id_tienda
    group by tie.ciudad;
    
select tra.nombre, tie.ciudad, pro.nombre from Trabajador tra
	join trabaja traba on tra.DNI = traba.DNI
	join Tienda tie on traba.id_tienda = tie.id_tienda
	join tiene tien on tie.id_tienda = tien.id_tienda
	join Producto pro on tien.id_producto = pro.id_producto
    where tra.nombre like '%a' or tie.ciudad like 'b%';

select tie.ciudad, pro.nombre from Tienda tie 
	join tiene tien on tie.id_tienda = tien.id_tienda
    join Producto pro on pro.id_producto = tien.id_producto
    order by pro.precio asc;
    
select cli.nombre,pro.nombre,com.fecha_compra from Cliente cli
	join compra com on com.id_cliente = cli.id
    join Producto pro on pro.id_producto = com.id_producto
    where cli.nombre = 'Ana';
    