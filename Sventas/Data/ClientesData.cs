using Dapper;
using Sventas.comun;
using Sventas.Modelos;
using Sventas.Servicios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using static Sventas.comun.OpcionesSP;

namespace Sventas.Data
{
    public class ClientesData : ClientesServi
    {
        ClientesMod _ocliente = new ClientesMod();
        List<ClientesMod> _oclientes = new List<ClientesMod>();
        public string Delete(int idcliente)
        {
            //string mensaje = "";

            try
            {
                _ocliente = new ClientesMod()
                {
                    idcliente = idcliente //primero es el el parametro de la clase modelo y luedo el parametro del metodo en este caso Delete
                };

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var oclientes = con.Query<ClientesMod>("SP_CLIENTES", this.SetParameters(_ocliente, (int)OpcionSP.Delete),
                        commandType: CommandType.StoredProcedure);

                   // mensaje = "Registro Eliminado";
                }

            }
            catch (Exception ex)
            {

                //mensaje = ex.Message;
            }

            return null;
        }

        public ClientesMod Get(int idcliente)
        {
            _ocliente = new ClientesMod();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var oclientes = con.Query<ClientesMod>("SELECT *FROM CLIENTES WHERE idCliente = " + idcliente).ToList();

                if (oclientes != null && oclientes.Count() > 0)
                {
                    _ocliente = oclientes.SingleOrDefault();
                }
            }
            return _ocliente;
        }

        public List<ClientesMod> Gets()
        {
            _oclientes = new List<ClientesMod>();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var oclientes = con.Query<ClientesMod>("SELECT *FROM CLIENTES").ToList();

                if (oclientes != null && oclientes.Count() > 0)
                {
                    _oclientes = oclientes;
                }
            }
            return _oclientes;
        }

        public ClientesMod Save(ClientesMod pCliente)
        {
            _ocliente = new ClientesMod();
            try
            {
                int opcSP = Convert.ToInt32(pCliente.idcliente == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var oclientes = con.Query<ClientesMod>("SP_CLIENTES", this.SetParameters(pCliente, opcSP),

                        commandType: CommandType.StoredProcedure);

                    if (oclientes != null && oclientes.Count() > 0)
                    {
                        _ocliente = oclientes.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {

            }
            return _ocliente;
        }

        private DynamicParameters SetParameters(ClientesMod oclientes, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@idcliente", oclientes.idcliente);
            parameters.Add("@nombres", oclientes.nombres);
            parameters.Add("@apellidos", oclientes.apellidos);
            parameters.Add("@nit", oclientes.nit);
            parameters.Add("@genero", oclientes.genero);
            parameters.Add("@telefono", oclientes.telefono);
            parameters.Add("@correo", oclientes.correo);
            parameters.Add("@fecha_ingreso", oclientes.fecha_ingreso);
            parameters.Add("@OPC", opcSP);
            return parameters;
        }
    }
}
