<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TpCarritoEquipoA.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="bg-dark text-white p -3 w-100" style="height: 80px;">
        <div class="container d-flex align-items-center justify-content-start">
            <asp:Label ID="lblFiltrarPor" runat="server" Text="Filtrar por:" style="margin-right: 20px;" />
            <asp:DropDownList ID="ddlFiltrarPor" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFiltrarPor_SelectedIndexChanged" CssClass="form-select" style="margin-right: 40px;">
            </asp:DropDownList>

            <asp:Label ID="lblCriterio" runat="server" Text="Criterio:" style="margin-right: 20px;" />
            <asp:DropDownList ID="ddlCriterio" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCriterio_SelectedIndexChanged" CssClass="form-select"  >
            </asp:DropDownList>

            <asp:Button ID="btnAplicarFiltro" runat="server" Text="Aplicar filtro" CssClass="btn btn-primary" onClick="btnAplicarFiltro_Click"/>
        </div>
    </div>

    <div class="container">
        <div>
            <br />
            <div class="container text-center">
                <h1 class="display-3">NUESTROS PRODUCTOS</h1>
            </div>
            <br />

            <div class="row row-cols 1 row-cols-md-3 g-4">
                <% foreach (TpCarritoEquipoA.Articulo item in (List<TpCarritoEquipoA.Articulo>)Session["articulos"])
                    {%>
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <% 
                            string defaultUrl = "https://nayemdevs.com/wp-content/uploads/2020/03/default-product-image.png";
                            if (item.Imagenes.Count() > 0) // Verifica si hay imágenes
                            {
                                urlImagen = item.Imagenes[0].ImagenUrl;  //Asigna la primera imagen
                            }%>
                        <img src="<%= urlImagen %>" style="width: auto" class="card-img-top" alt="Imagen del producto <%= item.Nombre %>" onerror="this.src='<%= defaultUrl %>'">
                        <div class="card-body">
                            <%lblNombre.Text = string.Format("<h1>{0}</h1>", item.Nombre);
                                lblCodigo.Text = string.Format("<h5>{0}</h5>", item.Codigo);
                                lblPrecio.Text = string.Format("<p>ARS {0}</p>", (Math.Round(item.Precio, 2).ToString()));%>
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
    </div>
</asp:Content>
