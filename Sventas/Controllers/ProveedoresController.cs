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
        private ProveedorServi _proveedoresServ;

        public ProveedoresController(ProveedorServi oproveedorServi)
        {
            _proveedoresServ = oproveedorServi;

        }



        // GET: api/<ProveedoresController>
        [HttpGet]
        public IEnumerable<ProveedorMod> Get()
        {
            return _proveedoresServ.Gets();
        }

        // GET api/<ProveedoresController>/5
        [HttpGet("{id}")]
        public ProveedorMod Get(int id)
        {
            return _proveedoresServ.Get(id);
        }

        // POST api/<ProveedoresController>
        [HttpPost]
        public ProveedorMod Post([FromBody] ProveedorMod oproveedoresMod)
        {
            if (ModelState.IsValid) return _proveedoresServ.Save(oproveedoresMod);
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
            return _proveedoresServ.Delete(id);
        }
    }
}
