using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace TpCarritoEquipoA
{
    public class ArticulosNegocio
    {
        public List<Articulo> listar()
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setConsulta("SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion AS Descripcion, M.Descripcion AS Marca, C.Descripcion AS Categoria, Precio, M.Id AS IDMarca, C.Id AS IDCategoria FROM Articulos AS A, Marcas AS M, Categorias AS C WHERE M.Id = A.IdMarca AND C.Id = A.IdCategoria ORDER BY Codigo");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                   
                    aux.IDArticulo = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];

                    aux.Marca = new Marca();
                    aux.Marca.Nombre = (string)datos.Lector["Marca"];
                    aux.Marca.IDMarca = (int)datos.Lector["IDMarca"];

                    aux.Categoria = new Categoria();
                    aux.Categoria.Nombre = (string)datos.Lector["Categoria"];
                    aux.Categoria.IDCategoria = (int)datos.Lector["IDCategoria"];

                    aux.Precio = (decimal)datos.Lector["Precio"];

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

        public int obtenerIDArticulo()
        {
            AccesoDatos datos = new AccesoDatos();
            Articulo nuevo = new Articulo();

            try
            {
                datos.setConsulta("SELECT * FROM Articulos WHERE ID = (SELECT MAX(ID) FROM Articulos);");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    nuevo.IDArticulo = (int)datos.Lector["Id"];
                }

                return nuevo.IDArticulo;

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

        public List<Articulo> listarFiltrados(string campo, string criterio)
        {
            List < Articulo > lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT A.Id, A.Codigo, A.Nombre, A.Descripcion AS Descripcion, M.Descripcion AS Marca, C.Descripcion AS Categoria, Precio, M.Id AS IDMarca, C.Id AS IDCategoria FROM Articulos AS A, Marcas AS M, Categorias AS C  WHERE M.Id = A.IdMarca AND C.Id = A.IdCategoria ";
                if (campo == "Precio")
                {
                    switch (criterio)
                    {
                        case "Ascendente":
                            consulta += "ORDER BY Precio ASC";
                            break;
                        case "Descendente":
                            consulta += "ORDER BY Precio DESC";
                            break;
                    }
                }
                else if (campo == "Categoría")
                {
                    consulta += "AND C.Descripcion = '" + criterio + "' ";
                }
                else if (campo == "Marca")
                {
                    consulta += "AND M.Descripcion = '" + criterio + "' ";
                }

                datos.setConsulta(consulta);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();

                    aux.IDArticulo = (int)datos.Lector["Id"];
                    aux.Codigo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Precio = (decimal)datos.Lector["Precio"];

                    aux.Marca = new Marca();
                    aux.Marca.Nombre = (string)datos.Lector["Marca"];
                    aux.Marca.IDMarca = (int)datos.Lector["IDMarca"];

                    aux.Categoria = new Categoria();
                    aux.Categoria.Nombre = (string)datos.Lector["Categoria"];
                    aux.Categoria.IDCategoria = (int)datos.Lector["IDCategoria"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}

