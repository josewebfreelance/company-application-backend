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
    public class MarcasController : ControllerBase

    {

        private MarcasServi _marcasserv;

        public MarcasController(MarcasServi omarcasServi)
        {
            _marcasserv = omarcasServi;

        }

        // GET: api/<MarcasController>
        [HttpGet]
        public IEnumerable<MarcasMod> Get()
        {
            return _marcasserv.Gets();
        }

        // GET api/<MarcasController>/5
        [HttpGet("{id}")]
        public MarcasMod Get(int id)
        {
            return _marcasserv.Get(id);

        }

        // POST api/<MarcasController>
        [HttpPost]
        public MarcasMod Post([FromBody] MarcasMod omarcasmod)
        {
            if (ModelState.IsValid) return _marcasserv.Save(omarcasmod);
            return null;
        }

        // PUT api/<MarcasController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<MarcasController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return _marcasserv.Delete(id);
        }
    }
}
