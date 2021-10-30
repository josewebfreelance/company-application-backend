using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Modelos
{
    public class VentasMod
    {
        
        public int idVenta { get; set; }
        public int nofactura { get; set; }
        public string serie { get; set; }
        public DateTimeOffset fechafactura { get; set; }
        public int idCliente { get; set; }
        public int idEmpleado { get; set; }
        public DateTimeOffset fechaingreso { get; set; }

        public int estadoVenta { get; set; }



    }
}
