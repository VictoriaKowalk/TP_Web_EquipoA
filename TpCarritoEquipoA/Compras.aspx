﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="TpCarritoEquipoA.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <br />
        <h2>Detalle de compra</h2>
        <br />

        <div class="container text-center">
            <div class="row" style="font-weight: bold;">
                <div class="col border d-flex justify-content-center align-items-center" style="height: 50px;">PRODUCTO</div>
                <div class="col border d-flex justify-content-center align-items-center" style="height: 50px;">NOMBRE</div>
                <div class="col border d-flex justify-content-center align-items-center" style="height: 50px;">CODIGO</div>
                <div class="col border d-flex justify-content-center align-items-center" style="height: 50px;">PRECIO</div>
                <div class="col border d-flex justify-content-center align-items-center" style="height: 50px;">CANTIDAD</div>
                <div class="col border d-flex justify-content-center align-items-center" style="height: 50px;">TOTAL</div>
                <div class="col border d-flex justify-content-center align-items-center" style="height: 50px;">ELIMINAR</div>
            </div>
             <%
            foreach (dominio.Articulo articulo in miCarrito.ObtenerProductos()){%>
                <div class="row align-items-center" style="font-weight: bold;"><% 
                    string defaultUrl = "https://nayemdevs.com/wp-content/uploads/2020/03/default-product-image.png";
                    string urlImagen = defaultUrl; // Establecer URL predeterminada
                    if (articulo.Imagenes.Count() > 0){
                        urlImagen = articulo.Imagenes[0].ImagenUrl; // Asignar la primera imagen
                    }%>
                    <div class="col border" style="height: 100px;">
                        <img src="<%= urlImagen %>" style="max-width: 100%; max-height: 100%; object-fit: contain;" class="card-img-top" alt="Imagen del producto <%= articulo.Nombre %>" onerror="this.src='<%= defaultUrl %>'">
                    </div>
                    <div class="col border d-flex justify-content-center align-items-center" style="height: 100px;"><%=articulo.Nombre%></div>
                    <div class="col border d-flex justify-content-center align-items-center" style="height: 100px;"><%=articulo.Codigo%></div>
                    <div class="col border d-flex justify-content-center align-items-center" style="height: 100px;">ARS <%=Math.Round(articulo.Precio, 2)%></div>
                    <div class="col border d-flex justify-content-center align-items-center" style="height: 100px;"><%=articulo.Cantidad%></div>
                    <div class="col border d-flex justify-content-center align-items-center" style="height: 100px;">ARS <%=articulo.Cantidad * Math.Round(articulo.Precio, 2) %></div>
                    <div class="col border d-flex justify-content-center align-items-center" style="height: 100px;">
                        <a href="Compras.aspx?eliminar=<%=articulo.IDArticulo%>"><img src="https://i.pinimg.com/564x/1d/ea/b0/1deab0333e2eb27bae39398af6699ed4.jpg" style="height: 95px" /></a>
                    </div>
                </div>
          <%}%>
        </div>

        <br />

        <div class="col text-end">
            <asp:Label ID="Costo_Total" runat="server" CssClass="form-label" Font-Bold="true" Font-Size="Large">Costo Total: ARS <%=Math.Round(costoTotal , 2) %> </asp:Label>
        </div>

        <div class="row mt-2">
            <div class="col">
                <a href="#" class="btn btn-primary float-end">Comprar</a>
            </div>
        </div>

        <br />
        
        <div class="row">
            <div class="col">
                <a href="Default.aspx" class="btn btn-primary float-end">Seguir comprando</a>
            </div>
        </div>
    </div>

</asp:Content>
