using Sventas.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Servicios
{
    public interface ComprasServi
    {
        ComprasMod Save(ComprasMod oCompra);
        List<ComprasMod> Gets();
        ComprasMod Get(int idcompra);
        string Delete(int idcompra);
    }
}
