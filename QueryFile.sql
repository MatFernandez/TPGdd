
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
	COMPRA_MEDIO_PAGO nvarchar(255),
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


create table Medio_de_Pago( 
	MEDIO_PAGO_ID nvarchar(255) not null,
	MEDIO_PAGO_COSTO decimal (18,2)
);



create table Producto_Tipo_Variante(
	PRODUCTO_VARIANTE_CODIGO nvarchar(50) not null,
	PRODUCTO_TIPO_VARIANTE nvarchar(50)
);


create table Variante(
	PRODUCTO_VARIANTE_CODIGO nvarchar(50)not null, /* explicar porque se puso como FK Y NO PK como estaba antes*/
	PRODUCTO_VARIANTE nvarchar(50)
);

create table Canal_de_Venta(
	CANAL_ID nvarchar(255) not null,
	CANAL_COSTO decimal(18,2)
);

create table Venta_Descuento(
	VENTA_CODIGO decimal(19,0),
	VENTA_MEDIO_DE_PAGO_id nvarchar(255),
	VENTA_DESCUENTO_CONCEPTO nvarchar(255),
	VENTA_DESCUENTO_IMPORTE decimal (18,2)
);

create table Venta_Por_Cupon(
	VENTA_CODIGO decimal(19,0),
	VENTA_CUPON_CODIGO nvarchar(255),
	Venta_CUPON_Total decimal(18,2)
);

create table Cupon(
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
	PRECIO_UNITARIO_VENTA decimal(18,2),
	PRECIO_UNITARIO_COMPRA decimal(18,2)
);

create table Venta(
	VENTA_CODIGO decimal(19,0) not null,
	VENTA_CLIENTE_CODIGO int,
	VENTA_MEDIO_PAGO nvarchar(255),
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
	CLIENTE_CP decimal (18,0),
	CLIENTE_DNI decimal(18,0),
	CLIENTE_NOMBRE nvarchar(255),
	CLIENTE_APELLIDO nvarchar(255),
	CLIENTE_TELEFONO decimal(18,0),
	ClIENTE_MAIL nvarchar(255),
	CLIENTE_FECHA_NAC date,
	CLIENTE_DOMICILIO nvarchar(50)
);


create table Zona_Localidad(
	LOCALIDAD_ID int identity(1,1) not null,
	PROVINCIA nvarchar(50),
	LOCALIDAD nvarchar(50)
);


create table Codigo_Postal(
	CODIGO_POSTAL decimal(18,0) not null,
	CODIGO_POSTAL_LOCALIDAD_ID nvarchar(50)
);


--PRIMARY KEYS

alter table Compra
add primary key (COMPRA_NUMERO)

alter table Medio_de_Pago 
add primary key(MEDIO_PAGO_ID)

alter table Producto_Tipo_Variante 
add primary key(PRODUCTO_VARIANTE_CODIGO)

alter table Compra_Descuento 
add primary key(DESCUENTO_COMPRA_CODIGO)

alter table Canal_de_Venta
add primary key (CANAL_ID)

alter table Cupon 
add primary key (VENTA_CUPON_CODIGO)

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

alter table CODIGO_POSTAL 
add primary key (CODIGO_POSTAL)

alter table Zona_Localidad 
add primary key(LOCALIDAD_ID)


--FOREING KEYS

alter table Compra 
add constraint FK_COMPRA_PROVEEDOR foreign key(COMPRA_PROVEEDOR) references Proveedor(PROVEEDOR_CUIT)

alter table Compra
add constraint FK_COMPRA_MEDIO_PAGO foreign key(COMPRA_MEDIO_PAGO) references Medio_de_Pago(MEDIO_PAGO_ID)

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
add constraint FK_VENTA_DESCUENTO_MEDIO_DE_PAGO foreign key(VENTA_MEDIO_DE_PAGO_id) references Medio_De_Pago(MEDIO_PAGO_ID)

alter table Venta_Por_Cupon
add constraint FK_Venta_Por_Cupon_X_Cupon foreign key(VENTA_CODIGO) references Venta(VENTA_CODIGO)

alter table Venta_Por_Cupon
add constraint FK_Venta_Por_Cupon foreign key(VENTA_CUPON_CODIGO) references Cupon(VENTA_CUPON_CODIGO)

alter table Proveedor 
add constraint FK_Proveedor_CP foreign key(PROVEEDOR_CP) references CODIGO_POSTAL(CODIGO_POSTAL)

alter table Producto_Por_Variante 
add constraint FK_Producto_por_variante foreign key(PRODUCTO_CODIGO) references Producto(PRODUCTO_CODIGO)

alter table Producto_Por_Variante 
add constraint FK_Producto_por_variante_tipo_variante foreign key(PRODUCTO_VARIANTE_CODIGO) references Producto_Tipo_Variante(PRODUCTO_VARIANTE_CODIGO)

alter table Venta 
add constraint FK_VENTA_CLIENTE foreign key(VENTA_CLIENTE_CODIGO) references Cliente(CLIENTE_CODIGO)

alter table Venta 
add constraint FK_VENTA_CANAL foreign key(VENTA_CANAL) references Canal_de_Venta(CANAL_ID)

alter table Venta 
add constraint FK_VENTA_MEDIO_DE_PAGO foreign key(VENTA_MEDIO_PAGO) references Medio_De_Pago(MEDIO_PAGO_ID)

alter table Venta 
add constraint FK_VENTA_ENVIO foreign key(VENTA_ENVIO_CODIGO) references Envio(ENVIO_ID)

alter table Venta_Producto
add constraint FK_Venta_Producto_Por_Variante foreign key(VENTA_PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO) references Producto_Por_Variante(PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO)

alter table Venta_Producto 
add constraint FK_Venta_Producto_Venta foreign key(VENTA_CODIGO) references Venta(VENTA_CODIGO)

alter table Envio_CP
add  constraint FK_ENVIO_CP_ENVIO foreign key(ENVIO_ID) references Envio(ENVIO_ID)

alter table Envio_CP
add  constraint FK_ENVIO_CP foreign key(CODIGO_POSTAL) references CODIGO_POSTAL(CODIGO_POSTAL)

alter table Producto 
add constraint FK_Producto_Por_Categoria foreign key(PRODUCTO_CATEGORIA) references Producto_Categoria(PRODUCTO_CATEGORIA_ID)

alter table cliente 
add constraint FK_CLIENTE_CP foreign key(CLIENTE_CP) references CODIGO_POSTAL(CODIGO_POSTAL)

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
DROP TABLE Zona_Localidad
DROP TABLE Venta_Por_Cupon
DROP TABLE Cupon
DROP TABLE Compra;
DROP TABLE Producto_Por_Variante;
DROP TABLE Venta;
DROP TABLE Cliente;
DROP TABLE Canal_de_Venta;
DROP TABLE Compra_Descuento;
DROP TABLE Envio;
DROP TABLE Medio_de_Pago;
DROP TABLE Producto;
DROP TABLE Producto_Categoria;
DROP TABLE Producto_Tipo_Variante;
DROP TABLE Proveedor;
DROP TABLE Codigo_Postal
end 
go


--Stored procedure para migrar proveedores de la tabla maestra a nuestro modelo (DESACTUALIZADO)

create procedure Migrar_Proveedores 
as 
begin
insert into Proveedor

select distinct Maestra.PROVEEDOR_CUIT, Maestra.PROVEEDOR_RAZON_SOCIAL, Maestra.PROVEEDOR_MAIL, Maestra.PROVEEDOR_DOMICILIO,
Maestra.PROVEEDOR_CODIGO_POSTAL, Maestra.PROVEEDOR_LOCALIDAD, Maestra.PROVEEDOR_PROVINCIA from gd_esquema.Maestra
where PROVEEDOR_CUIT is not null

end
go


--Stored procedure para migrar Zona-Localidad de Proveedores y Clientes

create procedure Migrar_Zona_Localidad 
as 
begin
insert into Zona_Localidad

select distinct CLIENTE_PROVINCIA, CLIENTE_LOCALIDAD from gd_esquema.Maestra
union 
select distinct PROVEEDOR_PROVINCIA, PROVEEDOR_LOCALIDAD from gd_esquema.Maestra
where CLIENTE_PROVINCIA is not null and CLIENTE_LOCALIDAD is not null
and PROVEEDOR_PROVINCIA is not null and PROVEEDOR_LOCALIDAD is not null

end 
go



--Stored procedure para migrar cupones (REVISAR SI ES PK COMPUESTA CON IMPORTE)

create procedure Migrar_Cupones
as 
begin
insert into Cupon

select distinct VENTA_CUPON_CODIGO, VENTA_CUPON_IMPORTE, VENTA_CUPON_FECHA_DESDE, VENTA_CUPON_FECHA_HASTA, VENTA_CUPON_VALOR,
VENTA_CUPON_TIPO from gd_esquema.Maestra
where VENTA_CUPON_CODIGO is not null 

end
go


--Stored procedure para migrar Canales de Ventas

create procedure Migrar_Canal_de_Ventas
as 
begin
insert into Canal_de_Venta

select distinct cast (VENTA_CANAL as nvarchar(255)), VENTA_CANAL_COSTO from gd_esquema.Maestra
where VENTA_CANAL is not null and VENTA_CANAL_COSTO is not null

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


--Stored procedure para migrar Compra_Descuento

create procedure Migrar_Compra_Descuento
as 
begin
insert into Compra_Descuento

select DESCUENTO_COMPRA_CODIGO, DESCUENTO_COMPRA_VALOR from gd_esquema.Maestra
where DESCUENTO_COMPRA_CODIGO is not null and DESCUENTO_COMPRA_VALOR is not null

end
go


--Stored procedure para migrar Medio_de_Pago

create procedure Migrar_Medio_de_Pago
as
begin
insert into Medio_de_Pago

select distinct COMPRA_MEDIO_PAGO, VENTA_MEDIO_PAGO_COSTO from gd_esquema.Maestra
where COMPRA_MEDIO_PAGO is not null
union
select distinct VENTA_MEDIO_PAGO, VENTA_MEDIO_PAGO_COSTO from gd_esquema.Maestra
where VENTA_MEDIO_PAGO is not null

end
go



--Stored procedure para migrar los Medio de Pago

--Aca ojo porque el medio de pago para la Compra no tiene costo y para la Venta si, por eso uno los medios con null y los otros con su costo
--Si bien la consulta esta bien, no se puede insertar porque estamos duplicando los medios de pago (o sea las pks quedan duplicadas)
--Los medios son iguales para la Compra y la Venta (me fije en la maestra), capaz se puede omitir el union y quede el medio de pago con el costo,
--y que Compra SOLO traiga el medio sin el costo porque no le interesa

create procedure Migrar_Medio_de_Pago
as
begin
insert into Medio_de_Pago

select distinct COMPRA_MEDIO_PAGO, VENTA_MEDIO_PAGO_COSTO from gd_esquema.Maestra
where COMPRA_MEDIO_PAGO is not null
union
select distinct VENTA_MEDIO_PAGO, VENTA_MEDIO_PAGO_COSTO from gd_esquema.Maestra
where VENTA_MEDIO_PAGO is not null
end
go





--Para borrar los stored procedures anteriores

drop procedure Migrar_Medio_de_Pago
drop procedure Migrar_Compra_Descuento
drop procedure Migrar_Producto_Tipo_Variante
drop procedure Migrar_Canal_de_Ventas
drop procedure Migrar_Cupones
drop procedure Migrar_Proveedores
drop procedure Migrar_Zona_Localidad
drop procedure Borrar_Tablas


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


--Migra los canales de venta (devuelve 0 si esta todo ok)
declare @migracionCanalesVenta int
exec @migracionCanalesVenta = [Migrar_Canal_de_Ventas]
select "Resultado Canales de Venta" = @migracionCanalesVenta
go




--Migra las Zona Localidad (devuelve 0 si esta todo ok)
declare @migracionZonaLocalidad int
exec @migracionZonaLocalidad = [Migrar_Zona_Localidad]
select "Resultado Zona Localidad" = @migracionZonaLocalidad
go


--Migra los Cupones (devuelve 0 si esta todo ok)
declare @migracionCupones int
exec @migracionCupones = [Migrar_Cupones]
select "Resultado Cupones" = @migracionCupones
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




--------------------------------------------------------------------------------------------------------------------
----------------------- Consultas utiles para probar si funcionan los procedures y otros comentarios ---------------
--------------------------------------------------------------------------------------------------------------------


select * from Canal_de_Venta
select * from Zona_Localidad
select * from Producto_Tipo_Variante
select * from Compra_Descuento



select * from Variante

select * from Codigo_Postal

select * from Cliente

insert into Cliente
select distinct CLIENTE_CODIGO_POSTAL, CLIENTE_DNI, CLIENTE_NOMBRE, CLIENTE_APELLIDO, CLIENTE_TELEFONO, 
 CLIENTE_MAIL, CLIENTE_FECHA_NAC, CLIENTE_LOCALIDAD from gd_esquema.Maestra
 where CLIENTE_DNI is not null


select CLIENTE_DIRECCION from gd_esquema.Maestra

select * from Cupon


select distinct VENTA_CUPON_CODIGO, VENTA_CUPON_IMPORTE, VENTA_CUPON_FECHA_DESDE, VENTA_CUPON_FECHA_HASTA,
VENTA_CUPON_VALOR, VENTA_CUPON_TIPO from gd_esquema.Maestra
where VENTA_CUPON_CODIGO is not null
order by VENTA_CUPON_CODIGO


select PRODUCTO_CATEGORIA from gd_esquema.Maestra
where PRODUCTO_CATEGORIA is not null
