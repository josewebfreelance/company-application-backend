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
    public class EmpleadosController : ControllerBase
    {

        private EmpleadosServi _EmpleadosServi;

        public EmpleadosController(EmpleadosServi oEmpleadosServi)
        {
            _EmpleadosServi = oEmpleadosServi;

        }
        // GET: api/<EmpleadosController>
        [HttpGet]
        public IEnumerable<EmpleadoMod> Get()
        {
            return _EmpleadosServi.Gets();
        }

        // GET api/<EmpleadosController>/5
        [HttpGet("{id}")]
        public EmpleadoMod Get(int id)
        {
            return _EmpleadosServi.Get(id);
        }

        // POST api/<EmpleadosController>
        [HttpPost]
        public EmpleadoMod Post([FromBody] EmpleadoMod oEmpleadoMod)
        {
            if (ModelState.IsValid) return _EmpleadosServi.Save(oEmpleadoMod);
            return null;
        }

        //// PUT api/<EmpleadosController>/5
        //[HttpPut("{id}")]
        //public void Put(int id, [FromBody] string value)
        //{
        //}

        // DELETE api/<EmpleadosController>/5
        [HttpDelete("{id}")]
        public string Delete(int id)
        {
            return _EmpleadosServi.Delete(id);
        }
    }
}
