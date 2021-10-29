using Sventas.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Servicios
{
    public interface VentasServi
    {
        VentasMod Save(VentasMod oVenta);
        List<VentasMod> Gets();
        VentasMod Get(int idventa);
        string Delete(int idventa);
    }
}
