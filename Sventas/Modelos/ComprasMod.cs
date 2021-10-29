using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Modelos
{
    public class ComprasMod
    {

        public int idCompra { get; set; }
        public int no_orden_compra { get; set; }
        public int idProveedor { get; set; }

        public DateTimeOffset fecha_orden { get; set; }
        public DateTimeOffset fechaingreso { get; set; }
    }
}
