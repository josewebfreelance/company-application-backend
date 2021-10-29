using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Sventas.Modelos;

namespace Sventas.Servicios
{
    public interface VentasDetalleServi
    {
        VentasDetalleMod Save(VentasDetalleMod oventasdetalle);
        List<VentasDetalleMod> Gets();
        VentasDetalleMod Get(int idventadetalle);
        string Delete(int idventadetalle);
    }
}
