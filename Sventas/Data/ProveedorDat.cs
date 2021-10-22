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
    public class ProveedorDat : ProveedorServi
    {
        ProveedorMod _oproveedor = new ProveedorMod();
        List<ProveedorMod> _oproveedores = new List<ProveedorMod>();
        public string Delete(int idproveedor)
        {
            string mensaje = "";

            try
            {
                _oproveedor = new ProveedorMod()
                {
                    idProveedor = idproveedor
                };

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var oproveedores = con.Query<ProveedorMod>("SP_PROVEEDORES", this.SetParameters(_oproveedor, (int)OpcionSP.Delete),
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

        public ProveedorMod Get(int idProveedor)
        {
            _oproveedor = new ProveedorMod();

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();
                var query =("SELECT *FROM PROVEEDORES WHERE idProveedor = " + idProveedor);

                var oproveedores = con.Query<ProveedorMod>(query).ToList();

                if (oproveedores != null && oproveedores.Count() > 0)
                {
                    _oproveedor = oproveedores.SingleOrDefault();
                }
            }
            return _oproveedor;
        }

        public List<ProveedorMod> Gets()
        {

            using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
            {
                if (con.State == ConnectionState.Closed) con.Open();

                var query = "select *from proveedores";

                var oproveedores = con.Query<ProveedorMod>(query).ToList();

                if (oproveedores != null && oproveedores.Count() > 0)
                {
                    _oproveedores = oproveedores;
                }
            }
            return _oproveedores;
        }

        public ProveedorMod Save(ProveedorMod oProveedor)
        {
            _oproveedor = new ProveedorMod();
            try
            {
                int opcSP = Convert.ToInt32(oProveedor.idProveedor == 0 ? OpcionSP.Insert : OpcionSP.Update);

                using (IDbConnection con = new SqlConnection(Cglobal.ConnectionString))
                {
                    if (con.State == ConnectionState.Closed) con.Open();

                    var oproveedores = con.Query<ProveedorMod>("SP_PROVEEDORES", this.SetParameters(oProveedor, opcSP),

                        commandType: CommandType.StoredProcedure);

                    if (oproveedores != null && oproveedores.Count() > 0)
                    {
                        _oproveedor = oproveedores.FirstOrDefault();
                    }
                }
            }
            catch (Exception ex)
            {

               
            }
            return _oproveedor;
        }

        private DynamicParameters SetParameters(ProveedorMod oproveedor, int opcSP)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("@idproveedor", oproveedor.idProveedor);
            parameters.Add("@proveedor", oproveedor.proveedor);
            parameters.Add("@nit", oproveedor.nit);
            parameters.Add("@direccion", oproveedor.direccion);
            parameters.Add("@telefono", oproveedor.telefono);
            parameters.Add("@OPC", opcSP);
            parameters.Add("@cMensaje", opcSP);
            return parameters;
        }

    }
}
