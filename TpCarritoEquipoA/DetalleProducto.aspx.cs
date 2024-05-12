using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TpCarritoEquipoA
{
    public partial class DetalleProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) // Si es la primera carga
            {
                List<Articulo> verDetalle;
                verDetalle = Session["articulos"] != null ? (List<Articulo>)Session["articulos"] : new List<Articulo>();
                Session.Add("verDetalle", verDetalle);

                int id = int.Parse(Request.QueryString["id"]);

                List<Articulo> listaOriginal = (List<Articulo>)Session["verDetalle"];
                Articulo seleccionado = listaOriginal.Find(x => x.IDArticulo == id);
                txtNombre.Text = string.Format("<h1>{0}</h1>", seleccionado.Nombre);
                txtCodigo.Text = string.Format("<h5>{0}</h5>", seleccionado.Codigo);
                txtPrecio.Text = string.Format("<p>{0}</p>", (Math.Round(seleccionado.Precio, 2)).ToString());
                txtDescripcion.Text = string.Format("<p>{0}</p>", seleccionado.Descripcion);

            }
        }
    }
}