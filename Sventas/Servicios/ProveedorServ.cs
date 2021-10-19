using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Sventas.Modelos;

namespace Sventas.Servicios
{
    public interface ProveedorServi
    {
        ProveedorMod Save(ProveedorMod oProveedor);
        List<ProveedorMod> Gets();
        ProveedorMod Get(int idproveedor);
        string Delete(int idproveedor);

    }
}
