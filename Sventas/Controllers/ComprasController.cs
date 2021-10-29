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
    public class ComprasController : ControllerBase
    {

        private ComprasServi _ComprasServi;

        public ComprasController(ComprasServi oComprasServi)
        {
            _ComprasServi = oComprasServi;

        }
        // GET: api/<ComprasController>
        [HttpGet]
        public IEnumerable<ComprasMod> Get()
        {
            return _ComprasServi.Gets(); ;
        }

        // GET api/<ComprasController>/5
        [HttpGet("{id}")]
        public ComprasMod Get(int id)
        {
            return _ComprasServi.Get(id);
        }

        // POST api/<ComprasController>
        [HttpPost]
        public ComprasMod Post([FromBody] ComprasMod oComprasMod)
        {
            if (ModelState.IsValid) return _ComprasServi.Save(oComprasMod);
            return null;
        }

        //// PUT api/<ComprasController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        // DELETE api/<ComprasController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return _ComprasServi.Delete(id);
        }
    }
}
