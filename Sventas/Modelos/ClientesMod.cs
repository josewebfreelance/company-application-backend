using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Modelos
{
    public class ClientesMod
    {
        public int idcliente { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public string nit { get; set; }

        public string genero { get; set; }

        public string telefono { get; set; }
        public string correo { get; set; }
        public DateTime fechaingreso { get; set; }
    }
}
