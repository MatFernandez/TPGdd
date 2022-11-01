
---------------------------------------------------------------------------------------------------------
------------------------------------- Creacion de stored procedures ------------------------------------
---------------------------------------------------------------------------------------------------------


--Stored procedure que crea las tablas de nuestro modelo

create procedure Crear_Tablas
as
begin 
create table Compra(
	COMPRA_NUMERO decimal(19,0) not null,
	COMPRA_PROVEEDOR nvarchar(50),
	COMPRA_MEDIO_PAGO int,
	COMPRA_DESCUENTO_CODIGO decimal(19,0),
	COMPRA_FECHA date,
	COMPRA_TOTAL decimal(18,2)
);



create table Compra_Producto(
	COMPRA_PRODUCTO_CODIGO nvarchar(50),
	PRODUCTO_VARIANTE_CODIGO nvarchar(50),
	COMPRA_NUMERO decimal(19,0),
	COMPRA_PRODUCTO_CANTIDAD decimal(18,0),
	COMPRA_PRODUCTO_PRECIO decimal(18,2)
);



create table Compra_Descuento(
	DESCUENTO_COMPRA_CODIGO decimal(19,0) not null,
	DESCUENTO_COMPRA_VALOR decimal(18,2)
);


create table Medio_de_Pago_Compra( 
	COMPRA_MEDIO_PAGO_ID int identity (1,1) not null,
	COMPRA_MEDIO_PAGO nvarchar(255)
);



create table Medio_de_Pago_Venta( 
	VENTA_MEDIO_PAGO_ID int identity (1,1) not null,
	VENTA_MEDIO_PAGO nvarchar(255),
	VENTA_MEDIO_PAGO_COSTO decimal(18,2)
);





create table Producto_Tipo_Variante(
	PRODUCTO_VARIANTE_CODIGO nvarchar(50) not null,
	PRODUCTO_TIPO_VARIANTE nvarchar(50)
);


create table Variante(
	PRODUCTO_VARIANTE_CODIGO nvarchar(50) not null, 
	PRODUCTO_VARIANTE nvarchar(50)
);

create table Canal_de_Venta(
	CANAL_ID nvarchar(255) not null,
	CANAL_COSTO decimal(18,2)
);

create table Venta_Descuento(
	VENTA_CODIGO decimal(19,0),
	VENTA_DESCUENTO_MEDIO_DE_PAGO_ID int,
	VENTA_DESCUENTO_CONCEPTO nvarchar(255),
	VENTA_DESCUENTO_IMPORTE decimal (18,2)
);

create table Venta_Por_Cupon(
	VENTA_CODIGO decimal(19,0),
	VENTA_CANTIDAD_CUPONES int,
	VENTA_DESCUENTO_TOTAL_POR_CUPONES decimal(18,2)
);

create table Cupon(
	VENTA_CUPON_CODIGO_ID int identity(1,1) not null,
	VENTA_CUPON_CODIGO nvarchar(255) not null,
	VENTA_CUPON_IMPORTE decimal(18,2),
	VENTA_CUPON_FECHA_DESDE date,
	VENTA_CUPON_FECHA_HASTA date,
	VENTA_CUPON_VALOR decimal(18,2),
	VENTA_CUPON_TIPO nvarchar(50)
);


create table Proveedor(
	PROVEEDOR_CUIT nvarchar(50) not null,
	PROVEEDOR_CP decimal(18,0),
	PROVEEDOR_LOCALIDAD nvarchar(255),
	PROVEEDOR_RAZON_SOCIAL nvarchar(50),
	PROVEEDOR_MAIL nvarchar(50),
	PROVEEDOR_DOMICILIO nvarchar(50)
);

create table Producto_Categoria(
	PRODUCTO_CATEGORIA_ID int identity(1,1) not null ,
	PRODUCTO_CATEGORIA nvarchar(255)
);


create table Producto_Por_Variante(
	PRODUCTO_CODIGO nvarchar(50) not null,
	PRODUCTO_VARIANTE_CODIGO nvarchar(50)  not null,
	PRECIO_UNITARIO_VENTA decimal(18,2) default null ,
	PRECIO_UNITARIO_COMPRA decimal(18,2) default null
);

create table Venta(
	VENTA_CODIGO decimal(19,0) not null,
	VENTA_CLIENTE_CODIGO int,
	VENTA_MEDIO_PAGO int,
	VENTA_MEDIO_PAGO_COSTO decimal(18,2),
	VENTA_CANAL nvarchar(255),
	VENTA_CANAL_COSTO decimal(18,2),
	VENTA_ENVIO_CODIGO int NOT NULL,
	VENTA_COSTO_ENVIO decimal(18,2),
	VENTA_FECHA date,
	VENTA_TOTAL decimal(18,2)
);

create table Venta_Producto(
	VENTA_PRODUCTO_CODIGO nvarchar(50),
	VENTA_CODIGO decimal(19,0),
	PRODUCTO_VARIANTE_CODIGO nvarchar(50),
	VENTA_PRODUCTO_CANTIDAD decimal(18,0),
	VENTA_PRODUCTO_PRECIO decimal(18,2)
);


create table Envio_CP(
	ENVIO_ID int,
	CODIGO_POSTAL decimal(18,0),
	LOCALIDAD nvarchar(255), 
	ENVIO_PRECIO decimal(18,2)
);


create table Envio(
	ENVIO_ID int identity(1,1) not null,
	ENVIO_MEDIO nvarchar(255),
	ENVIO_PRECIO decimal(18,2),
	ENVIO_TIEMPO decimal(18,2)
);


create table Producto(
	PRODUCTO_CODIGO nvarchar(50)not null,
	PRODUCTO_CATEGORIA int,
	PRODUCTO_NOMBRE nvarchar(50),
	PRODUCTO_DESCRIPCION nvarchar(50),
	PRODUCTO_MATERIAL nvarchar(50),
	PRODUCTO_MARCA nvarchar(50)
);

create table Cliente(
	CLIENTE_CODIGO int identity(1,1) not null,
	CLIENTE_DNI decimal(18,0),
	CLIENTE_NOMBRE nvarchar(255),
	CLIENTE_APELLIDO nvarchar(255),
	CLIENTE_TELEFONO decimal(18,0),
	ClIENTE_MAIL nvarchar(255),
	CLIENTE_FECHA_NAC date,
	CLIENTE_DIRECCION nvarchar(255),
	CLIENTE_CP decimal (18,0),
	CLIENTE_LOCALIDAD nvarchar(255),
);


create table Zona(
	CODIGO_POSTAL decimal(18,0) not null,
	LOCALIDAD nvarchar(255) not null,
	PROVINCIA nvarchar(50),
);



--PRIMARY KEYS

alter table Compra
add primary key (COMPRA_NUMERO)

alter table Medio_de_Pago_Compra 
add primary key(COMPRA_MEDIO_PAGO_ID)

alter table Medio_de_Pago_Venta 
add primary key(VENTA_MEDIO_PAGO_ID)

alter table Producto_Tipo_Variante 
add primary key(PRODUCTO_VARIANTE_CODIGO)

alter table Compra_Descuento 
add primary key(DESCUENTO_COMPRA_CODIGO)


alter table Canal_de_Venta
add primary key (CANAL_ID)

alter table Cupon 
add primary key (VENTA_CUPON_CODIGO_ID)

alter table Proveedor  
add primary key (PROVEEDOR_CUIT)

alter table Producto_Categoria  
add primary key (PRODUCTO_CATEGORIA_ID)

alter table Venta 
add constraint PK_VENTA_ENVIO_CODIGO primary key (VENTA_CODIGO)

alter table Producto_Por_Variante 
add constraint PK_Producto_por_variante_Codigo primary key (PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO) 

alter table Envio 
add primary key (ENVIO_ID)

alter table Producto 
add primary key (PRODUCTO_CODIGO)

alter table Cliente
add primary key (CLIENTE_CODIGO)

alter table Zona
add constraint PK_Zona primary key(CODIGO_POSTAL,LOCALIDAD)


--FOREING KEYS

alter table Compra 
add constraint FK_COMPRA_PROVEEDOR foreign key(COMPRA_PROVEEDOR) references Proveedor(PROVEEDOR_CUIT)

alter table Compra
add constraint FK_COMPRA_MEDIO_PAGO foreign key(COMPRA_MEDIO_PAGO) references Medio_de_Pago_Compra(COMPRA_MEDIO_PAGO_ID)

alter table Compra
add constraint FK_COMPRA_DESCUENTO_CODIGO foreign key(COMPRA_DESCUENTO_CODIGO) references Compra_Descuento(DESCUENTO_COMPRA_CODIGO)

alter table Compra_Producto 
add constraint FK_Compra_Producto_Compra foreign key(COMPRA_NUMERO) references compra(COMPRA_NUMERO)

alter table Compra_Producto 
add constraint FK_Compra_Producto_Por_Variante foreign key(COMPRA_PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO) references Producto_Por_Variante(PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO)
 
alter table Variante 
add constraint FK_PRODUCTO_TIPO_X_VARIANTE foreign key(PRODUCTO_VARIANTE_CODIGO) references Producto_Tipo_Variante(PRODUCTO_VARIANTE_CODIGO)

alter table Venta_Descuento
add constraint FK_VENTA_DESCUENTO_VENTA foreign key(VENTA_CODIGO) references Venta(VENTA_CODIGO)

alter table Venta_Descuento
add constraint FK_VENTA_DESCUENTO_MEDIO_DE_PAGO foreign key(VENTA_DESCUENTO_MEDIO_DE_PAGO_ID) references Medio_De_Pago_Venta(VENTA_MEDIO_PAGO_ID)

alter table Venta_Por_Cupon
add constraint FK_Venta_Por_Cupon_X_Cupon foreign key(VENTA_CODIGO) references Venta(VENTA_CODIGO)

alter table Venta_Por_Cupon
add constraint FK_Venta_Por_Cupon foreign key(VENTA_CUPON_CODIGO) references Cupon(VENTA_CUPON_CODIGO_ID)

alter table Proveedor 
add constraint FK_Proveedor_ZONA foreign key(PROVEEDOR_CP,PROVEEDOR_LOCALIDAD) references ZONA(CODIGO_POSTAL,LOCALIDAD)

alter table Producto_Por_Variante 
add constraint FK_Producto_por_variante foreign key(PRODUCTO_CODIGO) references Producto(PRODUCTO_CODIGO)

alter table Producto_Por_Variante 
add constraint FK_Producto_por_variante_tipo_variante foreign key(PRODUCTO_VARIANTE_CODIGO) references Producto_Tipo_Variante(PRODUCTO_VARIANTE_CODIGO)

alter table Venta 
add constraint FK_VENTA_CLIENTE foreign key(VENTA_CLIENTE_CODIGO) references Cliente(CLIENTE_CODIGO)

alter table Venta 
add constraint FK_VENTA_CANAL foreign key(VENTA_CANAL) references Canal_de_Venta(CANAL_ID)

alter table Venta 
add constraint FK_VENTA_MEDIO_DE_PAGO foreign key(VENTA_MEDIO_PAGO) references Medio_De_Pago_Venta(VENTA_MEDIO_PAGO_ID)

alter table Venta 
add constraint FK_VENTA_ENVIO foreign key(VENTA_ENVIO_CODIGO) references Envio(ENVIO_ID)

alter table Venta_Producto
add constraint FK_Venta_Producto_Por_Variante foreign key(VENTA_PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO) references Producto_Por_Variante(PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO)

alter table Venta_Producto 
add constraint FK_Venta_Producto_Venta foreign key(VENTA_CODIGO) references Venta(VENTA_CODIGO)

alter table Envio_CP
add  constraint FK_ENVIO_CP_ENVIO foreign key(ENVIO_ID) references Envio(ENVIO_ID)

alter table Envio_CP
add  constraint FK_ENVIO_ZONA foreign key(CODIGO_POSTAL, LOCALIDAD) references Zona(CODIGO_POSTAL, LOCALIDAD)

alter table Producto 
add constraint FK_Producto_Por_Categoria foreign key(PRODUCTO_CATEGORIA) references Producto_Categoria(PRODUCTO_CATEGORIA_ID)

alter table Cliente 
add constraint FK_CLIENTE_ZONA foreign key(CLIENTE_CP,CLIENTE_LOCALIDAD) references Zona(CODIGO_POSTAL,LOCALIDAD)

end 
go


--Stored procedure que borra las tablas (tirar un refresh en GD2C2022 para ver que se borraron las tablas post ejecucion)

create procedure Borrar_Tablas
as
begin
DROP TABLE Compra_Producto
DROP TABLE Venta_Descuento;
DROP TABLE Venta_Producto;
DROP TABLE Envio_CP;
DROP TABLE Variante;
DROP TABLE Venta_Por_Cupon
DROP TABLE Cupon
DROP TABLE Compra;
DROP TABLE Producto_Por_Variante;
DROP TABLE Venta;
DROP TABLE Cliente;
DROP TABLE Canal_de_Venta;
DROP TABLE Compra_Descuento;
DROP TABLE Envio;
DROP TABLE Producto;
DROP TABLE Producto_Categoria;
DROP TABLE Producto_Tipo_Variante;
DROP TABLE Proveedor;
DROP TABLE Zona
DROP TABLE Medio_De_Pago_Compra
DROP TABLE Medio_De_Pago_Venta
end 
go



--Stored procedure para migrar Zonas
create procedure Migrar_Zonas
as 
begin

insert into Zona (CODIGO_POSTAL , LOCALIDAD , PROVINCIA)

select distinct Maestra.CLIENTE_CODIGO_POSTAL, Maestra.CLIENTE_LOCALIDAD, Maestra.CLIENTE_PROVINCIA from gd_esquema.Maestra
where CLIENTE_CODIGO_POSTAL is not null and CLIENTE_LOCALIDAD is not null 
union
select distinct Maestra.PROVEEDOR_CODIGO_POSTAL, Maestra.PROVEEDOR_LOCALIDAD, Maestra.PROVEEDOR_PROVINCIA from gd_esquema.Maestra
where CLIENTE_PROVINCIA is not null and PROVEEDOR_PROVINCIA is not null
ORDER BY CLIENTE_LOCALIDAD

end
go



--Stored procedure para migrar Proveedores

create procedure Migrar_Proveedores --Con left tira 21 resultados porque hay 3 con CP y localidad en NULL, tiene sentido no migrarlos? 
as 
begin
insert into Proveedor(PROVEEDOR_CUIT,PROVEEDOR_RAZON_SOCIAL,PROVEEDOR_MAIL,PROVEEDOR_CP,PROVEEDOR_LOCALIDAD,PROVEEDOR_DOMICILIO)

select  distinct Maestra.PROVEEDOR_CUIT, Maestra.PROVEEDOR_RAZON_SOCIAL,
 Maestra.PROVEEDOR_MAIL, zona.CODIGO_POSTAL,zona.LOCALIDAD, Maestra.PROVEEDOR_DOMICILIO
 from gd_esquema.Maestra left join Zona on  zona.Codigo_postal = maestra.proveedor_codigo_postal AND zona.Localidad = maestra.PROVEEDOR_localidad
 where PROVEEDOR_CUIT is not null

end
go



--Stored procedure para migrar Clientes

create procedure Migrar_Clientes
as 
begin
insert into Cliente(CLIENTE_DNI,CLIENTE_NOMBRE,CLIENTE_APELLIDO,CLIENTE_TELEFONO,CLIENTE_MAIL,CLIENTE_FECHA_NAC,CLIENTE_DIRECCION,CLIENTE_CP, CLIENTE_LOCALIDAD)

select  distinct Maestra.CLIENTE_DNI,Maestra.CLIENTE_NOMBRE, Maestra.CLIENTE_APELLIDO, Maestra.CLIENTE_TELEFONO,
Maestra.CLIENTE_MAIL, Maestra.CLIENTE_FECHA_NAC,Maestra.CLIENTE_DIRECCION,Zona.CODIGO_POSTAL, Zona.LOCALIDAD
from gd_esquema.Maestra   join Zona on  zona.Codigo_postal = maestra.CLIENTE_codigo_postal AND zona.Localidad = maestra.CLIENTE_localidad
where CLIENTE_DNI is not null
 
end
go



--Stored procedure para migrar Prodcucto_Categoria

create procedure Migrar_Producto_Categoria
as 
begin
insert into Producto_Categoria

select distinct PRODUCTO_CATEGORIA from gd_esquema.Maestra
where PRODUCTO_CATEGORIA is not null

end
go



--Stored procedure para migrar Productos

create procedure Migrar_Productos
as 
begin
insert into Producto

select distinct PRODUCTO_CODIGO, Producto_Categoria.PRODUCTO_CATEGORIA_ID, PRODUCTO_NOMBRE, PRODUCTO_DESCRIPCION, PRODUCTO_MATERIAL, PRODUCTO_MARCA from gd_esquema.Maestra
join Producto_Categoria on Producto_Categoria.PRODUCTO_CATEGORIA = Maestra.PRODUCTO_CATEGORIA

end
go



--Stored procedure para migrar Productos tipo Variante

create procedure Migrar_Producto_Tipo_Variante
as 
begin
insert into Producto_Tipo_Variante

select distinct PRODUCTO_VARIANTE_CODIGO, PRODUCTO_TIPO_VARIANTE from gd_esquema.Maestra
where PRODUCTO_VARIANTE_CODIGO is not null and PRODUCTO_TIPO_VARIANTE is not null

end
go



--Stored procedure para migrar Variantes

create procedure Migrar_Variantes 
as 
begin
insert into Variante

select distinct Producto_Tipo_Variante.PRODUCTO_VARIANTE_CODIGO, maestra.PRODUCTO_VARIANTE from gd_esquema.Maestra
left join Producto_Tipo_Variante on Producto_Tipo_Variante.PRODUCTO_VARIANTE_CODIGO = maestra.PRODUCTO_VARIANTE_CODIGO
where Producto_Tipo_Variante.PRODUCTO_VARIANTE_CODIGO is not null

end
go



--Todas las tablas relacionadas con producto tiran 1310 resultados, y el select de todos los campos de producto (con distinct) tiran 
--los mismos, asi que en teoria esta bien

--select distinct PRODUCTO_CODIGO, PRODUCTO_CATEGORIA, PRODUCTO_DESCRIPCION, PRODUCTO_MARCA, PRODUCTO_MATERIAL, PRODUCTO_NOMBRE, PRODUCTO_TIPO_VARIANTE, 
--PRODUCTO_VARIANTE_CODIGO, PRODUCTO_VARIANTE from gd_esquema.Maestra
--where PRODUCTO_CODIGO is not null



--Stored procedure para migrar Canales de Ventas

create procedure Migrar_Canal_de_Ventas
as 
begin
insert into Canal_de_Venta

select distinct cast (VENTA_CANAL as nvarchar(255)), VENTA_CANAL_COSTO from gd_esquema.Maestra
where VENTA_CANAL is not null and VENTA_CANAL_COSTO is not null

end
go



--Stored procedure para migrar Compra_Descuento

create procedure Migrar_Compra_Descuento
as 
begin
insert into Compra_Descuento

select DESCUENTO_COMPRA_CODIGO, DESCUENTO_COMPRA_VALOR from gd_esquema.Maestra
where DESCUENTO_COMPRA_CODIGO is not null and DESCUENTO_COMPRA_VALOR is not null

end
go



--Stored procedure para migrar Medio de Pago Compra

create procedure Migrar_Medio_De_Pago_Compra
as 
begin
insert into Medio_de_Pago_Compra

select distinct COMPRA_MEDIO_PAGO  from gd_esquema.Maestra
where COMPRA_MEDIO_PAGO is not null

end
go



--Stored procedure para migrar Medio de Pago Venta

create procedure Migrar_Medio_De_Pago_Venta
as 
begin
insert into Medio_de_Pago_Venta

select distinct VENTA_MEDIO_PAGO, VENTA_MEDIO_PAGO_COSTO from gd_esquema.Maestra
where VENTA_MEDIO_PAGO is not null

end
go



--Stored procedure para migrar Compras

create procedure Migrar_Compras
as 
begin
insert into Compra

select distinct COMPRA_NUMERO, Proveedor.PROVEEDOR_CUIT, Medio_de_Pago_Compra.COMPRA_MEDIO_PAGO_ID, Compra_Descuento.DESCUENTO_COMPRA_CODIGO, COMPRA_FECHA, COMPRA_TOTAL from gd_esquema.Maestra
left join Proveedor on Proveedor.PROVEEDOR_CUIT = maestra.PROVEEDOR_CUIT
join Medio_de_Pago_Compra on Medio_De_Pago_Compra.COMPRA_MEDIO_PAGO = maestra.COMPRA_MEDIO_PAGO
left join Compra_Descuento on Compra_Descuento.DESCUENTO_COMPRA_CODIGO = maestra.DESCUENTO_COMPRA_CODIGO
where COMPRA_NUMERO is not null and Compra_Descuento.DESCUENTO_COMPRA_CODIGO is not null

end
go



--Stored procedure para migrar Producto por Variante

create procedure Migrar_Producto_Por_Variante
as 
begin
insert into Producto_Por_Variante

select distinct Producto.PRODUCTO_CODIGO, Producto_Tipo_Variante.PRODUCTO_VARIANTE_CODIGO, null, null from gd_esquema.Maestra
join Producto on Producto.PRODUCTO_CODIGO = Maestra.PRODUCTO_CODIGO
join Producto_Tipo_Variante on Producto_Tipo_Variante.PRODUCTO_VARIANTE_CODIGO = Maestra.PRODUCTO_VARIANTE_CODIGO

end
go



--Stored procedure para Venta_Producto

create procedure Migrar_Compra_Producto 
as 
begin
insert into Compra_Producto

select distinct Producto_Por_Variante.PRODUCTO_CODIGO, Producto_Por_Variante.PRODUCTO_VARIANTE_CODIGO, Compra.COMPRA_NUMERO,
COMPRA_PRODUCTO_CANTIDAD, COMPRA_PRODUCTO_PRECIO from gd_esquema.Maestra 
join Producto_Por_Variante on Producto_Por_Variante.PRODUCTO_CODIGO = Maestra.PRODUCTO_CODIGO and Producto_Por_Variante.PRODUCTO_VARIANTE_CODIGO = Maestra.PRODUCTO_VARIANTE_CODIGO 
join Compra on Compra.COMPRA_NUMERO = Maestra.COMPRA_NUMERO
where Producto_Por_Variante.PRODUCTO_CODIGO is not null and Compra.COMPRA_NUMERO is not null
order by COMPRA_NUMERO ASC

end
go


--Stored procedure para migrar cupones

create procedure Migrar_Cupones
as 
begin
insert into Cupon

select distinct VENTA_CUPON_CODIGO, VENTA_CUPON_IMPORTE, VENTA_CUPON_FECHA_DESDE, VENTA_CUPON_FECHA_HASTA, VENTA_CUPON_VALOR,
VENTA_CUPON_TIPO from gd_esquema.Maestra
where VENTA_CUPON_CODIGO is not null 

end
go


-- store procedure para migrar Envio
create procedure Migrar_Envios
as
begin 
insert into Envio 
select distinct VENTA_MEDIO_ENVIO, VENTA_ENVIO_PRECIO,NULL from gd_esquema.Maestra
where VENTA_MEDIO_ENVIO is not null
end
go

-- store procedure para migrar Envio_CP
create procedure Migrar_Envio_CP
as
begin

insert into Envio_CP
select distinct ENVIO_ID, CODIGO_POSTAL, LOCALIDAD, ENVIO_PRECIO from gd_esquema.Maestra join Envio on VENTA_MEDIO_ENVIO=ENVIO_MEDIO and VENTA_ENVIO_PRECIO=ENVIO_PRECIO
join Zona on Cliente_Localidad = Localidad and Cliente_Codigo_Postal = Codigo_Postal

end
go




--Stored procedure para migrar Ventas

create procedure Migrar_Ventas
as 
begin
insert into Venta

select distinct VENTA_CODIGO, cliente.CLIENTE_CODIGO, Medio_de_Pago_Venta.VENTA_MEDIO_PAGO_ID, Medio_de_Pago_Venta.VENTA_MEDIO_PAGO_COSTO,
Canal_de_Venta.CANAL_ID, Canal_de_Venta.CANAL_COSTO,Envio.ENVIO_ID, Envio.ENVIO_PRECIO, VENTA_FECHA, VENTA_TOTAL from gd_esquema.Maestra
join Cliente on cliente.CLIENTE_DNI = maestra.CLIENTE_DNI and cliente.CLIENTE_APELLIDO = Maestra.CLIENTE_APELLIDO
join Medio_de_Pago_Venta on Medio_de_Pago_Venta.VENTA_MEDIO_PAGO = maestra.VENTA_MEDIO_PAGO
join Canal_de_Venta on Canal_de_Venta.CANAL_ID= Maestra.VENTA_CANAL
join Envio on Envio.ENVIO_MEDIO = Maestra.VENTA_MEDIO_ENVIO and Envio.ENVIO_PRECIO = Maestra.VENTA_ENVIO_PRECIO

end
go


--Stored procedure para migrar Venta Producto
create procedure Migrar_Venta_Producto
as 
begin
insert into Venta_Producto
select distinct  Producto_Por_Variante.PRODUCTO_CODIGO,Venta.VENTA_CODIGO, Producto_Por_Variante.PRODUCTO_VARIANTE_CODIGO, 
VENTA_PRODUCTO_CANTIDAD, VENTA_PRODUCTO_PRECIO from gd_esquema.Maestra 

join Producto_Por_Variante on Producto_Por_Variante.PRODUCTO_CODIGO = Maestra.PRODUCTO_CODIGO and Producto_Por_Variante.PRODUCTO_VARIANTE_CODIGO = Maestra.PRODUCTO_VARIANTE_CODIGO 
join Venta on Venta.VENTA_CODIGO = Maestra.VENTA_CODIGO
where Producto_Por_Variante.PRODUCTO_CODIGO is not null and Venta.VENTA_CODIGO is not null
order by VENTA_CODIGO ASC

end
go




--Stored procedure para migrar Venta Descuento

create procedure Migrar_Venta_Descuento
as 
begin
insert into Venta_Descuento
select distinct Venta.VENTA_CODIGO, Medio_de_Pago_Venta.VENTA_MEDIO_PAGO_ID, VENTA_DESCUENTO_CONCEPTO, VENTA_DESCUENTO_IMPORTE  from gd_esquema.Maestra
join Venta on Venta.VENTA_CODIGO = Maestra.VENTA_CODIGO
join Medio_de_Pago_Venta on Medio_de_Pago_Venta.VENTA_MEDIO_PAGO = maestra.VENTA_MEDIO_PAGO
where VENTA_DESCUENTO_CONCEPTO is not null

end
go


--Stored procedure para migrar Venta_Por_Cupon

create procedure Migrar_Venta_Por_Cupon
as 
begin
insert into Venta_Por_Cupon

select distinct  Venta.VENTA_CODIGO, count(Cupon.VENTA_CUPON_CODIGO_ID), sum(Cupon.VENTA_CUPON_VALOR) from gd_esquema.Maestra
join Venta on Venta.VENTA_CODIGO = Maestra.VENTA_CODIGO 
join Cupon on Cupon.VENTA_CUPON_CODIGO = maestra.VENTA_CUPON_CODIGO and Cupon.VENTA_CUPON_VALOR = maestra.VENTA_CUPON_VALOR 
group by Venta.VENTA_CODIGO


end
go



-------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------FALTA TERMINAR-------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------

--Este es el select para saber las compras (diferentes segun su COMPRA_NUMERO porque son unicas) de la tabla maestra.
--Coincide con el nuestro
select distinct COMPRA_NUMERO, PROVEEDOR_CUIT, COMPRA_MEDIO_PAGO, DESCUENTO_COMPRA_CODIGO, COMPRA_FECHA, COMPRA_TOTAL from gd_esquema.Maestra where COMPRA_NUMERO is not null
and DESCUENTO_COMPRA_CODIGO is not null










--Para borrar los stored procedures anteriores

drop procedure Migrar_Medio_de_Pago
drop procedure Migrar_Compra_Descuento
drop procedure Migrar_Producto_Tipo_Variante
drop procedure Migrar_Canal_de_Ventas
drop procedure Migrar_Proveedores
drop procedure Borrar_Tablas
drop procedure Crear_Tablas
drop procedure Migrar_Clientes
drop procedure Migrar_Producto_Categoria
drop procedure Migrar_Productos
drop procedure Migrar_Variantes
drop procedure Migrar_Zonas


---------------------------------------------------------------------------------------------------------
------------------------------------- Ejecucion de stored procedures ------------------------------------
---------------------------------------------------------------------------------------------------------


--Crea las tablas (devuelve 0 si esta todo ok)
declare @crearTablas int
exec @crearTablas  = [Crear_Tablas]
select "Resultado tablas creadas" = @crearTablas
go

--Borra las tablas (devuelve 0 si esta todo ok)
declare @borrarTablas int
exec @borrarTablas  = [Borrar_Tablas]
select "Resultado tablas borradas" = @borrarTablas
go


--Migra los proveedores (devuelve 0 si esta todo ok) 
declare @migracionProveedores int
exec @migracionProveedores = [Migrar_Proveedores]
select "Resultado proveedores" = @migracionProveedores
go

--Migra los Clientes (devuelve 0 si esta todo ok) 
declare @migracionClientes int
exec @migracionClientes = [Migrar_Clientes]
select "Resultado proveedores" = @migracionClientes
go


--Migra los canales de venta (devuelve 0 si esta todo ok)
declare @migracionCanalesVenta int
exec @migracionCanalesVenta = [Migrar_Canal_de_Ventas]
select "Resultado Canales de Venta" = @migracionCanalesVenta
go


--Migra las Zona  (devuelve 0 si esta todo ok)
declare @migracionZona int
exec @migracionZona = [Migrar_Zonas]
select "Resultado Zona Localidad" = @migracionZona
go



--Migra los Productos tipo Variante (devuelve 0 si esta todo ok)
declare @migracionProductosTipoVariantes int
exec @migracionProductosTipoVariantes = [Migrar_Producto_Tipo_Variante]
select "Resultado Cupones" = @migracionProductosTipoVariantes
go


--Migra los Compra Descuento (devuelve 0 si esta todo ok)
declare @migracionCompraDescuento int
exec @migracionCompraDescuento = [Migrar_Compra_Descuento]
select "Resultado Cupones" = @migracionCompraDescuento
go


--Migra los Cupones (devuelve 0 si esta todo ok) --FALTA TERMINAR LA MIGRACION, NO EJECUTAR
declare @migracionCupones int
exec @migracionCupones = [Migrar_Cupones]
select "Resultado Cupones" = @migracionCupones
go



