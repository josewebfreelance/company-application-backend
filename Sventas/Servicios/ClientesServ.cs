using Sventas.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Servicios
{
    public interface ClientesServi
    {
        ClientesMod Save(ClientesMod pCliente);
        List<ClientesMod> Gets();
        ClientesMod Get(int idcliente);
        string Delete(int idcliente);
    }
}
