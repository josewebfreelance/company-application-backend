using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Modelos
{
    public class EmpleadoMod
    {
        public int idEmpleado { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string direccion { get; set; }
        public string telefono { get; set; }
        public string DPI { get; set; }
        public string genero { get; set; }
        public DateTime fecha_nacimiento { get; set; }
        public int idPuesto { get; set; }
        public DateTime fecha_inicio_labores { get; set; }
        public DateTime fechaingreso { get; set; }

    }
}
