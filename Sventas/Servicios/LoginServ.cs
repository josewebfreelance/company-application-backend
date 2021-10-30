using Sventas.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Servicios
{
    public interface LoginServi
    {
        LoginMod Save(LoginMod oLogin);
    }
}
