using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using dominio;

namespace TpCarritoEquipoA
{
    public class CarritoCompras
    {
        private List<Articulo> articulos = new List<Articulo>();

        public void AgregarProducto(Articulo articulo)
        {
            articulos.Add(articulo);
        }

        // Devuelve la cantidad de veces que el artículo dado existe en el carrito
        public int contarProducto(List <Articulo> articulos, int id)
        {
            int cantidad = 0;

            foreach (Articulo item in articulos)
            {
                if(item.IDArticulo == id)
                {
                    cantidad++;
                }
            }
            return cantidad;
        }

        public void ModificarCantidad(Articulo articulo, int cantidad)
        {

        }

        public void EliminarProducto(int id)
        {
            //FirstOrDefault es un método de LINQ (Language Integrated Query) en C#. 
            //para encontrar el primer producto en la lista que tenga el id especificado.
            Articulo productoAEliminar = articulos.FirstOrDefault(p => p.IDArticulo == id);
            //busca un elemento donde el Id del producto sea igual al id pasado como argumento.
            //El p representa cada elemento (Producto) en la lista productos.
            if (productoAEliminar != null)
            {
                articulos.Remove(productoAEliminar);
            }
        }

        public List<Articulo> ObtenerProductos()
        {
            return articulos;
        }

    }
}