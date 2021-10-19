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
    public class ProveedoresController : ControllerBase
    {

        private ProveedoresServi _proveedoresserv;

        public ProveedoresController(ProveedoresServi oproveedoresservi)
        {
            _proveedoresserv = oproveedoresservi;

        }
        // GET: api/<ProveedoresController>
        [HttpGet]
        public IEnumerable<ProveedoresMod> Get()
        {
            return _proveedoresserv.Gets();
        }

        // GET api/<ProveedoresController>/5
        [HttpGet("{id}")]
        public ProveedoresMod Get(int id)
        {
            return _proveedoresserv.Get(id);
        }

        // POST api/<ProveedoresController>
        [HttpPost]
        public ProveedoresMod Post([FromBody] ProveedoresMod oproveedoresmod)
        {
            if (ModelState.IsValid) return _proveedoresserv.Save(oproveedoresmod);
            return null;
        }

        //// PUT api/<ProveedoresController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        // DELETE api/<ProveedoresController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return _proveedoresserv.Delete(id);
        }
    }
}
