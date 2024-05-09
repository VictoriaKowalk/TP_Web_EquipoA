<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TpCarritoEquipoA.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>hola </h1>
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
</asp:Content>
