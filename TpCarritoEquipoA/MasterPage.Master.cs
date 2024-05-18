using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;
using static System.Net.Mime.MediaTypeNames;

namespace TpCarritoEquipoA
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        CarritoCompras miCarrito;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["compras"] == null)
            {
                miCarrito = new CarritoCompras();
                Session.Add("compras", miCarrito);
            }
            else
            {
                miCarrito = (CarritoCompras)Session["compras"];
            }
            lblContador.Text = miCarrito.ObtenerProductos().Count().ToString();
        }
    }
}