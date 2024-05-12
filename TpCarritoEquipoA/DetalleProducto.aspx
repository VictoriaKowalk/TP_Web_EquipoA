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
                            <img src="img/logo.jpg" class="img-fluid rounded-start" alt="Imagen del producto" style="height: 100%;">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">

                                <asp:Label ID="txtNombre"  runat="server" />
                                <div>
                                    <asp:Label ID="txtCodigo"  runat="server" />
                                </div>

                                <div>
                                    <asp:Label ID="txtDescripcion"  runat="server" />
                                </div>

                                <div>
                                    <asp:Label ID="txtPrecio"  runat="server" />
                                </div>


                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Cantidad</span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="1" aria-label="Cantidad" aria-describedby="basic-addon1">
                                </div>
                                <div class="text-center">
                                    <a href="Compras.aspx" class="btn btn-primary">Agregar al carrito</a>
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
