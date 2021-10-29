using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Modelos
{
    public class VentasDetalleMod
    {
        public int idVenta_detalle { get; set; }
        public int idVenta { get; set; }
        public int idProducto { get; set; }
        public string cantidad { get; set; }
        public decimal precio_unitarui { get; set; }
        public string mensaje { get; set; }

    }
}
