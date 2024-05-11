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

        /*protected void gvProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Agregar")
            {
                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                int rowIndex = row.RowIndex;

                TextBox txtCantidad = (TextBox)gvProductos.Rows[rowIndex].FindControl("txtCantidad");
                int cantidad = int.Parse(txtCantidad.Text);

                DataTable dtCarrito = (DataTable)ViewState["Carrito"];
                DataRow dr = dtCarrito.NewRow();
                //dr["Producto"] = gvProductos.Rows[rowIndex].Cells[0].Text;
                dr["Precio"] = gvProductos.Rows[rowIndex].Cells[1].Text;
                dr["Cantidad"] = cantidad;
                dr["Total"] = int.Parse(gvProductos.Rows[rowIndex].Cells[1].Text) * cantidad;
                dtCarrito.Rows.Add(dr);

                ViewState["Carrito"] = dtCarrito;
                gvCarrito.DataSource = dtCarrito;
                gvCarrito.DataBind();

                CalcularTotal();
            }
        }*/

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
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[2] { new DataColumn("Producto"), new DataColumn("Precio") });
            for(int i=0; i < misArticulos.Count; i++)
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

        protected void Botoncito_Click(object sender, EventArgs e)
        {
            Articulo nuevoArticulo = new Articulo();
            //nuevoArticulo.Nombre = ???;
            //nuevoArticulo.Precio = ???;
            carrito.AgregarProducto(nuevoArticulo);
        }
    }
    /*protected void GridViewProductos_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Eliminar")
        {
            int idProducto = Convert.ToInt32(e.CommandArgument); //Obtiene el argumento del comando, que es el ID del producto a eliminar, y lo convierte a un entero.
            carrito.EliminarProducto(idProducto);
            CargarProductos(); //recarga los productos en el GridView después de eliminar 
        }
    }

    private void CargarProductos()
    {

    }*/
}