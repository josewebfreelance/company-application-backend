using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Modelos
{
    public class ComprasDetalleMod
    {
        public int idCompra_detalle { get; set; }
        public int idCompra { get; set; }
        public int idProducto { get; set; }
        public int cantidad { get; set; }
        public decimal precio_costo_unitario { get; set; }

        public string mensaje { get; set; }


    }
}
