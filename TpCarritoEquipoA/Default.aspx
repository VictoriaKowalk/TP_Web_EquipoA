<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TpCarritoEquipoA.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .tarjeta {
            width: 100px;
            height: 400px;
        }

        .card {
            height: 100%;
        }

        .card-img-top {
            height: 80%;
            object-fit: contain;
        }
      
    </style>

    <div class="bg-dark text-white p -3 w-100 d-flex justify-content-center align-items-center" style="height: 70px;">
        <div class="d-flex align-items-center">
            <asp:Label ID="lblFiltrarPor" runat="server" Text="Filtrar por:" Style="margin-right: 10px;" />
            <div class="ddlf" style="width: 160px; height: 20px; margin-right: 20px;">
                <asp:DropDownList ID="ddlFiltrarPor" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFiltrarPor_SelectedIndexChanged" CssClass="form-select" Style="margin-right: 40px;">
                </asp:DropDownList>
            </div>
            <asp:Label ID="lblCriterio" runat="server" Text="Criterio:" Style="margin-right: 10px; margin-left: 30px" />
            <div class="ddlf" style="width: 160px; height: 20px">
                <asp:DropDownList ID="ddlCriterio" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCriterio_SelectedIndexChanged" CssClass="form-select">
                </asp:DropDownList>
            </div>
            <div class="ddlf" style=" width: 160px; height: 20px">
                <asp:Button ID="btnAplicarFiltro" runat="server" Text="Aplicar filtro" CssClass="btn btn-primary" OnClick="btnAplicarFiltro_Click" Style="margin-left: 75px;" />
            </div>

            <div class="ddlf" style="margin-left: 40px; width: 50px; height: 10px;">
                <asp:LinkButton ID="btnLimpiarFiltro" runat="server" OnClick="btnLimpiarFiltro_Click">
                    <i class="fa-solid fa-filter-circle-xmark fa-lg icon" style="color: #ffffff;"></i>
                </asp:LinkButton>
            </div>

            <div class="d-flex align-items-center ml-auto" style="width: 250px;  margin-left: 400px;">
                <div class="input-group" style="width: 100%;">
                    <asp:TextBox ID="tbxBuscar" CssClass="form-control input-group-lg" runat="server" />
                    <div class="input-group-append">
                        <asp:Button Text="Buscar" ID="Button1" CssClass="btn btn-secondary" OnClick="btnBuscar_Click" runat="server" />
                    </div>
                </div>
            </div>
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
                <% foreach (dominio.Articulo item in misArticulos)
                    {%>
                <div class="col">
                    <div class="card">
                        <img src="<%= item.Imagenes[0].ImagenUrl%>" style="width: auto; height: 80%; object-fit: contain;" class="card-img-top" alt="Imagen del producto <%= item.Nombre %>" onerror="this.src='https://nayemdevs.com/wp-content/uploads/2020/03/default-product-image.png'">
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
