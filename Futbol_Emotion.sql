DROP DATABASE IF EXISTS futbol_emotion;
CREATE DATABASE futbol_emotion;
USE futbol_emotion;
SHOW DATABASES;

create table Tienda ( 
id_tienda int primary key auto_increment,
ciudad varchar(50),
hora_apertura varchar(2),
hora_cierre varchar(2)
);
describe Tienda;

create table Trabajador (
DNI varchar(9) primary key,
nombre varchar(50),
edad int,
cargo varchar(50),
gana decimal(6,2)
);
describe Trabajador;

create table trabaja (
inicio_contrato date,
fin_contrato date,
DNI varchar(9),
id_tienda int,
constraint fk_DNI_trabaja foreign key (DNI) references Trabajador(DNI),
constraint fk_id_trabaja foreign key (id_tienda) references Tienda(id_tienda),
constraint pk_trabaja primary key (inicio_contrato,fin_contrato,DNI,id_tienda),
constraint chk_contrato check (inicio_contrato < fin_contrato)
);
describe trabaja;

create table Producto(
id_producto int primary key auto_increment,
nombre varchar(150),
precio decimal(5,2),
marca varchar(50)
);
describe producto;

create table tiene(
id_tienda int,
id_producto int,
constraint fk_id1_tiene foreign key (id_tienda) references Tienda(id_tienda),
constraint fk_id2_tiene foreign key (id_producto) references Producto(id_producto),
constraint pk_tiene primary key (id_tienda,id_producto)
);
describe tiene;

create table Cliente(
id varchar(20) primary key,
nombre varchar(50),
apellidos varchar(100),
edad int,
localizacion varchar(50)
);
describe Cliente;

create table compra(
fecha_compra date,
id_cliente varchar(20),
id_producto int,
constraint fk_id1_compra foreign key (id_cliente) references Cliente(id),
constraint fk_id2_compra foreign key (id_producto) references Producto(id_producto),
constraint pk_tiene primary key (fecha_compra,id_cliente,id_producto)
);
describe compra;

insert into Tienda (ciudad, hora_apertura, hora_cierre) values
('Valencia', '08', '20'),
('Madrid', '09', '21'),
('Barcelona', '10', '22'),
('Sevilla', '08', '20'),
('Bilbao', '09', '21'),
('Zaragoza', '10', '22'),
('Málaga', '08', '20'),
('Murcia', '09', '21'),
('Palma', '10', '22'),
('Las Palmas', '08', '20');
select * from Tienda;

insert into Trabajador (DNI, nombre, edad, cargo, gana) values 
('12345678A', 'Juan', 30, 'Gerente', 3000.00),
('23456789B', 'Ana', 25, 'Asistente', 2000.00),
('34567890C', 'Carlos', 35, 'Programador', 3500.00),
('45678901D', 'Maria', 28, 'Diseñadora', 2500.00),
('56789012E', 'Pedro', 40, 'Director', 4000.00),
('67890123F', 'Isabel', 32, 'Analista', 2800.00),
('78901234G', 'Luis', 38, 'Programador', 3200.00),
('89012345H', 'Sofia', 27, 'Marketing', 2700.00),
('90123456I', 'Antonio', 45, 'CEO', 5000.00),
('01234567J', 'Laura', 29, 'Recursos Humanos', 2600.00);
select * from Trabajador;

INSERT INTO trabaja (inicio_contrato, fin_contrato, DNI, id_tienda) VALUES
('2024-01-01', '2025-01-01', '12345678A', 1),
('2024-02-01', '2024-05-01', '23456789B', 2),
('2024-03-01', '2025-03-01', '34567890C', 3),
('2024-04-01', '2025-04-01', '45678901D', 4),
('2024-05-01', '2025-05-01', '56789012E', 5),
('2024-06-01', '2025-06-01', '67890123F', 6),
('2024-07-01', '2025-07-01', '78901234G', 7),
('2024-08-01', '2025-08-01', '89012345H', 8),
('2024-09-01', '2025-09-01', '90123456I', 9),
('2024-10-01', '2025-10-01', '01234567J', 10),
('2024-05-02', '2025-05-02', '23456789B', 5);
select * from trabaja;

insert into Producto (nombre, precio, marca) values 
('BOTA ADIDAS PREDATOR ELITE FT FG', 279.99 , 'Adidas'),
('BOTA NIKE AIR ZOOM MERCURIAL SUPERFLY 9 MDS ELITE FG', 289.99, 'Nike'),
('GUANTES PUMA FUTURE PRO HYBRID', 89.99, 'Puma'),
('ZAPATILLA ADIDAS X CRAZYFAST LEAGUE IN', 81.99, 'Adidas'),
('BALÓN ADIDAS UEFA CHAMPIONS LEAGUE 2023-2024', 55.99, 'Adidas'),
('ZAPATILLA NEW BALANCE 530', 124.99, 'New Balance'),
('CAMISETA HUMMEL REAL BETIS PRIMERA EQUIPACIÓN 2023-2024', 79.99, 'Hummel');
select * from Producto;

insert into tiene (id_tienda, id_producto) values
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 1),
(9, 3),
(10, 2),
(1, 4),
(2, 5),
(3, 6),
(4, 7),
(5, 6),
(6, 5),
(7, 4),
(8, 3),
(9, 2),
(10, 1);
select * from tiene;

insert into Cliente (id, nombre, apellidos, edad, localizacion) values
('ID001', 'Juan', 'Gomez Lopez', 30, 'Valencia'),
('ID002', 'Ana', 'Martinez Garcia', 25, 'Madrid'),
('ID003', 'Carlos', 'Rodriguez Fernandez', 35, 'Barcelona'),
('ID004', 'Maria', 'Gonzalez Sanchez', 28, 'Sevilla'),
('ID005', 'Pedro', 'Ruiz Perez', 40, 'Bilbao'),
('ID006', 'Isabel', 'Moreno Torres', 32, 'Zaragoza'),
('ID007', 'Luis', 'Munoz Jimenez', 38, 'Málaga'),
('ID008', 'Sofia', 'Alonso Guzman', 27, 'Murcia'),
('ID009', 'Antonio', 'Romero Herrera', 45, 'Palma'),
('ID010', 'Laura', 'Navarro Marquez', 29, 'Las Palmas');
select * from Cliente;

insert into compra (fecha_compra, id_cliente, id_producto) values
('2024-01-01', 'ID001', 1),
('2024-02-01', 'ID002', 2),
('2024-03-01', 'ID003', 3),
('2024-05-01', 'ID005', 4),
('2024-06-01', 'ID006', 5),
('2024-08-01', 'ID008', 6),
('2024-09-01', 'ID009', 7),
('2024-10-01', 'ID010', 7),
('2024-01-01', 'ID001', 6),
('2024-02-01', 'ID002', 5),
('2024-03-01', 'ID003', 4),
('2024-05-01', 'ID005', 3),
('2024-06-01', 'ID006', 2),
('2024-08-01', 'ID008', 1);
select * from compra;