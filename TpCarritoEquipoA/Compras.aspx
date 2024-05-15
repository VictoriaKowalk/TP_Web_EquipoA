<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="TpCarritoEquipoA.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
        </div>

        <%miCarrito = (TpCarritoEquipoA.CarritoCompras)Session["compras"];
            int cantProductos = miCarrito.ObtenerProductos().Count();
            foreach (TpCarritoEquipoA.Articulo articulo in miCarrito.ObtenerProductos())
            {%>
        <div class="row align-items-center" style="font-weight: bold;">
            <% 
                string defaultUrl = "https://nayemdevs.com/wp-content/uploads/2020/03/default-product-image.png";
                string urlImagen = defaultUrl; // Establecer URL predeterminada
                if (articulo.Imagenes.Count() > 0) // Verificar si hay imágenes
                {
                    urlImagen = articulo.Imagenes[0].ImagenUrl; // Asignar la primera imagen
                }%>
            <div class="col border" style="height: 100px;">
                <img src="<%= urlImagen %>" style="max-width: 100%; max-height: 100%; object-fit: contain;" class="card-img-top" alt="Imagen del producto <%= articulo.Nombre %>" onerror="this.src='<%= defaultUrl %>'">
            </div>
            <div class="col border d-flex justify-content-center align-items-center" style="height: 100px;"><%=articulo.Nombre%></div>
            <div class="col border d-flex justify-content-center align-items-center" style="height: 100px;"><%=articulo.Codigo%></div>
            <div class="col border d-flex justify-content-center align-items-center" style="height: 100px;">ARS <%=Math.Round(articulo.Precio, 2)%></div>
            <div class="col border d-flex justify-content-center align-items-center" style="height: 100px;"><%=articulo.Cantidad%></div>
            <div class="col border d-flex justify-content-center align-items-center" style="height: 100px;">ARS <%=Math.Round(articulo.Cantidad * articulo.Precio, 2) %></div>
        </div>
        <%}%>
    </div>

    <br />

    <div class="col text-end">
        <asp:Label ID="Costo_Total" runat="server" CssClass="form-label" Font-Bold="true" Font-Size="Large">Costo Total: ARS <%=Math.Round(costoTotal , 2) %> </asp:Label>
    </div>

    <div class="container">
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
