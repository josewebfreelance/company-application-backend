using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Modelos
{
    public class PaginacionModel
    {
        public int por_pagina { get; set; }
        public int pagina_actual { get; set; }

        public PaginacionModel()
        {
            this.por_pagina = 2;
            this.pagina_actual = 1;

        }

        public PaginacionModel( int por_pagina, int pagina_actual)
        {
            this.por_pagina = por_pagina > 5 ? 5 : por_pagina;
            this.pagina_actual = pagina_actual < 1 ? 1 : pagina_actual;
        }
    }
}
