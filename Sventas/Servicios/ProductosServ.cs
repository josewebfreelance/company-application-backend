using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Sventas.Modelos;

namespace Sventas.Servicios
{
    public interface ProductosServi
    {
        ProductosMod Save(ProductosMod oProductos);
        List<ProductosMod> Gets();
        ProductosMod Get(int idproducto);
        string Delete(int idproducto);
    }
}
