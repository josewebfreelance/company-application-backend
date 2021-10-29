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
    [Route("api/[controller]")]
    [ApiController]
    public class VentasDetalleController : ControllerBase
    {
        private VentasDetalleServi _VentasDetalleServi;

        public VentasDetalleController(VentasDetalleServi oVentasDetalleServi)
        {
            _VentasDetalleServi = oVentasDetalleServi;

        }
        // GET: api/<VentasDetalleController>
        [HttpGet]
        public IEnumerable<VentasDetalleMod> Get()
        {
            return _VentasDetalleServi.Gets();
        }

        // GET api/<VentasDetalleController>/5
        [HttpGet("{id}")]
        public VentasDetalleMod Get(int id)
        {
            return _VentasDetalleServi.Get(id);
        }

        // POST api/<VentasDetalleController>
        [HttpPost]
        public VentasDetalleMod Post([FromBody] VentasDetalleMod oventasDetalleMod)
        {
            if (ModelState.IsValid) return _VentasDetalleServi.Save(oventasDetalleMod);
            return null;
        }

        // PUT api/<VentasDetalleController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<VentasDetalleController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return _VentasDetalleServi.Delete(id);
        }
    }
}
