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
    public class EmpleadoDat : EmpleadosServi
    {
        EmpleadoMod _oempleado = new EmpleadoMod();
        List<EmpleadoMod> _oempleados = new List<EmpleadoMod>();
        public string Delete(int idempleado)
        {
            string mensaje = "";

            try
            {
                _oempleado = new EmpleadoMod()
                {
                    idEmpleado = idempleado
                };

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var empleado = con.Query<EmpleadoMod>("SP_EMPLEADOS", this.SetParameters(_oempleado, (int)OpcionSP.Delete),
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

        public EmpleadoMod Get(int idempleado)
        {
            _oempleado = new EmpleadoMod();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();
                var query = ("SELECT *FROM EMPLEADOS WHERE idEmpleado = " + idempleado);

                var oempleados = con.Query<EmpleadoMod>(query).ToList();

                if (oempleados != null && oempleados.Count() > 0)
                {
                    _oempleado = oempleados.SingleOrDefault();
                }
            }
            return _oempleado;
        }

        public List<EmpleadoMod> Gets()
        {
            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var query = "SELECT *FROM EMPLEADOS";

                var oempleados = con.Query<EmpleadoMod>(query).ToList();

                if (oempleados != null && oempleados.Count() > 0)
                {
                    _oempleados = oempleados;
                }
            }
            return _oempleados;
        }

        public EmpleadoMod Save(EmpleadoMod oEmpleado)
        {
            _oempleado = new EmpleadoMod();
            try
            {
                int opcSP = Convert.ToInt32(oEmpleado.idEmpleado == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var oempleados = con.Query<EmpleadoMod>("SP_EMPLEADOS", this.SetParameters(oEmpleado, opcSP),

                        commandType: CommandType.StoredProcedure);

                    if (oempleados != null && oempleados.Count() > 0)
                    {
                        _oempleado = oempleados.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {


            }
            return _oempleado;
        }
        private DynamicParameters SetParameters(EmpleadoMod oempleado, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@idEmpleado", oempleado.idEmpleado);
            parameters.Add("@nombre", oempleado.nombre);
            parameters.Add("@apellido", oempleado.apellido);
            parameters.Add("@direccion", oempleado.direccion);
            parameters.Add("@telefono", oempleado.telefono);
            parameters.Add("@DPI", oempleado.DPI);
            parameters.Add("@genero", oempleado.genero);
            parameters.Add("@fecha_nacimiento", oempleado.fecha_nacimiento);
            parameters.Add("@idPuesto", oempleado.idPuesto);
            parameters.Add("@fecha_inicio_labores", oempleado.fecha_inicio_labores);
            parameters.Add("@fechaingreso", oempleado.fechaingreso);
            parameters.Add("@OPC", opcSP);
            parameters.Add("@cMensaje", opcSP);
            return parameters;
        }
    }
}
