using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TpCarritoEquipoA;

namespace TpCarritoEquipoA
{
    public partial class Default : System.Web.UI.Page
    {
        private CarritoCompras carrito = new CarritoCompras();
        public List<Articulo> misArticulos;
        public string urlImagen = "";
        public Articulo articulo = new Articulo();

        protected void Page_Load(object sender, EventArgs e) //ejecuta cada vez que se carga la página
        {
            if (!IsPostBack) //Verifica si la página se carga por primera vez o si se carga por una acción del usuario
            {
                //CargarProductos(); //para cargar los productos en el GridView
                DataTable dtProductos = GetProductos();
                //gvProductos.DataSource = dtProductos;
                //gvProductos.DataBind();

                DataTable dtCarrito = new DataTable();
                dtCarrito.Columns.AddRange(new DataColumn[4] { new DataColumn("Producto"), new DataColumn("Precio"), new DataColumn("Cantidad"), new DataColumn("Total") });
                ViewState["Carrito"] = dtCarrito;
            }
        }

        private DataTable GetProductos()
        {
            // Aquí deberías obtener los productos desde tu fuente de datos (base de datos, servicio web, etc.)
            ArticulosNegocio articulos = new ArticulosNegocio();
            ImagenesNegocio imagenes = new ImagenesNegocio();
            List<Imagen> misImagenes = new List<Imagen>();
            misImagenes = imagenes.listar();
            misArticulos = new List<Articulo>();
            misArticulos = articulos.listar();
            imagenes.vincularImagenes(misArticulos, misImagenes);
            Session.Add("articulos", misArticulos);
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Producto"), new DataColumn("Precio") });
            for (int i = 0; i < misArticulos.Count; i++)
            {
                dt.Rows.Add(misArticulos[i].Nombre, misArticulos[i].Precio);
            }

            return dt;
        }

        private void CalcularTotal()
        {
            DataTable dt = (DataTable)ViewState["Carrito"];
            decimal total = 0;
            foreach (DataRow row in dt.Rows)
            {
                total += Convert.ToDecimal(row["Total"]);
            }
            lblTotal.Text = "Total: " + total.ToString("C");
        }

        protected void verDetalle_OnClick(object sender, EventArgs e)
        {
            Session.Add("codigo", articulo.Codigo);

            Response.Redirect("DetalleProducto.apsx", false);
        }
    }
}