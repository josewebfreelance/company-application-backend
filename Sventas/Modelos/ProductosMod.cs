using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Modelos
{
    public class ProductosMod
    {
        public int idProducto { get; set; }
        public string producto { get; set; }
        public int idMarca { get; set; }
        public string descripcion { get; set; }
        public string imagen { get; set; }

        public decimal precio_costo { get; set; }
        public decimal precio_venta { get; set; }
        public int existencia { get; set; }
        public string fecha_ingreso { get; set; }
    }
}
