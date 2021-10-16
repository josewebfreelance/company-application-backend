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
    public class ClientesController : ControllerBase
    {

        private ClientesServi _clientesservi;

        public ClientesController(ClientesServi oclientesServi)
        {
            _clientesservi = oclientesServi;

        }
        // GET: api/<ClientesController>
        [HttpGet]
        public IEnumerable<ClientesMod> Get()
        {
            return _clientesservi.Gets();
        }

        // GET api/<ClientesController>/5
        [HttpGet("{id}")]
        public ClientesMod Get(int id)
        {
            return _clientesservi.Get(id);
        }

        // POST api/<ClientesController>
        [HttpPost]
        public ClientesMod Post([FromBody] ClientesMod oclientesmod)
        {
            if (ModelState.IsValid) return _clientesservi.Save(oclientesmod);
            return null;
        }

        // PUT api/<ClientesController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<ClientesController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return _clientesservi.Delete(id);
        }
    }
}
