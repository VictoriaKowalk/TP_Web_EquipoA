<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TpCarrito.Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Carrito de Compras</h1>
            <asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="False">
                <Columns>
                 <asp:BoundField DataField="Producto" HeaderText="Producto" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" />
                    <asp:TemplateField HeaderText="Cantidad">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField ButtonType="Button" CommandName="Agregar" Text="Agregar al Carrito" />
                </Columns>
            </asp:GridView>
             <br />
            <asp:GridView ID="gvCarrito" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Producto" HeaderText="Producto" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" />
                    <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" />
                    <asp:BoundField DataField="Total" HeaderText="Total" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
