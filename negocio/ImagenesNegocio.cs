using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dominio;

namespace negocio
{
    public class ImagenesNegocio
    {
        public List<Imagen> listar()
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("SELECT Id, IdArticulo, ImagenUrl FROM imagenes ORDER BY IdArticulo");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Imagen aux = new Imagen();
                    aux.IDImagen = (int)datos.Lector["Id"];
                    aux.IDArticulo = (int)datos.Lector["IdArticulo"];
                    aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];

                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void vincularImagenes(List<Articulo> articulos, List<Imagen> imagenes)
        // Vamos artículo por artículo y recorremos todas las imágenes para agregarlas
        // a la lista de imágenes de cada artículo, cuando sea apropiado.
        {
            foreach (Articulo miArticulo in articulos)
            {
                foreach (Imagen miImagen in imagenes)
                {
                    if (miImagen.IDArticulo.ToString() == miArticulo.IDArticulo.ToString())
                    {
                        miArticulo.Imagenes.Add(miImagen);
                    }
                }
                if (miArticulo.Imagenes.Count() == 0)
                {
                    Imagen miImagen = new Imagen
                    {
                        IDArticulo = miArticulo.IDArticulo,
                        ImagenUrl = "https://nayemdevs.com/wp-content/uploads/2020/03/default-product-image.png"
                    };
                    miArticulo.Imagenes.Add(miImagen);
                }
            }
        }
    }
}
