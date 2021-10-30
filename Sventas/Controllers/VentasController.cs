using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Sventas.Modelos;
using Sventas.Servicios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Sventas.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class VentasController : ControllerBase
    {
        private VentasServi _VentasServi;

        public VentasController(VentasServi oVentasServi)
        {
            _VentasServi = oVentasServi;

        }
        // GET: api/<VentasController>
        [HttpGet]
        public IEnumerable<VentasMod> Get()
        {
            return _VentasServi.Gets();
        }

        // GET api/<VentasController>/5
        [HttpGet("{id}")]
        public VentasMod Get(int id)
        {
            return _VentasServi.Get(id);
        }

        // POST api/<VentasController>
        [HttpPost]
        public VentasMod Post([FromBody] VentasMod oventasMod)
        {
            if (ModelState.IsValid) return _VentasServi.Save(oventasMod);
            return null;
        }

        //// PUT api/<VentasController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        // DELETE api/<VentasController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return _VentasServi.Delete(id);
        }
    }
}
