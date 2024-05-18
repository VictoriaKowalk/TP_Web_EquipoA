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
                GetProductos();
                ddlFiltrarPor.Items.Add("Precio");
                ddlFiltrarPor.Items.Add("Categoría");
                ddlFiltrarPor.Items.Add("Marca");
                ddlFiltrarPor.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                ddlFiltrarPor.SelectedIndex = 0;

                ddlCriterio.Items.Insert(0, new ListItem(string.Empty, string.Empty));
                ddlCriterio.SelectedIndex = 0;
            }
        }

        private void GetProductos()
        {
            ArticulosNegocio articulos = new ArticulosNegocio();
            ImagenesNegocio imagenes = new ImagenesNegocio();
            List<Imagen> misImagenes = new List<Imagen>();
            misImagenes = imagenes.listar();
            misArticulos = new List<Articulo>();
            misArticulos = articulos.listar();
            imagenes.vincularImagenes(misArticulos, misImagenes);
            if (Session["articulos"] == null)
            {
                Session.Add("articulos", misArticulos);
            } else
            {
                Session["articulos"] = misArticulos;
            }
            
        }

        protected void verDetalle_OnClick(object sender, EventArgs e)
        {
            Session.Add("codigo", articulo.Codigo);

            Response.Redirect("DetalleProducto.apsx", false);
        }

        protected void ddlCriterio_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["criterio"] = ddlCriterio.SelectedItem.ToString();
        }

        protected void ddlFiltrarPor_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session.Add("campo", ddlFiltrarPor.SelectedItem.ToString());
 
            if (ddlFiltrarPor.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Clear();
                ddlCriterio.Items.Add("Ascendente");
                ddlCriterio.Items.Add("Descendente");
                Session.Add("criterio", ddlCriterio.SelectedItem.ToString());
            }
            else if(ddlFiltrarPor.SelectedItem.ToString() == "Marca")
            {
                ddlCriterio.Items.Clear();
                //llamar a base de datos, listar marcas
                MarcasNegocio marcasNegocios = new MarcasNegocio();
                List<Marca> misMarcas = marcasNegocios.listar();
                foreach(Marca item in misMarcas)
                {
                    ddlCriterio.Items.Add(item.Nombre);
                }
                Session.Add("criterio", ddlCriterio.SelectedItem.ToString());

            } else if(ddlFiltrarPor.SelectedItem.ToString() == "Categoría")
            {
                ddlCriterio.Items.Clear();
                // llamar a base de datos, listar categorías
                CategoriasNegocio categoriasNegocios = new CategoriasNegocio();
                List<Categoria> misCategorias = categoriasNegocios.listar();
                foreach (Categoria item in misCategorias)
                {
                    ddlCriterio.Items.Add(item.Nombre);
                }
                Session.Add("criterio", ddlCriterio.SelectedItem.ToString());
            }
            else
            {
                ddlCriterio.Items.Clear();
                GetProductos();
            }
        }

        protected void btnAplicarFiltro_Click(object sender, EventArgs e)
        {
            ArticulosNegocio articulos = new ArticulosNegocio();
            ImagenesNegocio imagenes = new ImagenesNegocio();
            List<Imagen> misImagenes = imagenes.listar();
            misArticulos = new List<Articulo>();
            string campo = (string)Session["campo"];
            string criterio = (string)Session["criterio"];
            misArticulos = articulos.listarFiltrados(campo, criterio);
            imagenes.vincularImagenes(misArticulos, misImagenes);
            Session["articulos"] = misArticulos;
        }

        protected void btnLimpiarFiltro_Click(object sender, EventArgs e)
        {
            ddlFiltrarPor.SelectedIndex = 0;
            ddlCriterio.Items.Insert(0, new ListItem(string.Empty, string.Empty));
            ddlCriterio.SelectedIndex = 0;

            ArticulosNegocio articulos = new ArticulosNegocio();
            ImagenesNegocio imagenes = new ImagenesNegocio();
            List<Imagen> misImagenes = new List<Imagen>();
            misImagenes = imagenes.listar();
            misArticulos = new List<Articulo>();
            misArticulos = articulos.listar();
            imagenes.vincularImagenes(misArticulos, misImagenes);
            if (Session["articulos"] == null)
            {
                Session.Add("articulos", misArticulos);
            }
            else
            {
                Session["articulos"] = misArticulos;
            }
            Session["articulos"] = misArticulos;
        }
    }
}
