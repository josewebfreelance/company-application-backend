using Microsoft.AspNetCore.Mvc;
using Sventas.Data;
using Sventas.Modelos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Sventas.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PuestosController : ControllerBase
    {

        private PuestosServ _puestoServ;

        public PuestosController(PuestosServ opuestoServ)
        {
            _puestoServ = opuestoServ;

        }
        // GET: api/<PuestosController>
        [HttpGet]
        public IEnumerable<PuestosMod> Get()
        {
            return _puestoServ.Gets();
        }

        // GET api/<PuestosController>/5
        [HttpGet("{id}")]
        public PuestosMod Get(int id)
        {
            return _puestoServ.Get(id);
        }

        // POST api/<PuestosController>
        [HttpPost]
        public PuestosMod Post([FromBody] PuestosMod opuestomod)
        {
            if (ModelState.IsValid) return _puestoServ.Save(opuestomod);
            return null;
        }

        // PUT api/<PuestosController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<PuestosController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return _puestoServ.Delete(id);
        }
    }
}
