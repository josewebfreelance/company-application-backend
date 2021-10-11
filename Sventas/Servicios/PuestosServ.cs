using Sventas.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace Sventas.Data
{
    public interface PuestosServ
    {
        PuestosMod Save(PuestosMod oPuesto);
        List<PuestosMod> Gets();
        PuestosMod Get(int idPuesto);
        string Delete(int idpuesto);
    }
}
