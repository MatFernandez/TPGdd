
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
	DESCUENTO_COMPRA_VALOR decimal(19,0)
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
	VENTA_CLIENTE_CODIGO char(6),
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
	CLIENTE_CODIGO char(6) not null,
	CLIENTE_CP decimal (18,0),
	CLIENTE_DNI decimal(18,0),
	CLIENTE_NOMBRE nvarchar(255),
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


--Stored procedure para migrar proveedores de la tabla maestra a nuestro modelo

create procedure Migrar_Proveedores 
as 
begin
insert into Proveedor

select distinct Maestra.PROVEEDOR_CUIT, Maestra.PROVEEDOR_RAZON_SOCIAL, Maestra.PROVEEDOR_MAIL, Maestra.PROVEEDOR_DOMICILIO,
Maestra.PROVEEDOR_CODIGO_POSTAL, Maestra.PROVEEDOR_LOCALIDAD, Maestra.PROVEEDOR_PROVINCIA from gd_esquema.Maestra
where PROVEEDOR_CUIT is not null

end
go



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


--------------------------------------------------------------------------------------------------------------------
--------------------------- Consultas utiles para probar si funcionan los procedures y comentarios -----------------
--------------------------------------------------------------------------------------------------------------------

--El select de la tabla maestra (299064 rows, 6 seg)

select Maestra.PROVEEDOR_CUIT, Maestra.PROVEEDOR_RAZON_SOCIAL, Maestra.PROVEEDOR_MAIL, Maestra.PROVEEDOR_DOMICILIO,
Maestra.PROVEEDOR_CODIGO_POSTAL, Maestra.PROVEEDOR_LOCALIDAD, Maestra.PROVEEDOR_PROVINCIA from gd_esquema.Maestra



--El select despues de migrar, o sea de nuestra tabla (coinciden los rows 299064), en teoria los carga bien

select * from Proveedor


--Y este solo muestra los proveedores sin repeticiones (No funciona bien el orden ascendente de razon social¿?¿¿??)

select * from Proveedor
where PROVEEDOR_CUIT is not null
group by PROVEEDOR_CUIT, PROVEEDOR_RAZON_SOCIAL, PROVEEDOR_MAIL, PROVEEDOR_DOMICILIO, PROVEEDOR_CP, PROVEEDOR_LOCALIDAD, PROVEEDOR_PROVINCIA
order by PROVEEDOR_RAZON_SOCIAL ASC
