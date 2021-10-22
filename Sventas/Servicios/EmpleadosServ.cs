using Sventas.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Servicios
{
    public interface EmpleadosServi
    {
        EmpleadoMod Save(EmpleadoMod oEmpleado);
        List<EmpleadoMod> Gets();
        EmpleadoMod Get(int idempleado);
        string Delete(int idempleado);
    }
}
