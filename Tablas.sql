

create table Compra(
	COMPRA_NUMERO decimal(19,0),
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
	DESCUENTO_COMPRA_CODIGO decimal(19,0),
	DESCUENTO_COMPRA_VALOR decimal(19,0)
);



create table Medio_de_Pago(
	MEDIO_PAGO_ID nvarchar(255),
	MEDIO_PAGO_COSTO decimal (18,2)
);



create table Producto_Tipo_Variante(
	PRODUCTO_VARIANTE_CODIGO nvarchar(50),
	PRODUCTO_TIPO_VARIANTE nvarchar(50)
);



create table Variante(
	PRODUCTO_VARIANTE_CODIGO nvarchar(50),
	PRODUCTO_VARIANTE nvarchar(50),
);



create table Canal_de_Venta(
	CANAL_ID nvarchar(255),
	CANAL_COSTO decimal(18,2)
);



create table Venta_Descuento(
	VENTA_CODIGO decimal(19,0),
	VENTA_DESCUENTO_CODIGO nvarchar(255),
	VENTA_DESCUENTO_IMPORTE decimal (18,2)
);



create table Venta_Cupon(
	VENTA_CODIGO decimal(19,0),
	VENTA_CUPON_CODIGO nvarchar(255),
	VENTA_DESCUENTO_IMPORTE decimal(18,2)
);



create table Proveedor(
	PROVEEDOR_CUIT nvarchar(50),
	PROVEEDOR_ZONA char(3),
	PROVEEDOR_RAZON_SOCIAL nvarchar(50),
	PROVEEDOR_MAIL nvarchar(50),
	PROVEEDOR_DOMICILIO nvarchar(50)
);



create table Producto_Categoria(
	PRODUCTO_CATEGORIA_ID char(3),
	PRODUCTO_CATEGORIA nvarchar(255)
);



create table Producto_Por_Variante(
	PRODUCTO_CODIGO nvarchar(50),
	PRODUCTO_VARIANTE_CODIGO nvarchar(50),
	PRECIO_UNITARIO_VENTA decimal(18,2),
	PRECIO_UNITARIO_COMPRA decimal(18,2)
);



create table Venta(
	VENTA_CODIGO decimal(19,0),
	VENTA_CLIENTE_CODIGO char(6),
	VENTA_MEDIO_PAGO nvarchar(255),
	VENTA_MEDIO_PAGO_COSTO decimal(18,2),
	VENTA_CANAL nvarchar(255),
	VENTA_CANAL_COSTO decimal(18,2),
	VENTA_ENVIO_CODIGO nvarchar(255),
	VENTA_COSTO_ENVIO decimal(18,2),
	VENTA_FECHA date,
	VENTA_TOTAL decimal(18,2)
);



--En la tabla del der esta repetido el codigo
create table Cupon_Descuento(
	VENTA_CUPON_CODIGO nvarchar(255),
	VENTA_CUPON_DESCUENTO decimal(19,0),
	VENTA_CUPON_IMPORTE decimal(18,2),
	VENTA_CUPON_FECHA_DESDE date,
	VENTA_CUPON_FECHA_HASTA date,
	VENTA_CUPON_VALOR decimal(18,2),
	VENTA_CUPON_TIPO nvarchar(50)
);



create table Venta_Producto(
	VENTA_PRODUCTO_CODIGO nvarchar(50),
	VENTA_CODIGO decimal(19,0),
	PRODUCTO_VARIANTE_CODIGO nvarchar(50),
	VENTA_PRODUCTO_CANTIDAD decimal(18,0),
	VENTA_PRODUCTO_PRECIO decimal(18,2)
);



create table Envio_CP(
	VENTA_CODIGO decimal(19,0),
	ENVIO_CODIGO nvarchar(255),
	CODIGO_POSTAL decimal(18,0),
	ENVIO_PRECIO decimal(18,2)
);



create table Envio(
	ENVIO_CODIGO nvarchar(255),
	ENVIO_MEDIO nvarchar(255),
	ENVIO_PRECIO decimal(18,2)
);



create table Producto(
	PRODUCTO_CODIGO nvarchar(50),
	PRODUCTO_CATEGORIA char(3),
	PRODUCTO_NOMBRE nvarchar(50),
	PRODUCTO_DESCRIPCION nvarchar(50),
	PRODUCTO_MATERIAL nvarchar(50),
	PRODUCTO_MARCA nvarchar(50)
);



create table Cliente(
	CLIENTE_CODIGO char(6),
	CLIENTE_ZONA char(3),
	CLIENTE_DNI decimal(18,0),
	CLIENTE_NOMBRE nvarchar(255),
	CLIENTE_TELEFONO decimal(18,0),
	ClIENTE_MAIL nvarchar(255),
	CLIENTE_FECHA_NAC date,
	CLIENTE_DOMICILIO nvarchar(50)
);



--Revisar que onda esto, en el der falta el decimal en el CP
create table Zona(
	ZONA_CODIGO char(3),
	CODIGO_POSTAL decimal(18,0),
	LOCALIDAD nvarchar(50),
	PROVINCIA nvarchar(255)
);




