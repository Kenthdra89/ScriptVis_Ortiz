CREATE VIEW Vista_ProductosConSuministro AS
SELECT
    P.ID_Producto,
    P.Nombre AS Nombre_Producto,
    P.Precio,
    P.Cantidad_en_Stock,
    P.Unidad_de_Medida,
    PP.Precio_de_Suministro,
    PP.Fecha_de_Suministro,
    PP.Cantidad,
    PP.Metodo_Pago,
    PP.Metodo_Envio,
    PR.Nombre AS Nombre_Proveedor,
    PR.DNI AS DNI_Proveedor,
    PR.Teléfono AS Telefono_Proveedor
FROM
    PRODUCTOS P
JOIN
    PRODUCTO_PROVEEDOR PP ON P.ID_Producto = PP.ID_Producto
JOIN
    PROVEEDORES PR ON PP.ID_Proveedor = PR.ID_Proveedor;
CREATE VIEW Vista_PedidosConProductos AS
SELECT
    PD.ID_Pedido,
    PD.Fecha,
    PD.Otros_Detalles,
    C.Nombre AS Nombre_Cliente,
    C.DNI AS DNI_Cliente,
    C.Telefono AS Telefono_Cliente,
    DP.Cantidad,
    P.Nombre AS Nombre_Producto,
    P.Precio
FROM
    PEDIDOS PD
JOIN
    CLIENTES C ON PD.ID_Cliente = C.ID_Cliente
JOIN
    DETALLES_DE_PEDIDO DP ON PD.ID_Pedido = DP.ID_Pedido
JOIN
    PRODUCTOS P ON DP.ID_Producto = P.ID_Producto;
CREATE VIEW Vista_ProductosEnPromociones AS
SELECT
    PR.ID_Promocion,
    PR.Descripcion AS Descripcion_Promocion,
    P.Nombre AS Nombre_Producto,
    P.Precio,
    P.Cantidad_en_Stock
FROM
    DETALLES_DE_PROMOCION DP
JOIN
    PROMOCIONES PR ON DP.ID_Promocion = PR.ID_Promocion
JOIN
    PRODUCTOS P ON DP.ID_Producto = P.ID_Producto;
CREATE VIEW Vista_DetallesPedidoConEmpleado AS
SELECT
    DP.ID_Detalle,
    DP.Cantidad,
    PD.Fecha,
    PD.Otros_Detalles,
    C.Nombre AS Nombre_Cliente,
    E.Nombre AS Nombre_Empleado,
    E.DNI AS DNI_Empleado,
    P.Nombre AS Nombre_Producto,
    P.Precio
FROM
    DETALLES_DE_PEDIDO DP
JOIN
    PEDIDOS PD ON DP.ID_Pedido = PD.ID_Pedido
JOIN
    CLIENTES C ON PD.ID_Cliente = C.ID_Cliente
JOIN
    EMPLEADOS E ON DP.ID_Empleado = E.ID_Empleado
JOIN
    PRODUCTOS P ON DP.ID_Producto = P.ID_Producto;
CREATE VIEW Vista_CiudadConDirecciones AS
SELECT
    C.ID_Ciudad,
    C.Nombre_Ciudad,
    D.ID_Direccion,
    D.Calle,
    D.Numeracion,
    D.Codigo_Postal
FROM
    CIUDAD C
JOIN
    DIRECCION D ON C.ID_Ciudad = D.ID_Ciudad;
