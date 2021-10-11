using Dapper;
using Sventas.comun;
using Sventas.Modelos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using static Sventas.comun.OpcionesSP;

namespace Sventas.Data
{
    public class PuestosDat : PuestosServ
    {
        PuestosMod _opuesto = new PuestosMod();
        List<PuestosMod> _opuestos = new List<PuestosMod>(); 
        public string Delete(int idpuesto)
        {
            string mensaje = "";

            try
            {
                _opuesto = new PuestosMod()
                {
                    idPuesto = idpuesto
                };

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var opuestos = con.Query<PuestosMod>("SP_PUESTOS", this.SetParameters(_opuesto,(int)OpcionSP.Delete),
                        commandType: CommandType.StoredProcedure);

                    mensaje = "Registro Eliminado";
                }

            }
            catch (Exception ex)
            {

                mensaje = ex.Message;
            }

            return mensaje;
        }

        public PuestosMod Get(int idPuesto)
        {
            _opuesto = new PuestosMod();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var opuestos = con.Query<PuestosMod>("SELECT *FROM PUESTOS WHERE idPuesto = "+idPuesto).ToList();

                if (opuestos != null && opuestos.Count() > 0)
                {
                    _opuesto = opuestos.SingleOrDefault();
                }
            }
            return _opuesto;
        }

        public List<PuestosMod> Gets()
        {
            _opuestos = new List<PuestosMod>();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var opuestos = con.Query<PuestosMod>("SELECT *FROM PUESTOS").ToList();

                if (opuestos != null && opuestos.Count() > 0)
                {
                    _opuestos = opuestos;
                }
            }
            return _opuestos;
        }

        public PuestosMod Save(PuestosMod oPuesto)
        {
            _opuesto = new PuestosMod();
            try
            {
                int opcSP = Convert.ToInt32(oPuesto.idPuesto == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var opuestos = con.Query<PuestosMod>("SP_PUESTOS", this.SetParameters(oPuesto, opcSP), 
                        commandType:CommandType.StoredProcedure);

                    if(opuestos != null && opuestos.Count() > 0)
                    {
                        _opuesto = opuestos.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {

                _opuesto.mensajes = ex.Message;
            }
            return _opuesto;
        }

        private DynamicParameters SetParameters(PuestosMod opuesto, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@idpuesto", opuesto.idPuesto);
            parameters.Add("@puesto", opuesto.puesto1);
            parameters.Add("@OPC",opcSP);
            return parameters;
        }





    }
}
