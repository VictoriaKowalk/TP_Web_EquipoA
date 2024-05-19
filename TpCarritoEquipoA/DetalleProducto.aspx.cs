using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TpCarritoEquipoA
{

    public partial class DetalleProducto : System.Web.UI.Page
    {
        public Articulo artSeleccionado;
        public string urlImagen = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            ddlCantidad.Items.Add("1");
            ddlCantidad.Items.Add("2");
            ddlCantidad.Items.Add("3");
            ddlCantidad.Items.Add("4");
            ddlCantidad.Items.Add("5");
            ddlCantidad.Items.Add("6");
            ddlCantidad.Items.Add("7");
            ddlCantidad.Items.Add("8");
            ddlCantidad.Items.Add("9");
            ddlCantidad.Items.Add("10");

            if (!IsPostBack) 
            {
                int id = int.Parse(Request.QueryString["id"]);

                artSeleccionado = ((List<Articulo>)Session["articulos"]).Find(x => x.IDArticulo == id);

                txtNombre.Text = string.Format("<h1>{0}</h1>", artSeleccionado.Nombre);
                txtCodigo.Text = string.Format("<h5>Código: {0}</h5>", artSeleccionado.Codigo);
                txtPrecio.Text = string.Format("<h3>ARS {0}</h3>", (Math.Round(artSeleccionado.Precio, 2)).ToString());
                txtDescripcion.Text = string.Format("<p>{0}</p>", artSeleccionado.Descripcion);
                txtMarca.Text = string.Format("<h6>Marca: {0}</h6>", artSeleccionado.Marca);
                txtCategoria.Text = string.Format("<h6>Categoria: {0}</h6>", artSeleccionado.Categoria);

            }
        }

        protected void ddlCantidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCantidad.SelectedItem.Text.ToString();
        }

        protected void btnAgregarAlCarrito_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            string cant = ddlCantidad.SelectedValue;
            Session.Add("cantidad", cant);

            Response.Redirect($"compras.aspx?id={id}");
        }

    }
}