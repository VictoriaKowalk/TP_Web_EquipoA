<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="TpCarritoEquipoA.DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card mb-3">
                    <div class="row g-0">
                        <div class="col-md-4">
                            <% 
                                string defaultUrl = "https://nayemdevs.com/wp-content/uploads/2020/03/default-product-image.png";
                                if (artSeleccionado.Imagenes.Count() > 0) // Verifica si hay imágenes
                                {
                                    urlImagen = artSeleccionado.Imagenes[0].ImagenUrl;  //Asigna la primera imagen
                                }%>
                            <img src="<%= urlImagen %>" id="artImagen" class="img-fluid rounded-start" alt="Imagen del producto <%= artSeleccionado.Nombre %>" onerror="this.src='<%= defaultUrl %>'" style="height: 100%">
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
                                    <p for="txtPrecio" class="form-label;" style="font-weight: bold;color:darkgreen">Mismo precio en 6 cuotas de <%=Math.Round(artSeleccionado.Precio / 6,2) %></p>
                                </div>

                                <div>
                                    <asp:Label ID="txtDescripcion" runat="server" />
                                </div>


                                <div class="input-group mb-3">
                                <%--    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Cantidad</span>
                                    </div>--%>
                                    <div style="mb-3">
                                        <label for="lblCantidad" class="form-label">Cantidad: </label>
                                        <asp:DropDownList id="ddlCantidad" CssClass="form-select" runat="server" />
                                    </div>
                                    <%--<input type="text" class="form-control" placeholder="1" aria-label="Cantidad" aria-describedby="basic-addon1">--%>
                                </div>
                                <div class="text-center">
                                    <a href="compras.aspx?id=<%=artSeleccionado.IDArticulo%>" class="btn btn-primary">Agregar al carrito</a>
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
                <a href="Default.aspx" class="btn btn-primary float-end">Volver</a>
            </div>
        </div>
    </div>






</asp:Content>
