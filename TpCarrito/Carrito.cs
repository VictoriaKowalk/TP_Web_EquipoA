using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TpCarrito
{
    public class CarritoCompras
    {
        //Esta lista almacena los productos que se agreguen al carrito.
        ///Se inicializa como una nueva lista vacía.
        private List<Producto> productos = new List<Producto>();

        //Agrega el producto pasado como argumento a la lista de productos.
        public void AgregarProducto(Producto producto)
        {
            productos.Add(producto);
        }

        //Eliminar un producto del carrito
        public void EliminarProducto(int id)
        {
            //FirstOrDefault es un método de LINQ (Language Integrated Query) en C#. 
            //para encontrar el primer producto en la lista que tenga el id especificado.
            Producto productoAEliminar = productos.FirstOrDefault(p => p.Id == id);
            //busca un elemento donde el Id del producto sea igual al id pasado como argumento.
            //El p representa cada elemento (Producto) en la lista productos.
            if (productoAEliminar != null)
            {
                productos.Remove(productoAEliminar);
            }
        }

        //Devuelve la lista de productos almacenada en el carrito
        public List<Producto> ObtenerProductos()
        {
            return productos;
        }



    }
}