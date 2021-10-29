using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Sventas.Modelos;

namespace Sventas.Servicios
{
    public interface ComprasDetalleServi
    {
        ComprasDetalleMod Save(ComprasDetalleMod oComprasDetalleMod);
        List<ComprasDetalleMod> Gets();
        ComprasDetalleMod Get(int idcompradetalle);
        string Delete(int idcompradetalle);
    }
}
