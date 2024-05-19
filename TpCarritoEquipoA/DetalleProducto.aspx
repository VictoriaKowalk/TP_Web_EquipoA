<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="TpCarritoEquipoA.DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
   <style>
        .carousel-control-next,
        .carousel-control-prev {
            filter: invert(100%);
        }
    </style>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="mb-3">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <%-- CARRUSEL --%>
                            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-inner">
                                    <%bool esActive = true;
                                    foreach (dominio.Imagen img in artSeleccionado.Imagenes){%>
                                        <div class="carousel-item <%= esActive ? "active" : "" %>">
                                            <img src="<%= img.ImagenUrl %>" class="img-fluid rounded-start" alt="Imagen del producto <%= artSeleccionado.Nombre %>" style="height: 300px; width: 100%; object-fit:contain;">
                                        </div>
                                        <%esActive = false; // setea el esActive a falso despues de la primer iteracion
                                    }%>
                                </div>
                                <button class="carousel-control-prev"  type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Next</span>
                                </button>
                            </div>
                            <%-- END CARRUSEL --%>
                        </div>

                    <div class="col-md-8">
                        <div class="card-body">

                            <asp:Label ID="txtNombre" runat="server" />

                            <div>
                                <asp:Label ID="txtCodigo" runat="server" />
                            </div>

                            <div>
                                <label for="txtPrecio" class="form-label">Precio: </label>
                                <asp:Label ID="txtPrecio" runat="server" />
                                <p for="txtPrecio" class="form-label;" style="font-weight: bold; color: darkgreen">Mismo precio en 6 cuotas de ARS <%=Math.Round(artSeleccionado.Precio / 6,2) %></p>
                            </div>

                            <asp:Label ID="txtMarca" runat="server" />

                            <asp:Label ID="txtCategoria" runat="server" />

                            <div>
                                <asp:Label ID="txtDescripcion" runat="server" />
                            </div>

                            <div class="input-group mb-3">
                                <div class="mb-3">
                                    <label for="lblCantidad" class="form-label">Cantidad: </label>
                                    <asp:DropDownList ID="ddlCantidad" CssClass="form-select" OnSelectedIndexChanged="ddlCantidad_SelectedIndexChanged" runat="server" />
                                </div>
                            </div>
                            <div class="justify-content-center">
                                <asp:Button ID="btnAgregarAlCarrito" runat="server" Text="Agregar al carrito" CssClass="btn btn-primary" OnClick="btnAgregarAlCarrito_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

    <br />
    <br />
    <div class="container">
        <div class="row">
            <div class="col">
                <a href="Default.aspx" class="btn btn-primary float-end">Seguir comprando</a>
            </div>
        </div>
    </div>
</asp:Content>
