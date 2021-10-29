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
    public class ComprasDetalleController : ControllerBase
    {

        private ComprasDetalleServi _ComprasDetalleServi;

        public ComprasDetalleController(ComprasDetalleServi oComprasDetalleServi)
        {
            _ComprasDetalleServi = oComprasDetalleServi;

        }
        // GET: api/<ComprasDetalleController>
        [HttpGet]
        public IEnumerable<ComprasDetalleMod> Get()
        {
            return _ComprasDetalleServi.Gets();
        }

        // GET api/<ComprasDetalleController>/5
        [HttpGet("{id}")]
        public ComprasDetalleMod Get(int id)
        {
            return _ComprasDetalleServi.Get(id);
        }

        // POST api/<ComprasDetalleController>
        [HttpPost]
        public ComprasDetalleMod Post([FromBody] ComprasDetalleMod ocomprasDetalleMod)
        {

            if (ModelState.IsValid) return _ComprasDetalleServi.Save(ocomprasDetalleMod);
            return null;
        }

        //// PUT api/<ComprasDetalleController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        // DELETE api/<ComprasDetalleController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return _ComprasDetalleServi.Delete(id);
        }
    }
}
