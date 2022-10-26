

create table Compra(
	COMPRA_NUMERO decimal(19,0) not null,
	COMPRA_PROVEEDOR nvarchar(50),
	COMPRA_MEDIO_PAGO nvarchar(255),
	COMPRA_DESCUENTO_CODIGO decimal(19,0),
	COMPRA_FECHA date,
	COMPRA_TOTAL decimal(18,2)
);
alter table Compra
add primary key (COMPRA_NUMERO)
alter table Compra 
add constraint FK_COMPRA_PROVEEDOR foreign key(COMPRA_PROVEEDOR) references Proveedor(PROVEEDOR_CUIT)
alter table Compra
add constraint FK_COMPRA_MEDIO_PAGO foreign key(COMPRA_MEDIO_PAGO) references Medio_de_Pago(MEDIO_PAGO_ID)
alter table Compra
add constraint FK_COMPRA_DESCUENTO_CODIGO foreign key(COMPRA_DESCUENTO_CODIGO) references Compra_Descuento(DESCUENTO_COMPRA_CODIGO)


create table Compra_Producto(
	COMPRA_PRODUCTO_CODIGO nvarchar(50),
	PRODUCTO_VARIANTE_CODIGO nvarchar(50),
	COMPRA_NUMERO decimal(19,0),
	COMPRA_PRODUCTO_CANTIDAD decimal(18,0),
	COMPRA_PRODUCTO_PRECIO decimal(18,2)
);
alter table Compra_Producto 
add constraint FK_Compra_Producto_Compra foreign key(COMPRA_NUMERO) references compra(COMPRA_NUMERO)
alter table Compra_Producto 
add constraint FK_Compra_Producto_Por_Variante foreign key(COMPRA_PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO) references Producto_Por_Variante(PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO)


create table Compra_Descuento(
	DESCUENTO_COMPRA_CODIGO decimal(19,0) not null,
	DESCUENTO_COMPRA_VALOR decimal(19,0)
);
alter table Compra_Descuento 
add primary key(DESCUENTO_COMPRA_CODIGO)


create table Medio_de_Pago( 
	MEDIO_PAGO_ID nvarchar(255) not null,
	MEDIO_PAGO_COSTO decimal (18,2)
);
alter table Medio_de_Pago 
add primary key(MEDIO_PAGO_ID)


create table Producto_Tipo_Variante(
	PRODUCTO_VARIANTE_CODIGO nvarchar(50) not null,
	PRODUCTO_TIPO_VARIANTE nvarchar(50)
);
alter table Producto_Tipo_Variante 
add primary key(PRODUCTO_VARIANTE_CODIGO) 


create table Variante(
	PRODUCTO_VARIANTE_CODIGO nvarchar(50)not null, /* explicar porque se puso como FK Y NO PK como estaba antes*/
	PRODUCTO_VARIANTE nvarchar(50)
);
alter table Variante 
add constraint FK_PRODUCTO_TIPO_X_VARIANTE foreign key(PRODUCTO_VARIANTE_CODIGO) references Producto_Tipo_Variante(PRODUCTO_VARIANTE_CODIGO)


create table Canal_de_Venta(
	CANAL_ID nvarchar(255) not null,
	CANAL_COSTO decimal(18,2)
);
alter table Canal_de_Venta
add primary key (CANAL_ID)



create table Venta_Descuento(
	VENTA_CODIGO decimal(19,0),
	VENTA_MEDIO_DE_PAGO_id nvarchar(255),
	VENTA_DESCUENTO_CONCEPTO nvarchar(255),
	VENTA_DESCUENTO_IMPORTE decimal (18,2)
);
	
alter table Venta_Descuento
add constraint FK_VENTA_DESCUENTO_VENTA foreign key(VENTA_CODIGO) references Venta(VENTA_CODIGO)
alter table Venta_Descuento
add constraint FK_VENTA_DESCUENTO_MEDIO_DE_PAGO foreign key(VENTA_MEDIO_DE_PAGO_id) references Medio_De_Pago(MEDIO_PAGO_ID)


create table Venta_Por_Cupon(
	VENTA_CODIGO decimal(19,0),
	VENTA_CUPON_CODIGO nvarchar(255),
	Venta_CUPON_Total decimal(18,2)
);
alter table Venta_Por_Cupon
add constraint FK_Venta_Por_Cupon_X_Cupon foreign key(VENTA_CODIGO) references Venta(VENTA_CODIGO)
alter table Venta_Por_Cupon
add constraint FK_Venta_Por_Cupon foreign key(VENTA_CUPON_CODIGO) references Cupon(VENTA_CUPON_CODIGO)

create table Cupon(
	VENTA_CUPON_CODIGO nvarchar(255) not null,
	VENTA_CUPON_IMPORTE decimal(18,2),
	VENTA_CUPON_FECHA_DESDE date,
	VENTA_CUPON_FECHA_HASTA date,
	VENTA_CUPON_VALOR decimal(18,2),
	VENTA_CUPON_TIPO nvarchar(50)
);
alter table Cupon 
add primary key (VENTA_CUPON_CODIGO)



create table Proveedor(
	PROVEEDOR_CUIT nvarchar(50) not null,
	PROVEEDOR_CP decimal(18,0),
	PROVEEDOR_RAZON_SOCIAL nvarchar(50),
	PROVEEDOR_MAIL nvarchar(50),
	PROVEEDOR_DOMICILIO nvarchar(50)
);
alter table Proveedor  
add primary key (PROVEEDOR_CUIT)
alter table Proveedor 
add constraint FK_Proveedor_CP foreign key(PROVEEDOR_CP) references CODIGO_POSTAL(CODIGO_POSTAL)


create table Producto_Categoria(
	PRODUCTO_CATEGORIA_ID int identity(1,1) not null ,
	PRODUCTO_CATEGORIA nvarchar(255)
);
alter table Producto_Categoria  
add primary key (PRODUCTO_CATEGORIA_ID)



create table Producto_Por_Variante(
	PRODUCTO_CODIGO nvarchar(50) not null,
	PRODUCTO_VARIANTE_CODIGO nvarchar(50)  not null,
	PRECIO_UNITARIO_VENTA decimal(18,2),
	PRECIO_UNITARIO_COMPRA decimal(18,2)
);
alter table Producto_Por_Variante 
add constraint FK_Producto_por_variante foreign key(PRODUCTO_CODIGO) references Producto(PRODUCTO_CODIGO)
alter table Producto_Por_Variante 
add constraint FK_Producto_por_variante_tipo_variante foreign key(PRODUCTO_VARIANTE_CODIGO) references Producto_Tipo_Variante(PRODUCTO_VARIANTE_CODIGO)
alter table Producto_Por_Variante 
add constraint PK_Producto_por_variante_Codigo primary key (PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO) 

create table Venta(
	VENTA_CODIGO decimal(19,0) not null,
	VENTA_CLIENTE_CODIGO char(6),
	VENTA_MEDIO_PAGO nvarchar(255),
	VENTA_MEDIO_PAGO_COSTO decimal(18,2),
	VENTA_CANAL nvarchar(255),
	VENTA_CANAL_COSTO decimal(18,2),
	VENTA_ENVIO_CODIGO nvarchar(255) NOT NULL,
	VENTA_COSTO_ENVIO decimal(18,2),
	VENTA_FECHA date,
	VENTA_TOTAL decimal(18,2)
);
alter table Venta 
add constraint PK_VENTA_ENVIO_CODIGO primary key (VENTA_CODIGO)
alter table Venta 
add constraint FK_VENTA_CLIENTE foreign key(VENTA_CLIENTE_CODIGO) references Cliente(CLIENTE_CODIGO)
alter table Venta 
add constraint FK_VENTA_CANAL foreign key(VENTA_CANAL) references Canal_de_Venta(CANAL_ID)
alter table Venta 
add constraint FK_VENTA_MEDIO_DE_PAGO foreign key(VENTA_MEDIO_PAGO) references Medio_De_Pago(MEDIO_PAGO_ID)
alter table Venta 
add constraint FK_VENTA_ENVIO foreign key(VENTA_ENVIO_CODIGO) references Envio_CP(ENVIO_CODIGO)



create table Venta_Producto(
	VENTA_PRODUCTO_CODIGO nvarchar(50),
	VENTA_CODIGO decimal(19,0),
	PRODUCTO_VARIANTE_CODIGO nvarchar(50),
	VENTA_PRODUCTO_CANTIDAD decimal(18,0),
	VENTA_PRODUCTO_PRECIO decimal(18,2)
);
alter table Venta_Producto
add constraint FK_Venta_Producto_Por_Variante foreign key(VENTA_PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO) references Producto_Por_Variante(PRODUCTO_CODIGO,PRODUCTO_VARIANTE_CODIGO)
alter table Venta_Producto 
add constraint FK_Venta_Producto_Venta foreign key(VENTA_CODIGO) references Venta(VENTA_CODIGO)



create table Envio_CP(
	VENTA_CODIGO decimal(19,0) not null,
	ENVIO_CODIGO nvarchar(255) not null,
	CODIGO_POSTAL decimal(18,0) not null,
	ENVIO_PRECIO decimal(18,2)
);

alter table Envio_CP
add constraint FK_ENVIO_CP_VENTA foreign key(VENTA_CODIGO) references Venta(VENTA_CODIGO)
alter table Envio_CP
add  constraint FK_ENVIO_CP_ENVIO foreign key(ENVIO_CODIGO) references Envio(ENVIO_CODIGO)
alter table Envio_CP
add  constraint FK_ENVIO_CP foreign key(CODIGO_POSTAL) references CODIGO_POSTAL(CODIGO_POSTAL)



create table Envio(
	ENVIO_CODIGO nvarchar(255) not null,
	ENVIO_MEDIO nvarchar(255),
	ENVIO_PRECIO decimal(18,2)
);
alter table Envio 
add primary key (ENVIO_CODIGO)



create table Producto(
	PRODUCTO_CODIGO nvarchar(50)not null,
	PRODUCTO_CATEGORIA int,
	PRODUCTO_NOMBRE nvarchar(50),
	PRODUCTO_DESCRIPCION nvarchar(50),
	PRODUCTO_MATERIAL nvarchar(50),
	PRODUCTO_MARCA nvarchar(50)
);
alter table Producto 
add primary key (PRODUCTO_CODIGO)
alter table Producto 
add constraint FK_Producto_Por_Categoria foreign key(PRODUCTO_CATEGORIA) references Producto_Categoria(PRODUCTO_CATEGORIA_ID)



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
alter table Cliente
add primary key (CLIENTE_CODIGO)
alter table cliente 
add constraint FK_CLIENTE_CP foreign key(CLIENTE_CP) references CODIGO_POSTAL(CODIGO_POSTAL)


--Revisar que onda esto, en el der falta el decimal en el CP
create table CODIGO_POSTAL(
	CODIGO_POSTAL decimal(18,0) not null,
	CODIGO_POSTAL_LOCALIDAD_ID nvarchar(50)
);
alter table CODIGO_POSTAL 
add primary key (CODIGO_POSTAL)

create table Zona_Localidad(
	LOCALIDAD_ID int identity(1,1) not null,
	PROVINCIA nvarchar(50),
	LOCALIDAD nvarchar(50)
);
alter table Zona_Localidad 
add primary key(LOCALIDAD_ID)
