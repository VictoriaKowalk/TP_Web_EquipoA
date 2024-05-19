using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;


namespace TpCarritoEquipoA
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public Articulo artAgregado;
        public List<Articulo> compras;
        public CarritoCompras miCarrito;
        public string urlImagen;
        public decimal costoTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            miCarrito = (CarritoCompras)Session["compras"];

            if (!IsPostBack)
            {
                if (Request.QueryString["eliminar"] != null)
                {
                    int id = int.Parse(Request.QueryString["eliminar"]);
                    miCarrito.EliminarProducto(id);
                }
                if (Request.QueryString["id"] != null)
                {
                    bool estaAgregado = false;
                    int id = int.Parse(Request.QueryString["id"]);
                    int cant = int.Parse((string)Session["cantidad"]);
                   

                    artAgregado = ((List<Articulo>)Session["articulos"]).Find(x => x.IDArticulo == id);
                    artAgregado.Cantidad = cant;
                    foreach (Articulo articulo in miCarrito.ObtenerProductos())
                    {
                        if (articulo.IDArticulo == artAgregado.IDArticulo)
                        {
                            articulo.Cantidad += artAgregado.Cantidad;
                            if (articulo.Cantidad > 30) articulo.Cantidad = 30;// veo que la cantidad no supere 30
                            estaAgregado = true;
                        }
                    }
                    if (!estaAgregado)
                    {
                        miCarrito.AgregarProducto(artAgregado);
                        estaAgregado = true;
                    }
                    // El DataSource se hace después de que se agregan artículos al carrito
                    // sino queda desfasado

                }
                miRepetidor.DataSource = miCarrito.ObtenerProductos();
                miRepetidor.DataBind();
            }

            // El error es que cuando clickeamos desde el Default, aparece vacío porque no hay una fuente para el repetidor

            foreach (Articulo articulo in miCarrito.ObtenerProductos())
            {
                costoTotal += articulo.Cantidad * Math.Round(articulo.Precio, 2);
            }
        }

        protected void miTextBox_TextChanged(object sender, EventArgs e)
        {
            int longitud = miCarrito.ObtenerProductos().Count();
            for (int i = 0; i < longitud; i++)
            {
                RepeaterItem item = miRepetidor.Items[i];
                TextBox txtBox = (TextBox)item.FindControl("miTextBox");
                miCarrito.ObtenerProductos()[i].Cantidad = int.Parse(txtBox.Text);
            }

            Session["compras"] = miCarrito;
            miRepetidor.DataSource = miCarrito.ObtenerProductos();
            miRepetidor.DataBind();
            costoTotal = 0;
            foreach (Articulo articulo in miCarrito.ObtenerProductos())
            {
                costoTotal += articulo.Cantidad * Math.Round(articulo.Precio, 2);
            }

        }
    }
}