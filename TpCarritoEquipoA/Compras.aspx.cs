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

            if (Request.QueryString["id"] != null)
            {
                bool estaAgregado = false;
                int id = int.Parse(Request.QueryString["id"]);
                int cant = int.Parse(Request.QueryString["cant"]);
                artAgregado = ((List<Articulo>)Session["articulos"]).Find(x => x.IDArticulo == id);
                artAgregado.Cantidad = cant;
                foreach(Articulo articulo in miCarrito.ObtenerProductos())
                {
                    if (articulo.IDArticulo == artAgregado.IDArticulo){
                        articulo.Cantidad += artAgregado.Cantidad;
                        estaAgregado = true;
                    }
                }
                if (!estaAgregado)
                {
                    miCarrito.AgregarProducto(artAgregado);
                    estaAgregado = true;
                }
            }
            foreach(Articulo articulo in miCarrito.ObtenerProductos())
            {
               
                costoTotal += articulo.Cantidad * articulo.Precio; 
            }
        }

        protected void btnEliminarProducto_Click(object sender, ImageClickEventArgs e)
        {
        }
    }
}