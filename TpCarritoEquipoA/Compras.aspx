<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="TpCarritoEquipoA.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- Acá deberiamos mover el gridView para que nos muestre los articulos cargados en el carrito de compras.
          Si le haces click al icono del carrito, te trae a esta pagina--%>
    <br />
    <h2>Detalle de compra</h2>
    <br />
    <div class="container text-center">
        <div class="row" style="font-weight: bold;">
            <div class="col border" style="height: 50px;">NOMBRE</div>
            <div class="col border" style="height: 50px;">CODIGO</div>
            <div class="col border" style="height: 50px;">PRECIO</div>
            <div class="col border" style="height: 50px;">CANTIDAD</div>
            <div class="col border" style="height: 50px;">TOTAL</div>
        </div>
    </div>

    <!-- Acá podemos hacer un for que agregue filas a medida de que se van cargando los productos en el carrito -->
    <div class="container text-center">
        <div class="row">
            <div class="col border" style="height: 50px;">.</div>
            <div class="col border" style="height: 50px;">.</div>
            <div class="col border" style="height: 50px;">.</div>
            <div class="col border" style="height: 50px;">.</div>
            <div class="col border" style="height: 50px;">.</div>
        </div>
    </div>


    <br />
    <br />
        <div class="container">
        <div class="row">
            <div class="col">
                <a href="#" class="btn btn-primary float-end">Comprar</a>
            </div>
        </div>
    </div>
    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col">
                <a href="Default.aspx" class="btn btn-primary float-end">Volver</a>
            </div>
        </div>
    </div>


</asp:Content>
