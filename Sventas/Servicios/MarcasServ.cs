using Sventas.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sventas.Servicios
{
   
        public interface MarcasServi
        {
            MarcasMod Save(MarcasMod oMarca);
            List<MarcasMod> Gets();
            MarcasMod Get(int idMarca);
            string Delete(int idMarca);
        }
    }

