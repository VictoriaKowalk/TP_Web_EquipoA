using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace TpCarrito
{
    public partial class Carrito : System.Web.UI.Page
    {
        private CarritoCompras carrito = new CarritoCompras();

        public object GridViewProductos { get; private set; }

        protected void Page_Load(object sender, EventArgs e) //ejecuta cada vez que se carga la página
        {
            if (!IsPostBack) //Verifica si la página se carga por primera vez o si se carga por una acción del usuario
            {
                CargarProductos(); //para cargar los productos en el GridView
            }
        }

        protected void GridViewProductos_RowCommand(object sender, GridViewCommandEventArgs e)
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
            GridViewProductos.DataSource = carrito.ObtenerProductos();
            GridViewProductos.DataBind();
        }
    }
}
