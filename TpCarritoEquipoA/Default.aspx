<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TpCarritoEquipoA.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <div class="container text-center">
            <h1 class="display-3">NUESTROS PRODUCTOS</h1>
        </div>
        <br />


        <div class="row row-cols 1 row-cols-md-3 g-4">
            <% foreach (TpCarritoEquipoA.Articulo item in misArticulos)  
               {%>
            <div class="col">
                <div class="card" style="width: 18rem;">
                    <% 
                        string defaultUrl = "https://nayemdevs.com/wp-content/uploads/2020/03/default-product-image.png";
                        if (item.Imagenes.Count() > 0) // Verifica si hay imágenes
                        {
                            urlImagen = item.Imagenes[0].ImagenUrl;  //Asigna la primera imagen
                        }%>
                    <img src="<%= urlImagen %>" style="width:auto" class="card-img-top" alt="Imagen del producto <%= item.Nombre %>" onError="this.src='<%= defaultUrl %>'">
                    <div class="card-body">
                        <%lblNombre.Text = string.Format("<h1>{0}</h1>", item.Nombre);
                          lblCodigo.Text = string.Format("<h5>{0}</h5>", item.Codigo); 
                          lblPrecio.Text = string.Format("<p>ARS {0}</p>",(Math.Round(item.Precio, 2).ToString()));%> 
                        <asp:Label ID="lblNombre" runat="server" />
                        <asp:Label ID="lblCodigo" runat="server" />
                        <asp:Label ID="lblPrecio" runat="server" />

                        <a href="DetalleProducto.aspx?id=<%=item.IDArticulo%>" class="btn btn-primary">Ver más</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

    </div>
    <div>
        <asp:Label ID="lblTotal" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
