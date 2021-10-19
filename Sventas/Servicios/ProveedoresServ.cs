using Sventas.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Servicios
{
    public interface ProveedoresServi
    {

        ProveedoresMod Save(ProveedoresMod omProveedor);
        List<ProveedoresMod> Gets();
        ProveedoresMod Get(int idProveedor);
        string Delete(int idProveedor);

    }
}
