<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TpCarritoEquipoA.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h1 class="display-3">NUESTROS PRODUCTOS</h1>
         
             <%-- <asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Producto" HeaderText="Producto" />
                <asp:BoundField DataField="Precio" HeaderText="Precio" />
                <asp:TemplateField HeaderText="Cantidad">
                    <ItemTemplate>
                        <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
                        <asp:Button ID="Botoncito" Text="Agregar al Carrito" OnClick="Botoncito_Click" runat="server"/>
                    </ItemTemplate>
                </asp:TemplateField>
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
        </asp:GridView> --%>
        <div class="row row-cols 1 row-cols-md-3 g-4">
            <% foreach (TpCarritoEquipoA.Articulo item in misArticulos)
                {%>
            <div class="col">
                <div class="card" style="width: 18rem;">
                    <% 
                        if (item.Imagenes.Count() > 0) // Verifica si hay imágenes
                        {
                            urlImagen = item.Imagenes[0].ImagenUrl;  //Asigna la primera imagen
                        }
                        else
                        {
                            // Si no hay imagen, usa esta en su lugar.
                            string defaultUrl = "https://nayemdevs.com/wp-content/uploads/2020/03/default-product-image.png";
                            urlImagen = defaultUrl; 
                        }%>
                    <img src="<%= urlImagen %>"  class="card-img-top" alt="Imagen del producto <%= item.Nombre %>">
                    <div class="card-body">
                        <h1 class="nombre-art"><%=item.Nombre %> </h1>
                        <h5 class="cod-art"><%=item.Codigo %></h5>
                        <p class="precio-art">ARS <%=Math.Round(item.Precio, 2) %></p>
                        <a href="#" class="btn btn-primary">Ver más</a>
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
