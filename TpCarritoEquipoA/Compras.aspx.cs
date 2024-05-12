using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TpCarritoEquipoA
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public Articulo artAgregado;
        public List<Articulo> compras;
        public CarritoCompras miCarrito;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["compras"] == null)
            {
                miCarrito = new CarritoCompras();
                Session.Add("compras", miCarrito);
            } else
            {
                miCarrito = (CarritoCompras)Session["compras"];
            }

            int id = int.Parse(Request.QueryString["id"]);
            artAgregado = ((List<Articulo>)Session["articulos"]).Find(x => x.IDArticulo == id);
            miCarrito.AgregarProducto(artAgregado);

            dgvCompras.DataSource = miCarrito.ObtenerProductos();
            dgvCompras.DataBind();
        }

    }
}